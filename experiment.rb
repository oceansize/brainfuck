def looper(array)
  array_pointer = memory_pointer
  * Find array index of input stream
  * Find Loop Counter (The number at memory[pointer] where the '[' is)
  * Find Loop End (The index of the input stream where ']' is)
  * 
end

start_of_input_stream = 0
end_of_input_stream = input_stream.length

def run_methods(counter)
  return if counter == 0

  current_command = input_stream[counter]
  method_name = METHOD_LOOKUP[current_command]
  send(method_name)

  looper(counter + 1)
end

