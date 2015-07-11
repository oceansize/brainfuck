class Brainfuck

  attr_reader   :interpreter_stream,
                :increase_value
  attr_accessor :memory, :pointer

  METHOD_LOOKUP = { "+" => IncreaseValue }


  def initialize
    @memory  = Array.new(30000, 0)
    @pointer = 0
  end

  def receive_instructions(user_string)
    @interpreter_stream = user_string.split(//)
  end

  def increment_pointer
    self.pointer += 1
  end

  def decrement_pointer
    self.pointer -= 1
  end

  #def increase_value
    #memory[pointer] += 1
  #end

  #@increase_value = Proc.new { memory[pointer] += 1 }

  def decrease_value
    memory[pointer] -= 1
  end

  def method_lookup
    METHOD_LOOKUP["+"].call(memory)
  end

  def parse
    interpreter_stream.each do |command|
      sym = METHOD_LOOKUP[command]
      send(sym)
    end
  end

end
