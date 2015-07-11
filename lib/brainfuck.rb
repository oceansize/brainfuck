class Brainfuck

  attr_reader   :interpreter_stream
  attr_accessor :memory, :pointer

  METHOD_LOOKUP = {
                    "+" => :increase_value,
                    "-" => :decrease_value,
                    ">" => :increment_pointer,
                    "<" => :decrement_pointer,
                    "." => :translate
                  }

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

  def increase_value
    memory[pointer] += 1
  end

  def decrease_value
    memory[pointer] -= 1
  end

  def translate
    memory[pointer] = memory[pointer].chr
  end

  def output
    processed_characters = memory.select { |index| index unless index == 0 }
    processed_characters.join
  end

  def run_methods
    interpreter_stream.each do |command|
      method_name = METHOD_LOOKUP[command]
      send(method_name)
    end
  end

end
