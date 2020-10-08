require_relative '../lib/CSVHandler.rb'
  
describe Scraper do
  let(:scraper_o) { Scraper.new }
  let(:post_game) { ''}
  let(:sub_path) {'ios/games'}
  let(:index_path) {'/page2'}
  let(:has_index) { true}
  let(:url) { CSVHandler.new(search_address) }
  let(:search_page) { CSVHandler.new(search_address) }

  describe '#Scraper' do
    it 'creates a new scraper object'
    expect(scraper_o.class).to eql(Scraper)
  end

  describe '#scrape' do
    let(raw_url){"https://apps.apple.com/us/genre/ios-games/id6014/#{sub_path}#{index_path}"}
    it 'sets url to contain a string' do
      expect(raw_url).to be_a(String)
    end

end

# class Scraper
#   $post_game = ''
#   $sub_path = ''
#   $index_path = ''
#   $has_index = true

#   require_relative '../lib/CSVHandler.rb'
#   $csv_o = CSVHandler.new

#   def scrape
#     url = "https://apps.apple.com/us/genre/ios-games/id6014/#{$sub_path}#{$index_path}"

#     unparsed_page = HTTParty.get(url)
#     parsed_page = Nokogiri::HTML(unparsed_page)

#     games_array = []

#     parsed_page.css('[id = "content"]').css('[id = "selectedgenre"]').css('[id = "selectedcontent"]').map do |a|
#       $post_game = a.text
#       games_array.push($post_game)
#     end

#     $csv_o.write_content(games_array)
#     $csv_o.print_content

#     # Pry.start(binding)
#   end

#   def check_index
#     goto_next_idex = "press '>' or (.) to goto next indexed Page for Games indexed #{$choice_input}"
#     goto_prev_index = "press '<' or (,) to goto previous indexed for Games indexed #{$choice_input}"
#     page_index = 1
#     page_index = 1 if page_index == 0
#     if page_index == 1
#       puts ":::This is Page No. #{page_index} of iTunes App Store games of index #{$choice_input}:::\n\n"
#       goto_prev_index = ''
#     end
#     while $has_index

#       goto_prev_index = "press '<' or (,) to goto previous indexed Page for Games indexed #{$choice_input}" if page_index >= 2

#       puts "#{goto_next_idex}"
#       puts "#{goto_prev_index}"

#       next_input = STDIN.getch

#       case next_input
#       when '.'
#         page_index += 1
#         $index_path = "&page=#{page_index}#page"
#         scrape
#       when ','
#         page_index -= 1
#         $index_path = "&page=#{page_index}#page"
#         scrape
#       end
#       puts ":::This is Page No. #{page_index} of iTunes App Store games index #{$choice_input}:::\n\n"
#       $has_index = false if $post_game.size < 500
#     end
#   end
# end
