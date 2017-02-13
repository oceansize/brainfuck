require 'memory'
require 'instructions'

class Brainfuck

  attr_reader :memory, :instruction_stream

  METHOD_LOOKUP = {
    "+" => :increase_value,
    "-" => :decrease_value,
    ">" => :increment_pointer,
    "<" => :decrement_pointer,
    "." => :translate,
    "," => :assign_input,
    "[" => :loop_start,
    "]" => :loop_end
  }

  def initialize(user_commands)
    @memory = Memory.new
    @instruction_stream = Instructions.new(user_commands)
  end
end
