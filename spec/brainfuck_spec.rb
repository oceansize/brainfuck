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
      expect(interpreter.memory.size).to eq(30000)
    end

    it 'has a pointer which is initialised to zero' do
      expect(interpreter.pointer).to eq(0)
    end

    it 'can send the pointer to an address in memory' do
      increase_pointer_by_3
      interpreter.memory[interpreter.pointer] = :test
      expect(interpreter.memory[2]).to eq(:test)
    end

    it 'can increment the pointer' do
      interpreter.increment_pointer
      expect(interpreter.pointer).to eq(1)
    end

    it 'can decrement the pointer' do
      increase_pointer_by_3
      interpreter.decrement_pointer
      expect(interpreter.pointer).to eq(1)
    end

    it 'can increase the value at a specific memory address' do
      increase_pointer_by_3
      interpreter.increase_value
      expect(interpreter.memory[2]).to eq(1)
    end

    it 'can decrease the value at a specific memory address' do
      increase_pointer_by_3
      interpreter.increase_value
      expect(interpreter.memory[2]).to eq(1)
      interpreter.decrease_value
      expect(interpreter.memory[2]).to eq(0)
    end
  end

  context 'when it recognises valid input' do

    it 'increments the value at the current pointer when it sees a "+"' do
      interpreter.receive_instructions("+")
      interpreter.parse
      expect(interpreter.memory.first).to eq(1)
    end
  end

  def increase_pointer_by_3
    interpreter.pointer = 2
  end
end


