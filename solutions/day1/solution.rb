# frozen_string_literal: true

module Solutions
  module Day1
    module_function

    def parse(input) = input.lines.map(&:chomp)

    def part1(input) = input.map { _1.scan(/\d/) }
                            .map { Integer("#{_1.first}#{_1.last}") }
                            .sum

    MAPPING = {
      'one' => 1,
      'two' => 2,
      'three' => 3,
      'four' => 4,
      'five' => 5,
      'six' => 6,
      'seven' => 7,
      'eight' => 8,
      'nine' => 9
    }.freeze
    def part2(input)
      input.sum do |line|
        first_digit = grab_first_digit(line, MAPPING)
        # Ugly hack of making sure overlapping chars are not removed, ie, 'oneight' is replaced with '18', not '1ight'
        last_digit = grab_first_digit(line.reverse, MAPPING.transform_keys(&:reverse))
        Integer("#{first_digit}#{last_digit}")
      end
    end

    def grab_first_digit(line, mapping)
      regexp = Regexp.union(mapping.keys + [/\d/])
      line.match(regexp)[0].then do |digit_word|
        mapping.key?(digit_word) ? mapping[digit_word] : digit_word
      end
    end

    private_constant :MAPPING
    private_class_method :grab_first_digit
  end
end
