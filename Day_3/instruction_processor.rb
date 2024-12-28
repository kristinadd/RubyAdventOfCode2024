require 'csv'
class InstructionProcessor
  def self.read_csv_file(file_path)
    File.read(file_path)
  end
  def self.parse_csv_file(csv_content)
    # scan iterates over the string, finds all matches of the pattern, and returns them in an array. Array of strings
   csv_content.scan(/mul\((\d+),(\d+)\)/)
    # puts matches.inspect
  end
  def self.convert_to_ints(matches)
    matches.each do |match|
      match[0] = match[0].to_i
      match[1] = match[1].to_i
      puts match.inspect
    end
  end
  def self.sum_matches(matches)
    sum = 0
    matches. each do |match|
      sum += match[0] * match[1]
    end
    puts "The total sum of the instructions is: #{sum}"
  end
  def self.process(file_path)
    read_csv_file(file_path)
      .then { |csv_content| parse_csv_file(csv_content) }
      .then { |matches| convert_to_ints(matches) }
      .then { |int_matches| sum_matches(int_matches) }
  end
end

##########
InstructionProcessor.process('Day_3/day_3.csv')
