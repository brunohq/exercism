# frozen_string_literal: true

class ETL
  def self.transform(legacy)
    legacy.each_with_object({}) do |(score, letters), scoreboard|
      letters.map { |letter| scoreboard[letter.downcase] = score }
    end
  end
end
