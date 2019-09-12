# frozen_string_literal: true

class Allergies
  attr_reader :score

  ALLERGIES = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats].freeze

  def initialize(score)
    @score = score.to_s(2).chars.reverse.first(8)
  end

  def allergic_to?(allergy)
    list.include?(allergy)
  end

  def list
    score.map.with_index { |bit, i| ALLERGIES[i] unless bit.to_i.zero? }.compact
  end
end
