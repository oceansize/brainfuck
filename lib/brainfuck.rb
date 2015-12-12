class Brainfuck

  attr_reader   :interpreter_stream, :default_loop_start, :loop_end
  attr_accessor :memory, :memory_pointer, :input, :instruction_pointer, :loop_counter

  BRAINFUCK_METHODS = {
    "+" => :increase_value,
    "-" => :decrease_value,
    ">" => :increment_memory_pointer,
    "<" => :decrement_memory_pointer,
    "." => :translate,
    "," => :assign_input,
    "[" => :begin_loop_iteration,
    "]" => :end_loop
  }

  def initialize
    @memory  = Array.new(10, 0)
    # TODO: Revert to larger array for production version.
    #@memory  = Array.new(30000, 0)
    @memory_pointer = 0
    @input = nil
    @default_loop_start = 0
  end

  def receive_instructions(user_string)
    @interpreter_stream = user_string.split(//)
  end

  def increment_memory_pointer
    self.memory_pointer += 1
  end

  def decrement_memory_pointer
    self.memory_pointer -= 1
  end

  def increase_value
    memory[memory_pointer] += 1
  end

  def decrease_value
    memory[memory_pointer] -= 1
  end

  def translate
    memory[memory_pointer] = memory[memory_pointer].chr
  end

  def assign_input
    memory[memory_pointer] = input
  end

  def begin_loop_iteration
    @loop_counter = 4
  end

  def end_loop
  end

  #def find_next_loop_open
    #interpreter_stream.find_index('[')
  #end

  def loop_start_position

  end

  def find_next_loop_close
    interpreter_stream.find_index(']')
  end

  def output
    processed_characters = memory.select { |index| index unless index == 0 }
    processed_characters.join
  end

  def end_of_interpreter_stream
    interpreter_stream.length
  end

  def run_methods(current_index, last_index: end_of_interpreter_stream)
    return if current_index == last_index

    method_name = command_at(current_index)
    call_method(method_name)

    run_methods(current_index + 1)
  end

  def call_method(interpreter_stream_position)
    method_name = BRAINFUCK_METHODS[interpreter_stream_position]
    send(method_name)
  end

  def command_at(index_position)
    interpreter_stream[index_position]
  end
end
