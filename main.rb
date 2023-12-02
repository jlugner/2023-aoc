require 'optionparser'

DAYS = (1..24)

def load_solution(day)
  # Gracefully handle missing solutions by capturing the LoadError and printing a message
  require_relative "solutions/day#{day}/solution.rb"
rescue LoadError => e
  pp "No solution for day #{day}"
  false
end

def solve_day(day)
  return unless load_solution(day)

  solution = Object.const_get("Solutions::Day#{day}")
  input = File.read("solutions/day#{day}/input.txt")
  parsed = solution.parse(input)
  pp "Day #{day} - Part 1: #{solution.part1(parsed)}"
  pp "Day #{day} - Part 2: #{solution.part2(parsed)}"
end

def solve_days(days)
  days.each do |day|
    solve_day(day)
  end
end

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: main.rb [options] - defaults: -a'
  opts.on('-d', '--day DAY', 'Solve a specific day') do |day|
    options[:day] = day.to_i
  end

  opts.on('-a', '--all', 'Solve all days') do
    options[:all] = true
  end

  opts.on('-m', '--days DAYS', Array, 'Solve a list of multiple days') do |days|
    options[:days] = days.map(&:to_i)
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end.parse!

if options[:day]
  solve_day(options[:day])
elsif options[:days]
  solve_days(options[:days])
elsif options[:all]
  solve_days(DAYS)
else
  solve_days(DAYS)
end
