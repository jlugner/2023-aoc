# frozen_string_literal: true

module Solutions
  module Day6
    module_function

    def parse(input)
      input.lines.map { _1.scan(/\d+/) }
    end

    def part1(input)
      times, distances = input.map { _1.map(&:to_i) }
      times.zip(distances).reduce(1) do |wins, (time, distance)|
        wins * (0..time).count do |hold_time|
          speed = hold_time
          remaining_time = time - hold_time
          speed * remaining_time > distance
        end
      end
    end

    def part2(input)
      time, distance = input.map { _1.join.to_i }
      first_winning_hold = (0..time).find_index do |hold_time|
        speed = hold_time
        remaining_time = time - hold_time
        speed * remaining_time > distance
      end

      last_winning_hold = time - first_winning_hold + 1
      last_winning_hold - first_winning_hold
    end
  end
end
