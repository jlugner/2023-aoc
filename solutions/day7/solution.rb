# frozen_string_literal: true

module Solutions
  module Day7
    CARD_STRENGTH_ORDER = '_23456789TJQKA'

    Hand = Struct.new(:hand, :bid, keyword_init: true) do
      include Comparable
      def <=>(other)
        if score == other.score
          card_strengths <=> other.card_strengths
        else
          score <=> other.score
        end
      end

      def card_strengths = hand.chars.map { CARD_STRENGTH_ORDER.index(_1) }

      def score = case occurrences_sorted
                  in [5]          then 7
                  in [4, _]       then 6
                  in [3, 2]       then 5
                  in [3, _, _]    then 4
                  in [2, 2, _]    then 3
                  in [2, _, _, _] then 2
                  else
                    1
                  end

      def occurrences_sorted
        occurrences = hand.chars.tally
        jokers = occurrences.delete('_')
        rank_counts = occurrences.empty? ? [0] : occurrences.values.sort.reverse
        rank_counts[0] += jokers || 0
        rank_counts
      end

      def jokerize!
        hand.gsub!(/J/, '_')
        self
      end
    end

    module_function

    def parse(input) = input.lines.map do |line|
      hand, bid = line.split
      Hand.new(hand:, bid: bid.to_i)
    end

    def part1(input) = input.sort.each_with_index.sum do |(hand, index)|
      hand.bid * (index + 1)
    end

    def part2(input) = input.map(&:jokerize!).sort.each_with_index.sum do |(hand, index)|
      hand.bid * (index + 1)
    end
  end
end
