class Raindrops
  RAINDROPS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }

  def self.convert(number)
    conversion = RAINDROPS.keys.map do |factor|
      RAINDROPS[factor] if (number % factor).zero?
    end.join('')

    conversion.empty? ? number.to_s : conversion
  end
end
