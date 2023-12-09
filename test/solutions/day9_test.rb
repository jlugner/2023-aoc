# frozen_string_literal: true

require_relative '../../solutions/day9/solution'

module Solutions
  class TestDay9 < Minitest::Test
    def setup
      @solver = Solutions::Day9
    end

    TEST_INPUT = <<~INPUT
      0 3 6 9 12 15
      1 3 6 10 15 21
      10 13 16 21 30 45
    INPUT

    def test_parse; end

    def test_part1
      assert_equal(114, @solver.part1(@solver.parse(TEST_INPUT)))
    end

    def test_part2
      assert_equal(2, @solver.part2(@solver.parse(TEST_INPUT)))
    end
  end
end
