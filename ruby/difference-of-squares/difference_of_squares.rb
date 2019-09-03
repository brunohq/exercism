class Squares
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def square_of_sum
    sum = (1..n).inject { |sum, i| sum + i }
    square(sum)
  end

  def sum_of_squares
    (1..n).inject { |sum, i| sum + square(i) }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square(n)
    n ** 2
  end
end
