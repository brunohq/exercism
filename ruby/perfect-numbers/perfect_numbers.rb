# frozen_string_literal: true

class PerfectNumber
  def self.classify(number)
    raise RuntimeError unless number.positive?

    aliquot = (1...number).select { |candidate| (number % candidate).zero? }.sum
    aliquot == number ? 'perfect' :
      aliquot > number ? 'abundant' : 'deficient'
  end
end
