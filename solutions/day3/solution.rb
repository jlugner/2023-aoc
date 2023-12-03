# frozen_string_literal: true

module Solutions
  module Day3
    module_function

    def parse(input) = input.lines.map(&:strip)

    def part1(input)
      numbers = []
      matrice = input.map(&:chars)
      input.each_with_index do |line, y|
        line.enum_for(:scan, /(\d+)/).map do
          number = Regexp.last_match[0]
          x = Regexp.last_match.begin(0)

          numbers << number.to_i if adjacent_to_match?(matrice, x, y, number.length, /[^0-9.]/)
        end
      end

      numbers.sum
    end

    def adjacent_to_match?(matrice, x, y, length, pattern)
      x_start, x_stop, y_start, y_stop = search_space(matrice, x, y, length)
      (y_start..y_stop).each do |y_index|
        (x_start..x_stop).each do |x_index|
          value = matrice[y_index][x_index]
          return [x_index, y_index] if value && value =~ pattern
        end
      end

      false
    end

    def search_space(matrice, x, y, length)
      x_bounds = matrice[0].length - 1
      y_bounds = matrice.length - 1
      y_start = [y - 1, 0].max
      y_stop = [y + 1, y_bounds].min
      x_start = [x - 1, 0].max
      x_stop = [x + length, x_bounds].min
      [x_start, x_stop, y_start, y_stop]
    end

    def part2(input)
      gears = Hash.new { |h, k| h[k] = [] }
      matrice = input.map(&:chars)
      input.each_with_index do |line, y|
        line.enum_for(:scan, /(\d+)/).map do
          number = Regexp.last_match[0]
          x = Regexp.last_match.begin(0)

          match_position = adjacent_to_match?(matrice, x, y, number.length, /\*/)
          gears[match_position] << number.to_i if match_position
        end
      end

      gears.values.filter { |matches| matches.length == 2 }.sum { _1.reduce(:*) }
    end
  end
end
