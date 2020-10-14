module CSVHandler
  def write_content(arr)
    CSV.open('iOSGames.csv', 'w') do |csv|
      csv << arr
    end
  end

  def print_content
    to_console
  end
end
