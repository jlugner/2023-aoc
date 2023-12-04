# frozen_string_literal: true

require_relative '../../solutions/day4/solution'

module Solutions
  class TestDay4 < Minitest::Test
    def setup
      @solver = Solutions::Day4
    end

    def test_parse; end

    def test_part1
      assert_raises NotImplementedError do
        @solver.part1(nil)
      end
    end

    def test_part2
      assert_raises NotImplementedError do
        @solver.part2(nil)
      end
    end
  end
end
