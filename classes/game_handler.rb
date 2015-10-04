class GameHandler
  attr_accessor :winner

  CODE_LENGTH = 4
  CODE_NUMBERS = (1..6)
  MAX_TRIES = 12

  def initialize
    @code_guesses = []
    @code_solution = []
    @tries = 0
    @winner
  end

  def enter_guess(guess)
    code = to_code(guess)

    validate_code(code)
    save_code(code)
    check_won
  end

  def enter_code_solution(input)
    code_solution = to_code(input)
  end

  private

  def check_won
    if used_all_tries?
      @winner = :codemaker
    elsif code_guessed?
      @winner = :codebraker
    end
  end

  def to_code(string)
    code = []

    string.each_char do |char|
      code << char.to_i
    end
    code
  end

  def save_code(code)
    code_guesses << code
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

  def used_all_tries?
    tries >= MAX_TRIES
  end

  def code_guessed?
    code_guesses.last == code_solution
  end

  def code_guesses
    @code_guesses
  end

  def code_solution
    @code_solution
  end

  def tries
    @tries
  end
end
