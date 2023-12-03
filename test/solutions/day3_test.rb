# frozen_string_literal: true

require_relative '../../solutions/day3/solution'

module Solutions
  class TestDay3 < Minitest::Test
    def setup
      @solver = Solutions::Day3
    end

    TEST_INPUT = <<~INPUT
      467..114..
      ...*......
      ..35..633.
      ......#...
      617*......
      .....+.58.
      ..592.....
      ......755.
      ...$.*....
      .664.598..
    INPUT

    def test_parse
      assert_equal(Array, @solver.parse(TEST_INPUT).class)
    end

    def test_part1
      assert_equal(4361, @solver.part1(@solver.parse(TEST_INPUT)))
    end

    def test_part2
      assert_equal(467_835, @solver.part2(@solver.parse(TEST_INPUT)))
    end
  end
end
