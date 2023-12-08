# frozen_string_literal: true

class Range
  def intersection(other)
    return nil if (self.begin > other.end) || (other.begin > self.end)

    [self.begin, other.begin].max..[self.end, other.end].min
  end

  alias & intersection
end

module Solutions
  module Day5
    module_function

    ConvertionStep = Data.define(:rules)
    ConvertionRule = Struct.new(:range, :offset)
    Almanac = Data.define(:seeds, :convertion_steps)
    def parse(input)
      instructions = input.split("\n\n")
      seeds = instructions[0].scan(/(\d+)/).flatten.map(&:to_i)
      convertion_steps = instructions[1..].map do |convertion_ruleset|
        _categories, *ranges = convertion_ruleset.split("\n")
        rules = ranges.map do |range|
          destination, source, length = range.scan(/(\d+)/).flatten.map(&:to_i)
          ConvertionRule.new(source..(source + length), destination - source)
        end
        ConvertionStep.new(rules:)
      end
      Almanac.new(seeds:, convertion_steps:)
    end

    def part1(input) = input.seeds.map do |seed|
      input.convertion_steps.reduce(seed) do |destination, convertion_step|
        colliding_rule = convertion_step.rules.find { |rule| rule.range.cover?(destination) }
        colliding_rule ? destination + colliding_rule.offset : destination
      end
    end.min

    def part2(input)
      seed_ranges = input.seeds
                         .each_slice(2)
                         .map { |start, length| start..(start + length) }
                         .sort { _1.begin <=> _2.begin }

      location_ranges = input.convertion_steps.reduce(seed_ranges) do |ranges, convertion_step|
        ranges.map do |range|
          convertion_step.rules.map do |rule|
            intersection = range & rule.range
            if intersection
              # part before intersection - unaltered, intersection - offset, part after intersection - unaltered
              new_ranges = []
              new_ranges << (range.begin..(intersection.begin - 1)) if range.begin < intersection.begin
              new_ranges << ((intersection.begin + rule.offset)..(intersection.end + rule.offset))
              new_ranges << ((intersection.end + 1)..range.end) if intersection.end < range.end
              new_ranges
            else
              range
            end
          end
        end
      end

      location_ranges.map(&:begin).min
    end
  end
end
