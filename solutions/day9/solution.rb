# frozen_string_literal: true

module Solutions
  module Day9
    module_function

    def parse(input) = input.lines.map { _1.split.map(&:to_i) }
    def part1(input) = input.sum { build_change_history(_1).sum(&:last) }
    def part2(input) = input.map(&:reverse).sum { build_change_history(_1).sum(&:last) }

    def build_change_history(value_history) = [value_history].tap do |history|
      history << history.last.each_cons(2).map { _2 - _1 } until history.last.all?(&:zero?)
    end
  end
end
