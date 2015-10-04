class Player
  attr_accessor :game, :role
  attr_reader :name

  def initialize(args)
    @@player_count ||= 0
    @@player_count += 1

    @role = args.fetch(:role, :codebreaker)
    @name = args.fetch(:name, "Player #{@@player_count}")
    @game = args.fetch(:game)
  end

  def check_won
    if get_winner.nil?
      return false
    elsif get_winner == role
      if role == :codebreaker
        puts "Congratulations! You cracked the code and won!"
      else
        puts "Congratulations! The code stayed uncracked and you won!"
      end
      return :won
    else
      puts "You lost!"
      return :lost
    end
  end

  private

  def get_winner
    game.winner
  end

  def send_guess(guess)
    game.enter_guess(guess)
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
end
