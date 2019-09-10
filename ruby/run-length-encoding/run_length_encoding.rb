class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(\D)\1+/) { |s| "#{s.length}#{s[0]}" }
  end

  def self.decode(input)
    input.gsub(/(\d+\D)/) { |s|  s[-1] * s.to_i}
  end
end
