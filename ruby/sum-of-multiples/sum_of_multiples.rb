class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    factors
      .reject(&:zero?)
      .map { |factor| (factor...limit).reject{ |n| n % factor != 0 } }
      .flatten
      .uniq
      .sum
  end
end
