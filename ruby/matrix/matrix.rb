class Matrix
  attr_reader :rows
  attr_reader :columns

  def initialize(matrix)
    @rows = matrix.each_line.map { |row| row.split.map(&:to_i) }
    @columns = @rows.transpose
  end
end
