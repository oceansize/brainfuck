class Brainfuck

  attr_reader   :input
  attr_accessor :memory, :pointer

  def initialize
    @memory  = Array.new(30000, 0)
    @pointer = 0
  end

  def receive_instructions(user_string)
    @input = user_string.split(//)
  end
end
