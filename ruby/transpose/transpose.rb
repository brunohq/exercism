class Transpose
  def self.transpose(matrix)
    rows = matrix.lines.map(&:rstrip).map(&:chars)
    columns = Array.new( rows.map{ |row| row.size }.max || 0 ) { Array.new(rows.size) }
    rows.each_with_index do |row, r|
      row.each_with_index do |char, c|
        columns[c][r] = char
        (0...r).each { |i| columns[c][i] ||= ' ' }
      end
    end

    columns.map(&:join).join("\n")
  end
end