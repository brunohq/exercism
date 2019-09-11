# frozen_string_literal: true

class Board
  MINE_CELL = '*'
  BORDER_CELL = '|'
  EMPTY_CELL = ' '
  BORDER_PATTERN = /\+\-+\+/.freeze
  OFFSETS = (-1..1).to_a.freeze

  def self.transform(board)
    size = board.first.length
    raise ArgumentError unless valid_borders?([board.first, board.last])

    [board.first, *transform_middle(board, size), board.last]
  end

  def self.transform_middle(board, size)
    board.each_with_index.map do |line, i|
      next if i.zero? || i == board.length - 1
      raise ArgumentError if line.length != size || line[0] != '|' || line[-1] != '|'

      line.chars.each_with_index.map do |position, j|
        if border_or_mine?(position)
          position
        elsif empty?(position)
          mines = 0
          OFFSETS.map do |offset_i|
            OFFSETS.map do |offset_j|
              mines += 1 if mine?(board[i + offset_i][j + offset_j])
            end
          end
          mines.zero? ? ' ' : mines
        else
          raise ArgumentError
        end
      end.join
    end.compact
  end

  def self.border_or_mine?(cell)
    [BORDER_CELL, MINE_CELL].include?(cell)
  end

  def self.empty?(cell)
    EMPTY_CELL == cell
  end

  def self.mine?(cell)
    MINE_CELL == cell
  end

  def self.valid_borders?(borders)
    borders.all? { |border| BORDER_PATTERN === border }
  end
end
