require 'csv'

class RedNosedReports
  def self.parse_csv(file_path)
    reports = []
    raise "File not found: #{file_path}" unless File.exist?(file_path)

    CSV.foreach(file_path, headers: false) do |row|
      reports.push(row[0].split(" ").map(&:to_i))
    end
    reports
  end

  def self.valid?(report)
    return false if report.length < 2
    report.each_cons(2).all? do |a, b|
      difference = (b - a).abs
      difference <= 3 && difference >= 1
    end
  end

  def self.increasing?(report)
    report.each_cons(2).all? { |a, b| a < b && ((b - a) <= 3 && (b - a) >= 1) }
  end

  def self.decreasing?(report)
    report.each_cons(2).all? { |a, b| a > b && ((a - b) <= 3 && (a - b) >= 1) }
  end

  def self.count_safe_reports(file_path)
    reports = parse_csv(file_path)
    safe_count = reports.count do |report|
      valid?(report) && (increasing?(report) || decreasing?(report))
    end
    puts "Number of safe reports: #{safe_count}"
    safe_count
  end
end

RedNosedReports.count_safe_reports('Day_2/day_2.csv')
