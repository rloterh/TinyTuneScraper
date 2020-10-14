require_relative '../lib/csv_handler'

class Scraper
  include CSVHandler
  attr_accessor :post_game, :sub_path, :index_path, :has_index, :choice_input, :page_index, :goto_next_index, :goto_prev_index
  def initialize
    @post_game = ''
    @sub_path = ''
    @index_path = ''
    @has_index = true
    @choice_input = ''
    @page_index = nil
    @goto_next_index = ''
    @goto_prev_index = ''
  end

  def check_choice(c_input)
    @choice_input = c_input
    if @choice_input.match(/^[[:alpha:]]$/)
      @sub_path = "?letter=#{@choice_input}"
    elsif @choice_input == 'POP'
      @sub_path = ''
      @index_path = ''
    elsif @choice_input == 'MORE'
      @sub_path = '?letter=*'
    else
      display_caution
      check_choice(c_input)
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

    write_content(games_array)
    print_content
  end

  def check_index
    @goto_next_index = "press '>' or (.) to goto next indexed Page for Games indexed #{@choice_input}"
    @goto_prev_index = "press '<' or (,) to goto previous indexed for Games indexed #{@choice_input}"
    @page_index = 1
    @page_index = 1 if @page_index == 0
    if @sub_path == ''
      @goto_next_index = ''
      @goto_prev_index = ''
      exit_remarks
      return
    end

    if @page_index == 1
      index_info
      @goto_prev_index = ''
    end
    while @has_index
      if page_index >= 2
        @goto_prev_index = "press '<' or (,) to goto previous indexed Page for Games indexed #{@choice_input}"
      end
      navigate_index

      next_input = STDIN.getch

      case next_input
      when '.'
        @page_index += 1
        @index_path = "&page=#{@page_index}#page"
        scrape
      when ','
        @page_index -= 1
        @index_path = "&page=#{@page_index}#page"
        scrape
      end
      index_info
      if @post_game.size < 500
        @has_index = false
        exit_remarks
      end
    end
  end
end
