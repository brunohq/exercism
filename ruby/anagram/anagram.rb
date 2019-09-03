class Anagram
  attr_reader :detector

  def initialize(detector)
    @detector = detector.downcase
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    word = word.downcase
    !same_word?(word) and same_letters?(word)
  end

  def same_word?(word)
    word == detector
  end

  def same_letters?(word)
    detector.chars.sort == word.chars.sort
  end
end
