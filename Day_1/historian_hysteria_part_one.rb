require 'csv'

class HistorianHysteriaPartOne

  FILE_PATH = "Day_1/day_1.csv".freeze

  def self.process
    left = []
    right = []

    CSV.foreach(FILE_PATH, headers: false) do |row| 
      # Since the default delimiter is a comma, the entire row is treated as a single string if no commas are present.
      # And foreach returns an array so row is  ["85215   94333"]
      elements = row[0].split
      left << elements[0].to_i
      right << elements[1].to_i
    end
    sorter_left = left.sort
    sorted_right = right.sort

    distance = 0

    sorter_left.each_with_index do |left_element, index|
      distance += (left_element - sorted_right[index]).abs
    end
    puts "Total distance:  #{distance}"
  end

end

HistorianHysteriaPartOne.process
