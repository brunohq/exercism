# frozen_string_literal: true

class Triplet
  attr_reader :triplets

  def initialize(*triplets)
    @triplets = triplets.sort
  end

  def sum
    triplets.sum
  end

  def product
    triplets.reduce(&:*)
  end

  def sum_equal_to?(value)
    value.is_zero? || value == sum
  end

  def pythagorean?
    triplets[0]**2 + triplets[1]**2 == triplets[2]**2
  end

  def self.where(options)
    sum = options.fetch(:sum, 0)
    min = options.fetch(:min_factor, 1)
    max = options.fetch(:max_factor)
    range = (min..max)

    range.each_with_object([]) do |a, triplets|
      (a + 1..max).each do |b|
        (b + 1..max).each do |c|
          candidate = new(a, b, c)
          triplets << candidate if candidate.pythagorean? && candidate.sum_equal_to?(sum)
        end
      end
    end
  end
end
