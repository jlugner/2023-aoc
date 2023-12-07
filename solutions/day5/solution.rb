# frozen_string_literal: true

module Solutions
  module Day5
    module_function

    ConvertionTable = Struct.new(:from, :to, :mapping)
    def parse(input)
      instructions = input.split("\n\n")
      seeds = instructions[0].scan(/(\d+)/).flatten.map(&:to_i)
      maps = {}
      instructions[1..].map do |convertion_ruleset|
        categories, *ranges = convertion_ruleset.split("\n")
        matches = categories.match(/(?<from>.*)-to-(?<to>.*) map:/)
        from = matches[:from]
        to = matches[:to]
        maps[from] = ConvertionTable.new(from, to, {})
        ranges.each do |range|
          range = range.scan(/(\d+)/).flatten.map(&:to_i)
          destination, source, length = range
          maps[from].mapping.merge!(source..(source + length) => destination - source)
        end
      end
      [seeds, maps]
    end

    # Walk through maps and convert the seed number until we reach a location - our final convertion
    def convert(seed_number, maps)
      convert_from = 'seed'
      until convert_from == 'location'
        mappings = maps[convert_from].mapping
        offset = mappings.find { |range, _v| range.include?(seed_number) }&.last
        offset ||= 0
        seed_number += offset
        convert_from = maps[convert_from].to
      end

      seed_number
    end

    def part1(input)
      seeds, maps = input
      locations = seeds.map { convert(_1, maps) }
      locations.min
    end

    def part2(input)
      seed_ranges, maps = input
      final_ranges = []
      seed_ranges.each_slice(2)
                 .map { |start, length| start..(start + length) }
                 .sort_by { _1[0] }
                 .each do |range|
        overlapping_range = final_ranges.find { |other| other.cover?(range.start) || other.cover?(range.last) }
        unless overlapping_range
          final_ranges << range
          next
        end

        final_ranges -= [overlapping_range]
        final_ranges << [overlapping_range.first, range.first].min..[overlapping_range.last, range.last].max
      end

      seeds = final_ranges.flat_map(&:to_a)
      locations = seeds.map { convert(_1, maps) }
      locations.min
    end
  end
end
