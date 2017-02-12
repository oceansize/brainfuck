# knows how to send instructions to pointers

require 'brainfuck'

describe Brainfuck do

  let(:interpreter) { Brainfuck.new }

  context 'by default' do

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

    it 'increments the value at the current pointer when it sees a "+"' do
      interpreter.receive_instructions("+")
      interpreter.run_methods
      expect(interpreter.memory.first).to eq(1)
    end

    it 'decrements the value at the current pointer when it sees a "-"' do
      interpreter.increase_value
      expect(interpreter.memory.first).to eq(1)

      interpreter.receive_instructions("-")
      interpreter.run_methods
      expect(interpreter.memory.first).to eq(0)
    end

    it 'increments the position of the pointer when it sees a ">"' do
      interpreter.receive_instructions(">")
      interpreter.run_methods
      expect(interpreter.pointer).to eq(1)
    end

    it 'decrements the position of the pointer when it sees a "<"' do
      interpreter.receive_instructions("<")
      interpreter.run_methods
      expect(interpreter.pointer).to eq(-1)
    end

    it 'returns the ascii character at pointer when it sees a "."' do
      interpreter.memory[0] = 65

      interpreter.receive_instructions(".")
      interpreter.run_methods
      expect(interpreter.memory[0]).to eq("A")
    end

    it 'assigns an input value at pointer when it sees a ","' do
      interpreter.input = "z"
      interpreter.receive_instructions(",")
      interpreter.run_methods
      expect(interpreter.memory[0]).to eq("z")
    end
  end
end
