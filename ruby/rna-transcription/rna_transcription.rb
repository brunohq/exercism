class Complement
  def self.of_dna(dna)
    dna.chars.map { |n| self.transform(n) }.join
  end

  def self.transform(n)
    case n
    when 'C'
      return 'G'
    when 'G'
      return 'C'
    when 'T'
      return 'A'
    when 'A'
      return 'U'
    end
  end
end
