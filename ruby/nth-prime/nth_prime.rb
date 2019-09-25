# frozen_string_literal: true

class Prime
  def self.nth(index)
    raise ArgumentError unless index.positive?

    current = 1
    primes = 0
    loop do
      current += 1
      next unless is_prime?(current)

      primes += 1
      return current if primes == index
    end
  end

  def self.is_prime?(number)
    return true if number == 2

    (2..Math.sqrt(number).ceil).each do |candidate|
      return false if (number % candidate).zero?
    end
    true
  end
end
