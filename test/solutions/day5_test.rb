# frozen_string_literal: true

require_relative '../../solutions/day5/solution'

module Solutions
  class TestDay5 < Minitest::Test
    def setup
      @solver = Solutions::Day5
    end

    TEST_INPUT = <<~TEST_INPUT
      seeds: 79 14 55 13

      seed-to-soil map:
      50 98 2
      52 50 48

      soil-to-fertilizer map:
      0 15 37
      37 52 2
      39 0 15

      fertilizer-to-water map:
      49 53 8
      0 11 42
      42 0 7
      57 7 4

      water-to-light map:
      88 18 7
      18 25 70

      light-to-temperature map:
      45 77 23
      81 45 19
      68 64 13

      temperature-to-humidity map:
      0 69 1
      1 0 69

      humidity-to-location map:
      60 56 37
      56 93 4
    TEST_INPUT

    def test_parse; end

    def test_part1
      assert_equal(35, @solver.part1(@solver.parse(TEST_INPUT)))
    end

    def test_part2
      assert_equal(46, @solver.part2(@solver.parse(TEST_INPUT)))
    end
  end
end
