class ArmstrongNumbers
  def self.include?(number)
    size = number.digits.length
    number.digits.sum { |d| d**size } == number
  end
end
