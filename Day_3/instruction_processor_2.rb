require 'csv'

class InstructionProcessor
  def self.process_file(file_path)
    new(file_path).process
  end

  def initialize(file_path)
    @file_path = file_path
  end

  def process
    read_csv_file
      .then { |csv_content| parse_csv_file(csv_content) }
      .then { |matches| convert_to_ints(matches) }
      .then { |int_matches| sum_matches(int_matches) }
  end

  private

  def read_csv_file
    File.read(@file_path)
  end

  def parse_csv_file(csv_content)
    csv_content.scan(/mul\((\d+),(\d+)\)/)
  end

  def convert_to_ints(matches)
    matches.map { |match| match.map(&:to_i) }
  end

  def sum_matches(matches)
    sum = matches.sum { |x, y| x * y }
    puts "The total sum of the instructions is: #{sum}"
  end
end

# Usage
InstructionProcessor.process_file('Day_3/day_3.csv')


######################
# This design is an example of the Factory Pattern, where the class method acts
# as a factory for creating and using instances in a streamlined way.


