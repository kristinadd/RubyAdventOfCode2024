require 'csv'

class RedNosedReports
  FILE_PATH = "Day_2/day_2.csv".freeze

  def self.parse_csv(path = FILE_PATH)
    int_elements = []
    CSV.foreach(path, headers: false) do |row|
      int_elements.push(row[0].split(" ").map { |element| element.to_i })
    end
    return int_elements
  end


  def self.valid_reports(int_elements)
    puts int_elements.inspect
  end
end

int_elements = RedNosedReports.parse_csv(RedNosedReports::FILE_PATH)
RedNosedReports.valid_reports(int_elements)

               ... TBC ...