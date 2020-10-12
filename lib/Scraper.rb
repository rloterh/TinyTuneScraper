class Scraper
  require_relative '../lib/csv_handler.rb'
  attr_accessor :post_game, :sub_path, :index_path, :has_index, :choice_input
  def initialize
    @post_game = ''
    @sub_path = ''
    @index_path = ''
    @has_index = true
    @choice_input = ''
  end

  $csv_o = CSVHandler.new

  def check_choice
    @choice_input = gets.strip.upcase
    if @choice_input.match(/^[[:alpha:]]$/)
      @sub_path = "?letter=#{@choice_input}"
    elsif @choice_input == 'POP'
      @sub_path = ''
      @index_path = ''
    elsif @choice_input == 'MORE'
      @sub_path = '?letter=*'
    else
      puts "          PLEASE INPUT A CORRECT OPTION TO CONTINUE..\n"
      check_choice
    end
  end

  def scrape
    url = "https://apps.apple.com/us/genre/ios-games/id6014/#{@sub_path}#{@index_path}"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    games_array = []

    parsed_page.css('[id = "content"]').css('[id = "selectedgenre"]').css('[id = "selectedcontent"]').map do |a|
      @post_game = a.text
      games_array.push(@post_game)
    end

    $csv_o.write_content(games_array)
    $csv_o.print_content

    # Pry.start(binding)
  end

  def check_index
    goto_next_index = "press '>' or (.) to goto next indexed Page for Games indexed #{@choice_input}"
    goto_prev_index = "press '<' or (,) to goto previous indexed for Games indexed #{@choice_input}"
    page_index = 1
    page_index = 1 if page_index == 0
    if @sub_path == ''
      goto_next_index = ''
      goto_prev_index = ''
      puts 'Thanks for scraping iTunes App Store games'
        sleep(2)
        puts "Exiting Scraper now..\n\n"
        sleep(1)
      return
    end

    if page_index == 1
      puts ":::This is Page No. #{page_index} of iTunes App Store games of index #{@choice_input}:::\n\t:::Also see output in << iOSGames.csv >> file:::\n\n"
      goto_prev_index = ''
    end
    while @has_index

      goto_prev_index = "press '<' or (,) to goto previous indexed Page for Games indexed #{@choice_input}" if page_index >= 2

      puts "#{goto_next_index}"
      puts "#{goto_prev_index}"

      next_input = STDIN.getch

      case next_input
      when '.'
        page_index += 1
        @index_path = "&page=#{page_index}#page"
        scrape
      when ','
        page_index -= 1
        @index_path = "&page=#{page_index}#page"
        scrape
      end
      puts ":::This is Page No. #{page_index} of iTunes App Store games index #{@choice_input}:::\n\t:::Also see output in << iOSGames.csv >> file:::\n\n"
      if @post_game.size < 500
        @has_index = false
        puts 'Thanks for scraping iTunes App Store games'
        sleep(2)
        puts "Exiting Scraper now..\n\n"
        sleep(1)
      end
    end
  end
end
