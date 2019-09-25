# frozen_string_literal: true

class Scrabble
  POINTS = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?

    word.upcase.scan(/./).sum { |char| get_points(char) }
  end

  def self.score(word)
    new(word).score
  end

  private

  attr_reader :word

  def get_points(char)
    POINTS.each do |value, letters|
      return value if letters.include?(char)
    end

    0
  end
end
