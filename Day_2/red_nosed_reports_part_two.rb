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
    report.each_with_index do |_, index|
      if index < report.length - 1
        difference = report[index] - report[index + 1]
        if difference.abs > 3 || difference.abs < 1
          # puts 'Invalid report'
          return false
        end
      end
    end
    # puts "Valid report"
    return true
  end

  def self.increasing?(report)
    return false if report.length < 2
    if report.each_cons(2).all? { |a, b | a < b && ((b - a) <= 3 && (b - a ) >= 1) }
      return true
    end
    return false
  end

  def self.decreasing?(report)
    return false if report.length < 2
    if report.each_cons(2).all? { |a, b| a > b && ((a - b) <= 3 && (a - b) >= 1) }
      return true
    end
    return false
  end

  def self.safe_with_dampener(report)
    if valid?(report) && (increasing?(report) || decreasing?(report))
      return report
    else
      report.each_with_index do |_, index|
        moddified_report = report.dup
        moddified_report.delete_at(index)
        if valid?(moddified_report) && (increasing?(moddified_report) || decreasing?(moddified_report))
          return moddified_report
        end
        next
      end
      false
    end
  end

  def self.count_safe_report(file_path)
    reports = RedNosedReports.parse_csv(file_path)
    safe_report = 0
    reports.each do |report|
      dampenered_report = safe_with_dampener(report)
      if  dampenered_report == false
        next
      else
        safe_report += 1 if valid?(dampenered_report) && (increasing?(dampenered_report) || decreasing?(dampenered_report))
      end
    end
    puts "All safe reports are:  #{safe_report}"
  end
end

RedNosedReports.count_safe_report('Day_2/day_2.csv')


# report = [16, 19, 21, 24, 24]
# result = RedNosedReports.safe_with_dampener(report)
# puts result.inspect