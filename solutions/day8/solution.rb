# frozen_string_literal: true

module Solutions
  module Day8
    module_function

    Instruction = Data.define(:directions, :transitions)
    def parse(input)
      moves, rules = input.split("\n\n")
      transitions = rules.lines.each_with_object({}) do |rule, acc|
        matches = rule.match(/(?<from>.*) = \((?<left>.*), (?<right>.*)\)/)
        acc[matches[:from]] = { 'L' => matches[:left], 'R' => matches[:right] }
      end

      Instruction.new(moves, transitions)
    end

    def part1(input)
      move_rules = input.directions.chars.cycle
      position = 'AAA'

      move_rules.each_with_index do |direction, count|
        position = input.transitions[position][direction]
        return count + 1 if position == 'ZZZ'
      end
    end

    def part2(input)
      positions = input.transitions.keys.filter { _1.end_with?('A') }
      path_lengths = positions.map do |start_position|
        move_rules = input.directions.chars.cycle

        move_rules.each_with_index do |direction, count|
          start_position = input.transitions[start_position][direction]
          break count + 1 if start_position.end_with?('Z')
        end
      end

      path_lengths.reduce(&:lcm)
    end
  end
end
