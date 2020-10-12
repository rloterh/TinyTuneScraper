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

screen_o.display_intro_screen

scraper_o.check_choice

scraper_o.check_index
