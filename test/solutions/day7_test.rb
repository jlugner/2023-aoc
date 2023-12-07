# frozen_string_literal: true

require_relative '../../solutions/day7/solution'

module Solutions
  class TestDay7 < Minitest::Test
    def setup
      @solver = Solutions::Day7
    end

    TEST_INPUT = <<~INPUT
      32T3K 765
      T55J5 684
      KK677 28
      KTJJT 220
      QQQJA 483
    INPUT

    def test_parse
      assert_equal(Array, @solver.parse(TEST_INPUT).class)
      assert_equal(Solutions::Day7::Hand, @solver.parse(TEST_INPUT).first.class)
    end

    def test_part1
      assert_equal(6440, @solver.part1(@solver.parse(TEST_INPUT)))
    end

    def test_part2
      assert_equal(5905, @solver.part2(@solver.parse(TEST_INPUT)))
    end
  end
end
