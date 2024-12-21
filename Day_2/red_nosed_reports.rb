require 'csv'

class RedNosedReports
  def self.parse_csv(file_path)
    int_reports = []
    CSV.foreach(file_path, headers: false) do |row|
      int_reports.push(row[0].split(" ").map { |element| element.to_i })
    end
    return int_reports
  end

  # def self.is_valid?(report)
  #   puts report.inspect
  #     report.each_with_index do |_, index|
  #       if index < report.length - 1
  #         difference = report[index] - report[index + 1]
  #         if difference.abs > 3 || difference.abs < 1
  #           puts 'Invalid report'
  #           return false
  #         else
  #           puts "Valid report"
  #           return true
  #         end
  #       end
  #     end
  # end

  def self.is_valid?(report)
    puts report.inspect
    report.each_with_index do |_, index|
      if index < report.length - 1
        difference = report[index] - report[index + 1]
        if difference.abs > 3 || difference.abs < 1
          puts 'Invalid report'
          return false
        end
      end
    end
    # If the loop completes without returning false, the report is valid
    puts "Valid report"
    return true
  end

end

int_reports = RedNosedReports.parse_csv("Day_2/day_2.csv")
int_reports.each do |report|
  RedNosedReports.is_valid?(report)
end


