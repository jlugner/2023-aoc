# frozen_string_literal: true

module Solutions
  module Day2
    module_function

    def parse(input)
      input.lines.map do |game|
        _game_id, cubes = game.split(': ')
        cubes.split(';').map do |set|
          set.split(',').map(&:strip).map { _1.split(' ') }.map do |count, color|
            [color, count.to_i]
          end
        end
      end
    end

    LIMITATIONS = {
      'red' => 12,
      'green' => 13,
      'blue' => 14
    }.freeze
    private_constant :LIMITATIONS

    def part1(input)
      input.filter_map.with_index do |game, index|
        next unless game.all? do |set|
          set.all? { |color, count| LIMITATIONS.fetch(color) >= count }
        end

        index + 1
      end.sum
    end

    def part2(input)
      input.sum do |game|
        max_color_shown = Hash.new(0)
        game.each do |set|
          set.each do |color, count|
            max_color_shown[color] = count if count > max_color_shown[color]
          end
        end
        max_color_shown.values.reduce(:*)
      end
    end
  end
end
