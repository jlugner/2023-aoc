# frozen_string_literal: true

module Solutions
  module Day4
    module_function

    def parse(input)
      input.lines.map do |line|
        match = line.match(/Card *\d+: (?<ours>.*) \| (?<winning>.*)/)
        (match[:ours].split.map(&:to_i) & match[:winning].split.map(&:to_i)).count
      end
    end

    def part1(input)
      input.sum { |wins| wins.positive? ? 1 * (2**(wins - 1)) : 0 }
    end

    def part2(input)
      copies = Array.new(input.size, 1)
      input.each_with_index do |wins, index|
        copies[index].times do
          wins.times do |win_count|
            copies[index + win_count + 1] += 1 if index + win_count + 1 < copies.size
          end
        end
      end

      copies.sum
    end
  end
end
