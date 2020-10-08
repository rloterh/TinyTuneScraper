class CSVHandler

  $itune_games_csv = '../lib/iOSGames.csv'

  def write_content(arr)
    File.open($itune_games_csv, 'w') {}
    CSV.open($itune_games_csv, 'w') do |csv|
      csv << arr
    end
  end

  def print_content
    CSV.foreach($itune_games_csv) do |row|
      puts row
    end
  end

end
