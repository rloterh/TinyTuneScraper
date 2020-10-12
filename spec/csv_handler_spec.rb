require 'nokogiri'
require 'httparty'
require './lib/scraper'

describe CSVHandler do
  let(:csv_o) { CSVHandler.new }

  context 'Check class instance' do
    example 'creates an instance of the CSVHandler class' do
      expect(csv_o.class).to eql(CSVHandler)
    end
  end

  context '#write_content' do
    let(:file_name) { 'iOSGames.csv' }
    let(:new_array) { %w['hello hello hello'] }
    let(:csv_file) { CSV.open(file_name, 'w') }
    let(:csv_content) { csv_file << new_array }

    example 'should create a new file' do
      expect(new_array).to include('hello')
    end
  end
end
