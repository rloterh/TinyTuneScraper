#!/usr/bin/env ruby

puts 'hello ruby'
require 'nokogiri'
require 'httparty'
require 'Pry'
require 'csv'
require 'io/console'

$post_game = ''
$sub_path = ''
$index_path = ''

def scraper
  url = "https://apps.apple.com/us/genre/ios-games/id6014/#{$sub_path}#{$index_path}"

  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  games_array = []

  # parse the data
  parsed_page.css('[id = "content"]').css('[id = "selectedgenre"]').css('[id = "selectedcontent"]').map do |a|
    $post_game = a.text
    games_array.push($post_game)
  end

   # clear and write content to csv
   File.open('../lib/iOSGames.csv', 'w') {}
   CSV.open('../lib/iOSGames.csv', 'w') do |csv|
     csv << games_array
   end
   # Print CSV to console
   CSV.foreach('../lib/iOSGames.csv') do |row|
     puts row
   end
  
  Pry.start(binding)
end

scraper