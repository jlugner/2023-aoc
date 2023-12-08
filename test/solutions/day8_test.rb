# frozen_string_literal: true

require_relative '../../solutions/day8/solution'

module Solutions
  class TestDay8 < Minitest::Test
    def setup
      @solver = Solutions::Day8
    end

    TEST_INPUT_1 = <<~INPUT
      RL

      AAA = (BBB, CCC)
      BBB = (DDD, EEE)
      CCC = (ZZZ, GGG)
      DDD = (DDD, DDD)
      EEE = (EEE, EEE)
      GGG = (GGG, GGG)
      ZZZ = (ZZZ, ZZZ)
    INPUT

    TEST_INPUT_2 = <<~INPUT
      LLR

      AAA = (BBB, BBB)
      BBB = (AAA, ZZZ)
      ZZZ = (ZZZ, ZZZ)
    INPUT

    TEST_INPUT_3 = <<~INPUT
      LR

      11A = (11B, XXX)
      11B = (XXX, 11Z)
      11Z = (11B, XXX)
      22A = (22B, XXX)
      22B = (22C, 22C)
      22C = (22Z, 22Z)
      22Z = (22B, 22B)
      XXX = (XXX, XXX)
    INPUT

    def test_parse; end

    def test_part1
      assert_equal(2, @solver.part1(@solver.parse(TEST_INPUT_1)))
      assert_equal(6, @solver.part1(@solver.parse(TEST_INPUT_2)))
    end

    def test_part2
      assert_equal(6, @solver.part2(@solver.parse(TEST_INPUT_3)))
    end
  end
end
