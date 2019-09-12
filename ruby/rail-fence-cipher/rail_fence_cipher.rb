class RailFenceCipher
  def self.encode(string, rails)
    encoded = Hash.new('')
    current_rail = 1
    direction = 'down'
    string.chars.each_with_index do |char,index|
      encoded[current_rail] += char
      if current_rail == 1
        direction = 'down'
      elsif current_rail == rails
        direction = 'up'
      end

      if direction == 'down'
        current_rail += 1
      elsif direction == 'up'
        current_rail -= 1
      end
    end
    encoded.values.join
  end

  def self.decode(string, rails)

  end
end
