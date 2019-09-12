# frozen_string_literal: true

class Palindromes
  attr_reader :max_factor, :min_factor, :palindromes

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
    @palindromes = {}
  end

  def generate
    (min_factor..max_factor).each do |factor1|
      (factor1..max_factor).each do |factor2|
        product = factor1 * factor2
        next unless palindrome?(product)

        factors = palindromes[product] || []
        factors << [factor1, factor2].sort
        @palindromes[product] = factors.uniq
      end
    end
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def largest
    value = palindromes.keys.max
    Palindrome.new(value, palindromes[value])
  end

  def smallest
    value = palindromes.keys.min
    Palindrome.new(value, palindromes[value])
  end
end

Palindrome = Struct.new(:value, :factors)
