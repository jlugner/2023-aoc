# frozen_string_literal: true

require_relative '../../solutions/day6/solution'

module Solutions
  class TestDay6 < Minitest::Test
    def setup
      @solver = Solutions::Day6
    end

    TEST_INPUT = <<~INPUT
      Time:      7  15   30
      Distance:  9  40  200
    INPUT

    def test_parse
      times, distances = @solver.parse(TEST_INPUT)
      assert_equal(%w[7 15 30], times)
      assert_equal(%w[9 40 200], distances)
    end

    def test_part1
      assert_equal(288, @solver.part1(@solver.parse(TEST_INPUT)))
    end

    def test_part2
      assert_equal(71_503, @solver.part2(@solver.parse(TEST_INPUT)))
    end
  end
end
