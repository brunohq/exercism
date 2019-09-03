class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, count|
      count[word] += 1
    end
  end

  private

  attr_reader :phrase

  WORDS_WITH_APOSTROPHES = /\b[\w']+\b/

  def words
    phrase.downcase.scan(WORDS_WITH_APOSTROPHES)
  end
end
