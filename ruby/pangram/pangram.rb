class Pangram
  def self.pangram?(sentence)
    sentence = sentence.downcase.chars
    alphabet = [*'a'..'z']
    return (alphabet - sentence).empty?
  end
end
