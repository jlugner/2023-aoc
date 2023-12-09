# frozen_string_literal: true

module Solutions
  module Day9
    module_function

    def parse(input)
      input.lines.map { _1.split.map(&:to_i) }
    end

    def part1(input)
      input.sum { extrapolate_next_value(_1) }
    end

    def part2(input)
      input.map(&:reverse).sum { extrapolate_next_value(_1) }
    end

    def build_change_history(value_history)
      [value_history].tap do |history|
        history << history.last.each_cons(2).map { _2 - _1 } until history.last.all?(&:zero?)
      end
    end

    def extrapolate_next_value(value_history)
      build_change_history(value_history).sum(&:last)
    end
  end
end
