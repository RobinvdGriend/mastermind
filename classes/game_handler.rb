class GameHandler
  CODE_LENGTH = 4
  CODE_NUMBERS = (1..6)

  def initialize
    @code_entries = []
  end

  def enter_guess(guess)
    code = to_code(guess)

    validate_code(code)
  end

  private

  def to_code(string)
    code = []

    string.each_char do |char|
      code << char.to_i
    end
    code
  end

  def validate_code(code)
    unless valid_size?(code)
      raise "Invalid input: enter #{CODE_LENGTH} numbers"
    end

    unless valid_numbers?(code)
      raise "Invalid input: enter numbers #{CODE_NUMBERS.begin} to #{CODE_NUMBERS.end}"
    end
  end

  def valid_size?(code)
    code.size == CODE_LENGTH
  end

  def valid_numbers?(code)
    code.all? { |num| CODE_NUMBERS.include?(num) }
  end
end
