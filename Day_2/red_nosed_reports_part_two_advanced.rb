require 'csv'

class RedNosedReports
  def self.parse_csv(file_path)
    CSV.read(file_path, headers: false).map do |row|
      row[0].split.map(&:to_i)
    end
  end

  def self.valid?(report)
    report.each_cons(2).all? do |a, b|
      difference = (b - a).abs
      difference.between?(1, 3) # Ensure difference is between 1 and 3
    end
  end

  def self.increasing?(report)
    report.each_cons(2).all? { |a, b| b > a && (b - a).between?(1, 3) }
  end

  def self.decreasing?(report)
    report.each_cons(2).all? { |a, b| b < a && (a - b).between?(1, 3) }
  end

  def self.safe_with_dampener(report)
    # Return report if it's valid and either increasing or decreasing
    return report if valid?(report) && (increasing?(report) || decreasing?(report))

    # Check if removing one element makes it valid and directional
    report.each_with_index do |_, index|
      modified_report = report.dup
      modified_report.delete_at(index)
      return modified_report if valid?(modified_report) && (increasing?(modified_report) || decreasing?(modified_report))
    end

    false # Return false if no valid dampened report is found
  end

  def self.count_safe_report(file_path)
    reports = parse_csv(file_path)
    safe_report_count = reports.count do |report|
      dampened_report = safe_with_dampener(report)
      dampened_report && valid?(dampened_report) && (increasing?(dampened_report) || decreasing?(dampened_report))
    end

    puts "All safe reports are: #{safe_report_count}"
    safe_report_count
  end
end

RedNosedReports.count_safe_report('Day_2/day_2.csv')
