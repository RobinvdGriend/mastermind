class HumanPlayer
  attr_accessor :game, :role
  attr_reader :name

  def initialize(args)
    @@player_count ||= 0
    @@player_count += 1

    @role = args.fetch(:role, :codebreaker)
    @name = args.fetch(:name, "Player #{@@player_count}")
    @game = args.fetch(:game)
  end

  def take_turn
    print_turn_message

    begin
      guess = get_guess
      send_guess(guess)
    rescue StandardError => error
      puts error
      retry
    end
  end

  def check_won
    if get_winner.nil?
      return false
    elsif get_winner == role
      player_won
      return :won
    else
      player_lost
      return :lost
    end
  end

  private

  def player_lost
    puts "You lost!"
  end

  def player_won
    if role == :codebreaker
      puts "Congratulations! You cracked the code and won!"
    else
      puts "Congratulations! The code stayed uncracked and you won!"
    end
  end

  def get_winner
    game.winner
  end

  def send_guess(guess)
    game.enter_guess(guess)
  end

  def send_code(code)
    game.enter_code_solution(code)
  end

  def print_turn_message
    puts "#{name}, it's your turn!"
  end

  def get_guess
    print "Please enter your guessed code:"
    guess = gets.chomp
    print "\n"

    guess
  end

  def code_numbers
    game.code_numbers
  end

  def code_length
    game.code_length
  end
end
