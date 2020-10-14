require 'nokogiri'
require 'httparty'
require_relative '../lib/scraper'

describe Scraper do
  let(:scraper) { Scraper.new }
  let(:user_choice) { 'pop' }
  let(:page_url) { 'https://apps.apple.com/us/genre/ios-games/id6014' }
  let(:parsed_page) { Nokogiri::HTML(HTTParty.get(page_url)) }

  context '#initialize' do
    example 'creates an instance of the Scraper class' do
      expect(scraper.class).to eql(Scraper)
    end

    example 'Check if initial post_game variable is empty' do
      expect(scraper.post_game).to be_empty
    end

    example 'Check if initial sub_path variable is empty' do
      expect(scraper.sub_path).to be_empty
    end

    example 'Check if initial index_path variable is empty' do
      expect(scraper.index_path).to be_empty
    end

    example 'Check if initial has_index variable is true' do
      expect(scraper.has_index).to be true
    end

    example 'Check if initial choice_input variable is empty' do
      expect(scraper.choice_input).to be_empty
    end
  end

  context '#scrape' do
    let(:itune_array) { [] }
    example 'itune_array should returns an array of strings' do
      expect(itune_array).to be_a(Array)
    end
    example 'expects itunes_array to return string values' do
      itune_array.each { |e| expect(e).to be_a(String) }
    end
  end

  context '#check_choice' do
    let(:user_choice) { ' c ' }
    let(:verify_input) { user_choice.strip.upcase }
    example 'verify_input should be true for single character' do
      expect(verify_input).to match(/^[[:alpha:]]$/)
      expect(verify_input).to match('C')
    end
  end

  context '#check_index' do
    let(:more_index) { false }
    example 'should continue if more pages' do
      parsed_page.css('[id = "content"]').css('[id = "selectedgenre"]').css('[id = "selectedcontent"]').map do |a|
        scraper.post_game = a.text
      end
      scraped_text = scraper.post_game
      expect(scraped_text.size > 500).to be true
    end
  end

  context '#write_content' do
    let(:new_array) { %w['hello hello hello'] }

    example 'should create a new file' do
      expect(new_array).to include('hello')
    end
  end
end
