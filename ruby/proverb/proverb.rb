# frozen_string_literal: true

class Proverb
  attr_reader :chain, :qualifier

  def initialize(*chain, qualifier: nil)
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    proverb = []
    chain.each_cons(2) do |partial|
      proverb.push("For want of a #{partial[0]} the #{partial[1]} was lost.")
    end
    proverb.push("And all for the want of a #{[qualifier, chain.first].compact.join(' ')}.")
    proverb.join("\n")
  end
end
