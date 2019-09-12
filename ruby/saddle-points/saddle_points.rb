# frozen_string_literal: true

class Matrix
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def rows
    matrix
  end

  def columns
    matrix.transpose
  end

  def saddle_points
    points = []
    rows.each_with_index do |row, r|
      row.each_with_index do |point, c|
        col = columns[c]
        points << [r, c] if saddle_point?(point, row, col)
      end
    end
    points
  end

  def saddle_point?(point, row, column)
    row.max == point && column.min == point
  end
end
