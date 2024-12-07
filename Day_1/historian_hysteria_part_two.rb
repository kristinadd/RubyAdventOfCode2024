require 'csv'

class HistorianHysteriaPartTwo
  FILE_PATH = 'Day_1/day_1.csv'.freeze

  def self.process
    left, right = CSV.foreach(FILE_PATH, headers: false).map do |row|
      row[0].split.map(&:to_i)
    end.transpose

    occurrences = {}

    right.each do |number|
      if occurrences.include?(number)
        occurrences[number] += 1
      else
        occurrences[number] = 1
      end
    end

    score = 0

    left.each do |number|
     score +=  number * ( occurrences.include?(number) ? occurrences[number] : 0 )
    end

    puts "The score is: #{score}"
  end
end

HistorianHysteriaPartTwo.process
