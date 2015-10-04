class GameHandler
  attr_accessor :winner

  def initialize
    @code_guesses = []
    @code_solution = []

    @game_rules = {code_length: 4, code_numbers: (1..6), max_tries: 12}
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
    @code_solution = to_code(input)
  end

  def max_tries
    game_rules[:max_tries]
  end

  def code_length
    game_rules[:code_length]
  end

  def code_numbers
    game_rules[:code_numbers]
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
      raise "Invalid input: enter #{code_length} numbers"
    end

    unless valid_numbers?(code)
      raise "Invalid input: enter numbers #{code_numbers.begin} to #{code_numbers.end}"
    end
  end

  def valid_size?(code)
    code.size == code_length
  end

  def valid_numbers?(code)
    code.all? { |num| code_numbers.include?(num) }
  end

  def used_all_tries?
    tries >= max_tries
  end

  def code_guessed?
    code_guesses.last == code_solution
  end

  def code_guesses
    @code_guesses
  end

  def tries
    @tries
  end

  def game_rules
    @game_rules
  end

  def code_solution
    @code_solution
  end
end
