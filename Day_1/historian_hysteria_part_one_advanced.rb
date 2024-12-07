require 'csv'

class HistorianHysteriaPartOneAdvanced
  FILE_PATH = "Day_1/day_1.csv".freeze

  def self.process
    # The syntax left, right = works because the transpose method returns an array with exactly two subarrays. 
    # Ruby allows parallel assignment to unpack the subarrays into the left and right variables.
    left, right = CSV.foreach(FILE_PATH, headers: false).map do |row|
      row[0].split.map(&:to_i)
    end.transpose # Converts an array of arrays from a "row-wise" format to a "column-wise" format.
    # In Ruby, method chaining allows you to call methods like transpose directly after the end of a block. 
    # This is because the block inside map produces a result, and end simply closes the block. The resulting array from map is what transpose is called on.

    left.sort!
    right.sort!

    # The zip method combines elements from left and right at the same index into a new array of pairs
    # The sum method calculates the total sum of elements in an enumerable. When provided with a block, it applies the block to each element and sums up the results.
    distance = left.zip(right).sum { |l, r| (l-r).abs }

    puts "Total distance is: #{distance}"
  end
end

HistorianHysteriaPartOneAdvanced.process
