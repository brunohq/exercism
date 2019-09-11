class Brackets
  BRACKETS = {
    '[' => ']',
    '{' => '}',
    '(' => ')'
  }

  def self.paired?(string)
    stack = []
    string.chars.map do |char|
      if BRACKETS.keys.include?(char)
        stack.push(char)
      elsif BRACKETS.values.include?(char)
        return false if BRACKETS[stack.pop] != char
      end
    end

    stack.empty?
  end
end
