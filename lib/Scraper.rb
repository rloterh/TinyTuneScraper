class Scraper
  $post_game = ''
  $sub_path = ''
  $index_path = ''
  $has_index = true

  require_relative '../lib/CSVHandler.rb'
  $csv_o = CSVHandler.new

  def scrape
    url = "https://apps.apple.com/us/genre/ios-games/id6014/#{$sub_path}#{$index_path}"

    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    games_array = []

    parsed_page.css('[id = "content"]').css('[id = "selectedgenre"]').css('[id = "selectedcontent"]').map do |a|
      $post_game = a.text
      games_array.push($post_game)
    end

    $csv_o.write_content(games_array)
    $csv_o.print_content

    # Pry.start(binding)
  end

  def check_index
    goto_next_idex = "press '>' (.) to goto next indexed Page for Games indexed #{$choice_input}"
    goto_prev_index = "press '<' (,) to goto previous indexed Page"
    page_index = 1
    page_index = 1 if page index == 0
    if page_index == 1
      puts "This is Page No. #{page_index} of index #{$choice_input}"
      goto_prev_index = ''
    else goto_prev_index = "press '<' (,) to goto previous indexed Page"
    end
    while $has_index

      puts "#{goto_next_idex}"
      puts "#{goto_prev_index}"

      next_input = STDIN.getch

      case next_input
      when '.'
        page_index += 1
        $index_path = "&page=#{page_index}#page"
        scrape
      when ','
        page_index -= 1
        $index_path = "&page=#{page_index}#page"
        scrape
      end
      puts "This is Page No. #{page_index} of index #{$choice_input} \n\n"
      $has_index = false if $post_game.size < 500
    end
  end
end
