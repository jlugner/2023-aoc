require 'minitest/test_task'
require 'fileutils'

Minitest::TestTask.create(:test) do |t|
  t.test_globs = ['**/*_test.rb']
end

task default: :test

def solution_body(day_number)
  <<~BODY
    # frozen_string_literal: true

    module Solutions
      module Day#{day_number}
        module_function

        def parse(input); end

        def part1(input)
          raise NotImplementedError
        end

        def part2(input)
          raise NotImplementedError
        end
      end
    end
  BODY
end

def test_body(day_number)
  <<~BODY
    # frozen_string_literal: true

    require_relative '../../solutions/day#{day_number}/solution'

    module Solutions
      class TestDay#{day_number} < Minitest::Test
        def setup
          @solver = Solutions::Day#{day_number}
        end

        def test_parse; end
        def test_part1; end
        def test_part2; end
      end
    end
  BODY
end

task :add_day, [:day_number] do |_t, args|
  day_number = args[:day_number]
  # Add a new day to the solutions directory with a solutions file and an input file
  FileUtils.mkdir_p("solutions/day#{day_number}")
  # Add expected empty body to the solution file
  FileUtils.touch("solutions/day#{day_number}/solution.rb")
  FileUtils.touch("solutions/day#{day_number}/input.txt")
  File.write("solutions/day#{day_number}/solution.rb", solution_body(day_number))
  # Add a new test file to the test directory
  FileUtils.touch("test/solutions/day#{day_number}_test.rb")
  File.write("test/solutions/day#{day_number}_test.rb", test_body(day_number))
end
