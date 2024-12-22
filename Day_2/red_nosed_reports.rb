require 'csv'

class RedNosedReports
  def self.parse_csv(file_path)
    reports = []
    CSV.foreach(file_path, headers: false) do |row|
      reports.push(row[0].split(" ").map { |element| element.to_i })
    end
    return reports
  end

  def self.valid?(report)
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
    puts "Valid report"
    return true
  end

  def self.increasing?(report)
    return false if report.length < 2
    if report.each_cons(2).all? { |a, b | a < b && ((b - a) <= 3 && (b - a ) >= 1) }
      puts "Increasing report"
      return true
    end
    return false
  end

  def self.decreasing?(report)
    return false if report.length < 2
    if report.each_cons(2).all? { |a, b| a > b && ((a - b) <= 3 && (a - b) >= 1) }
      puts "Decreasing report"
      return true
    end
    return false
  end

  def self.count_safe_report(file_path)
    reports = RedNosedReports.parse_csv(file_path)
    safe_report = 0
    reports.each do |report|
      if valid?(report) && (increasing?(report) || decreasing?(report))
        puts "All safe reports are:  #{safe_report += 1}"
      end
      false
    end
  end
end

RedNosedReports.count_safe_report('Day_2/day_2.csv')
