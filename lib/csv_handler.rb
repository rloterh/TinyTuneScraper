class CSVHandler
  def write_content(arr)
    File.open('iOSGames.csv', 'w') {}
    CSV.open('iOSGames.csv', 'w') do |csv|
      csv << arr
    end
  end

  def print_content
    CSV.foreach('iOSGames.csv') do |row|
      puts row
    end
  end
end
