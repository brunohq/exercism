# frozen_string_literal: true

class ResistorColorTrio
  COLOR_CODES = %w[black brown red orange yellow green blue violet grey white].freeze
  attr_reader :colors

  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError unless colors.all? { |color| COLOR_CODES.include?(color) }

    value = (COLOR_CODES.index(colors[0]) * 10 + COLOR_CODES.index(colors[1])) * 10.pow(COLOR_CODES.index(colors[2]))
    "Resistor value: #{to_s(value)}"
  end

  def to_s(value)
    value < 1000 ? "#{value} ohms" : "#{(value.to_f / 1000).to_i} kiloohms"
  end
end
