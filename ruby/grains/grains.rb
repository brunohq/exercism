# frozen_string_literal: true

class Grains
  START_SQUARE = 2
  TOTAL_SQUARES = 64

  def self.square(number)
    raise ArgumentError if number < 1 || number > TOTAL_SQUARES

    2**(number - 1)
  end

  def self.total(squares = TOTAL_SQUARES)
    2**squares - 1
  end
end
