class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def primes
    range = (2..limit)
    primes = Hash[range.map { |num| [num, true] }]
    range.map do |prime|
      (prime..limit).step(prime) do |multiple|
        primes[multiple] = nil if multiple != prime
      end
    end
    primes.compact.keys
  end
end
