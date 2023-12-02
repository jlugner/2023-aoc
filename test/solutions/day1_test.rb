require_relative '../../solutions/day1/solution'

module Solutions
  class TestDay1 < Minitest::Test
    def setup
      @solver = Solutions::Day1
    end

    def test_part1
      test_input = <<~INPUT
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
      INPUT

      assert_equal(142, @solver.part1(@solver.parse(test_input)))
    end

    def test_part2
      test_input = <<~INPUT
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      INPUT

      assert_equal(281, @solver.part2(@solver.parse(test_input)))
    end
  end
end
