#!/usr/bin/env ruby

puts 'hello ruby'
require 'nokogiri'
require 'httparty'
require 'Pry'
require 'csv'
require 'io/console'

def scraper
  url = "https://apps.apple.com/us/genre/ios-games/id6014/#{$sub_path}#{$index_path}"

  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  games_array = []

end
