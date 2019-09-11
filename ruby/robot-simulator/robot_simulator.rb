# frozen_string_literal: true

class Robot
  ORIENTATIONS = %i[north east south west].freeze
  attr_reader :bearing, :coordinates

  def initialize
    @coordinates = [0, 0]
    @bearing = :north
  end

  def orient(direction)
    raise ArgumentError unless ORIENTATIONS.include?(direction)

    @bearing = direction
  end

  def turn_right
    @bearing = ORIENTATIONS[ORIENTATIONS.index(@bearing) + 1] || ORIENTATIONS.first
  end

  def turn_left
    @bearing = ORIENTATIONS[ORIENTATIONS.index(@bearing) - 1]
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end

  def at(*new_coordinates)
    @coordinates = new_coordinates
  end
end

class Simulator
  INSTRUCTIONS = {
    turn_left: 'L',
    turn_right: 'R',
    advance: 'A'
  }.freeze

  def instructions(sequence)
    sequence.chars.map { |i| INSTRUCTIONS.key(i) }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, sequence)
    instructions(sequence).each do |instruction|
      robot.method(instruction).call
    end
  end
end
