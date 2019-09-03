class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    (0..strand1.size).count { |index| strand1[index] != strand2[index] }
  end
end
