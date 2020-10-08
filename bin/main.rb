#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'Pry'
require 'csv'
require 'io/console'

require_relative '../lib/Display.rb'
require_relative '../lib/Scraper.rb'
screen_o = Display.new
scraper_o = Scraper.new

$choice_input = ''

$sub_path = ''

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

  #test
  # $has_index = false if $post_game.size < 500
  # puts "Indexed page is #{page_index}"
  # puts "index path is #{$index_path}"
  # puts "#{$has_index}"
  # puts "my array count is #{$post_game.size}"

screen_o.display_intro_screen

check_choice

scraper_o.scrape

scraper_o.check_index