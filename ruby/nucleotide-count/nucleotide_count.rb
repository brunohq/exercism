class Nucleotide
  TYPES = %w[A T C G].freeze

  attr_reader :dna

  def initialize(dna)
    @dna = dna
  end

  def self.from_dna(dna)
    raise ArgumentError if dna.chars.select { |n| TYPES.include?(n) }.length != dna.length

    new(dna)
  end

  def count(nucleotide)
    dna.chars.count(nucleotide)
  end

  def histogram
    TYPES.map { |n| [n, count(n)] }.to_h
  end
end
