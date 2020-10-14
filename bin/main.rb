#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'csv'
require 'io/console'

require_relative '../lib/scraper'
scraper_o = Scraper.new

def exit_remarks
  puts 'Thanks for scraping iTunes App Store games with << TinyTuneScraper 1.0 >>'
  sleep(2)
  puts "Exiting Scraper now..\n\n"
  sleep(1)
end

def to_console
  CSV.foreach('iOSGames.csv') do |row|
    puts row
  end
end

def navigate_index
  puts @goto_next_index.to_s
  puts @goto_prev_index.to_s
end

def index_info
  puts ":::This is Page No. #{@page_index} of iTunes App Store games of index #{@choice_input}:::\n\t:::Also see output in << iOSGames.csv >> file:::\n\n"
end

def display_intro_screen
  puts ''
  puts "                                               T I N Y T U N E S    S C R A P E R\n"
  puts '                                                                 . . .'
  puts '                                                               . - - :'
  puts '                                                            . - - :'
  puts '                                                  . : : : : . : : : : : : : .'
  puts '                                              : - - - - - - - - - - - - - : : .'
  puts '                                             . - - - - - - - - - - - - - -:'
  puts '                                             : - - - - - - - - - - - - - -:'
  puts '                                             : - - - - - - - - - - - - - :'
  puts '                                             : - - - - - - - - - - - - - -:'
  puts '                                              . - - - - - - - - - - - - - - - .'
  puts '                                               . - - - - - - - - - - - - - - .'
  puts '                                                 . - - - - - - - - - - - - .'
  puts '                                                  . : : : . . . : : : : .'
  puts "                                                     .  .  .     . . .\n\n"
  puts '                                                           V..1.0 '
  puts "                                          An iTunes App Store games Mini Scraping Tool\n\n\n"
  puts '   HOW TO:-'
  puts '   ========'
  puts '     [Type  \'pop\', and press Enter/ Return key] ->> To list POPULAR iTunes Appstore games'
  puts '     [Type a letter, |A-Z|, and press Enter/ Return] ->> To list the corresponding Alphabetical game index'
  puts '     [Type  \'more\', and press Enter/ Return key] ->> To list MORE iTunes Appstore games'
end

display_intro_screen

scraper_o.check_choice(gets.strip.upcase)

scraper_o.scrape

scraper_o.check_index
