#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'Pry'
require 'csv'
require 'io/console'

require_relative '../lib/Display.rb'
screen_o = Display.new

$post_game = ''
$sub_path = ''
$index_path = ''
$choice_input = ''
$has_index = true

def check_choice
  $choice_input = gets.strip.upcase
  if $choice_input.match(/^[[:alpha:]]$/)
    $sub_path = "?letter=#{$choice_input}"
  elsif $choice_input == 'POP'
    $sub_path = ''
  elsif $choice_input == 'MORE'
    $sub_path = '?letter=*'
  else
    puts "          PLEASE INPUT A CORRECT OPTION TO CONTINUE..\n"
    check_choice
  end
end

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

  # Pry.start(binding)
end

def check_index
  page_index = 1
  while $has_index
    puts "press '>' to goto next indexed Page for Games indexed #{$choice_input}"
    puts "press '<' to goto previous indexed Page"
    next_input = STDIN.getch

    case next_input
      when ?.
        page_index += 1
        $index_path = "&page=#{page_index}#page"
        scraper
      when ?,
        page_index -= 1
        $index_path = "&page=#{page_index}#page"
        scraper
      else
        page_index = 0
    end
  puts "Indexed page is #{page_index}"
  puts "index path is #{$index_path}"
  $has_index = false if $post_game.match(/^[[:blank:]]+$/)
  end
end

screen_o.display_intro_screen

check_choice

scraper

check_index