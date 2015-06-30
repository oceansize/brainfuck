require 'brainfuck'

describe Brainfuck do

  let(:interpreter) { Brainfuck.new }

  context 'by default' do

    it 'accepts a string' do
      interpreter.receive_instructions("+++")
      expect(interpreter.input).to eq(["+", "+", "+"])
    end

    it 'has a memory array containing 30,000 cells' do
      expect(interpreter.memory.size).to eq(30000)
    end

    it 'has a pointer which is initialised to zero' do
      expect(interpreter.pointer).to eq(0)
    end
  end

  context 'when it recognises valid input' do

    it 'increments the value at the pointer when it sees a "+"' do
      interpreter.receive_instructions("+")
      interpreter.parse
      expect(interpreter.memory.first).to eq(1)
    end
  end
end
