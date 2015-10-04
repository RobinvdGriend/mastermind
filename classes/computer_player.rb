class ComputerPlayer < HumanPlayer
  def initialize(args)
    super
    @role = args.fetch(:role, :codebreaker)
  end

  def make_code
    code = generate_code
    send_code(code)
  end

  private

  def generate_code
    code = ""
    code_length.times do
      code << Random.rand(code_numbers).to_s
    end

    code
  end
end
