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
      count = 0
      until position == 'ZZZ'
        direction = move_rules.next
        position = input.transitions[position][direction]
        count += 1
      end
      count
    end

    def part2(input)
      positions = input.transitions.keys.filter { _1.end_with?('A') }
      path_lengths = positions.map do |position|
        move_rules = input.directions.chars.cycle
        count = 0
        until position.end_with?('Z')
          direction = move_rules.next
          position = input.transitions[position][direction]
          count += 1
        end
        count
      end

      path_lengths.reduce(1, :lcm)
    end
  end
end
