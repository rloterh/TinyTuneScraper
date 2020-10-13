#!/usr/bin/env ruby

require 'nokogiri'
require 'httparty'
require 'Pry'
require 'csv'
require 'io/console'

require_relative '../lib/display.rb'
require_relative '../lib/scraper.rb'
screen_o = Display.new
scraper_o = Scraper.new

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
  puts '                                             : - - - - - - - - - - - - - -:'
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
  puts '     [Type  \'pop\', and press Enter/ Return key] -> To list POPULAR iTunes Appstore games'
  puts '     [Type a letter, |A-Z|, and press Enter/ Return] -> To list the corresponding Alphabetical game index'
  puts '     [Type  \'more\', and press Enter/ Return key] -> To list MORE iTunes Appstore games'
end

display_intro_screen

scraper_o.check_choice

scraper_o.scrape

scraper_o.check_index
