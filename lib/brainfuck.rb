class Brainfuck

  attr_reader   :interpreter_stream
  attr_accessor :memory, :memory_pointer, :input, :instruction_pointer

  METHOD_LOOKUP = {
    "+" => :increase_value,
    "-" => :decrease_value,
    ">" => :increment_memory_pointer,
    "<" => :decrement_memory_pointer,
    "." => :translate,
    "," => :assign_input,
    "[" => :begin_loop,
    "]" => :finish_loop
  }

  def initialize
    @memory  = Array.new(10, 0)
    # TODO: Revert to larger array for production version.
    #@memory  = Array.new(30000, 0)
    @memory_pointer = 0
    @input = nil
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

  def begin_loop
    assign_counter
  end

  def assign_counter
    @loop_counter = memory[memory_pointer]
  end

  def assign_loop_start
    @loop_start = interpreter_stream
  end

  def output
    processed_characters = memory.select { |index| index unless index == 0 }
    processed_characters.join
  end

  def end_of_interpreter_stream
    interpreter_stream.length
  end

  def run_methods(counter)
    return if counter == end_of_interpreter_stream

    current_command = interpreter_stream[counter]
    call_method(current_command)

    run_methods(counter + 1)
  end

  def call_method(interpreter_stream_position)
    method_name = METHOD_LOOKUP[interpreter_stream_position]
    send(method_name)
  end

  #def run_methods
    #interpreter_stream.each do |command|
      #method_name = METHOD_LOOKUP[command]
      #send(method_name)
    #end
  #end

end
