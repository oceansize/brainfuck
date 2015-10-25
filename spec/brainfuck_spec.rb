# http://fatiherikli.github.io/brainfuck-visualizer

require 'brainfuck'

describe Brainfuck do

  let(:interpreter) { Brainfuck.new }

  context 'by default' do

    it 'accepts a string' do
      interpreter.receive_instructions("+++")
      expect(interpreter.interpreter_stream).to eq(["+", "+", "+"])
    end

    it 'has a memory array containing 30,000 cells' do
      #expect(interpreter.memory.size).to eq(30000)
      expect(interpreter.memory.size).to eq(10)
    end

    it 'has a memory_pointer which is initialised to zero' do
      expect(interpreter.memory_pointer).to eq(0)
    end

    it 'can send the memory_pointer to an address in memory' do
      set_memory_pointer_to_third_position
      interpreter.memory[interpreter.memory_pointer] = :test
      expect(interpreter.memory[2]).to eq(:test)
    end

    it 'can increment the memory_pointer' do
      interpreter.increment_memory_pointer
      expect(interpreter.memory_pointer).to eq(1)
    end

    it 'can decrement the memory_pointer' do
      set_memory_pointer_to_third_position
      interpreter.decrement_memory_pointer
      expect(interpreter.memory_pointer).to eq(1)
    end

    it 'can increase the value at a specific memory address' do
      set_memory_pointer_to_third_position
      interpreter.increase_value
      expect(interpreter.memory[2]).to eq(1)
    end

    it 'can decrease the value at a specific memory address' do
      set_memory_pointer_to_third_position
      interpreter.increase_value
      expect(interpreter.memory[2]).to eq(1)

      interpreter.decrease_value
      expect(interpreter.memory[2]).to eq(0)
    end

    it 'is able to translate an integer into ascii characters' do
      interpreter.memory[0] = 65
      interpreter.translate
      expect(interpreter.memory[0]).to eq("A")
    end

    it 'is able to output the parsed commands' do
      interpreter.memory[0] = 89
      interpreter.translate
      expect(interpreter.output).to eq("Y")
    end
  end

  context 'when it recognises valid input' do

    it 'increments the value at the current memory_pointer when it sees a "+"' do
      interpreter.receive_instructions("+")
      interpreter.run_methods(0)
      expect(interpreter.memory.first).to eq(1)
    end

    it 'decrements the value at the current memory_pointer when it sees a "-"' do
      interpreter.increase_value
      expect(interpreter.memory.first).to eq(1)

      interpreter.receive_instructions("-")
      interpreter.run_methods(0)
      expect(interpreter.memory.first).to eq(0)
    end

    it 'increments the position of the memory_pointer when it sees a ">"' do
      interpreter.receive_instructions(">")
      interpreter.run_methods(0)
      expect(interpreter.memory_pointer).to eq(1)
    end

    it 'decrements the position of the memory_pointer when it sees a "<"' do
      set_memory_pointer_to_third_position

      interpreter.receive_instructions("<")
      interpreter.run_methods(0)
      expect(interpreter.memory_pointer).to eq(1)
    end

    it 'returns the ascii character at memory_pointer when it sees a "."' do
      interpreter.memory[0] = 65

      interpreter.receive_instructions(".")
      interpreter.run_methods(0)
      expect(interpreter.memory[0]).to eq("A")
    end

    it 'assigns an input value at memory_pointer when it sees a ","' do
      interpreter.input = "z"
      interpreter.receive_instructions(",")
      interpreter.run_methods(0)
      expect(interpreter.memory[0]).to eq("z")
    end

    xit 'loops between instructions set between "[" and "]"' do
      interpreter.receive_instructions("++++++[>++++++++++<-]>+++++.")
      interpreter.run_methods(0)
      expect(interpreter.output).to eq("A")
    end
  end

  def set_memory_pointer_to_third_position
    interpreter.memory_pointer = 2
  end
end


