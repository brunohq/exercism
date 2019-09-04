# frozen_string_literal: true

class Isogram
  def self.isogram?(input)
    trimmed = input.downcase.chars.reject { |c| (c == ' ') || (c == '-') }
    trimmed.length == trimmed.uniq.length
  end
end
