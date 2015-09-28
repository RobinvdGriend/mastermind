class HumanPlayer
  attr_accessor :game
  attr_reader :name

  def initialize(args)
    @@player_count ||= 0
    @@player_count += 1

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

  private

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
