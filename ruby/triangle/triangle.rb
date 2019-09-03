class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides.sort
  end

  def equilateral?
    return false if !triangle?
    sides.uniq.size == 1
  end

  def isosceles?
    return false if !triangle?
    sides.uniq.size <= 2
  end

  def scalene?
    return false if !triangle?
    sides.uniq.size == 3
  end

  def triangle?
    sides.all? { |side| side > 0 } and sides[0] + sides[1] >= sides[2]
  end
end
