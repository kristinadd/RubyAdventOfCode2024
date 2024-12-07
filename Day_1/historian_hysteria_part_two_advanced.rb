require 'csv'

class HistorianHysteriaPartTwoAdvanced
  FILE_PATH = 'Day_1/day_1.csv'.freeze

  def self.process
    left, right = CSV.foreach(FILE_PATH, headers: false).map do |row|
      row[0].split.map(&:to_i)
    end.transpose

    occurrences = right.tally
    # Tally counts how many times each element appears in an array.
    # Returns a hash where:
    # Keys are the unique elements of the array.
    # Values are the counts of those elements.
    
    score = left.sum { |number| number * occurrences.fetch(number, 0) }
    # highly useful method for adding up elements in an enumerable, like an array or a range. It can work in two modes:
    # Default Summation: Adds up all the elements directly.
    # With a Block: Allows you to specify how each element should contribute to the sum.
    
    # The fetch method in Ruby is used to safely access a value from a hash. Unlike using the [] operator, 
    # fetch provides additional options for handling cases where the key does not exist in the hash.

    puts "The score is: #{score}"
  end
end

HistorianHysteriaPartTwoAdvanced.process
