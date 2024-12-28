require 'csv'

class RedNosedReports
  def self.parse_csv(file_path)
    CSV.foreach(file_path, headers: false).map do |report|
      report[0].split.map(&:to_i)
      # Default: If omitted, split uses whitespace as the delimiter.
    end
  end

  
end

result = RedNosedReports.parse_csv('Day_2/test.csv')
puts result.inspect

