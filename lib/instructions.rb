class Instructions

  attr_reader :sequence

  def initialize(instructions)
    @sequence = instructions.split(//)
  end
end