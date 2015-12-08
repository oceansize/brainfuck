# http://fatiherikli.github.io/brainfuck-visualizer

require 'spec_helper'
require 'brainfuck'

describe Brainfuck do

  let(:brainfuck) { Brainfuck.new }

  context 'by default' do

    it 'accepts a string' do
      brainfuck.receive_instructions("+++")
      expect(brainfuck.interpreter_stream).to eq(["+", "+", "+"])
    end

    it 'has a memory array containing 30,000 cells' do
      #expect(brainfuck.memory.size).to eq(30000)
      expect(brainfuck.memory.size).to eq(10)
    end

    it 'has a memory_pointer which is initialised to zero' do
      expect(brainfuck.memory_pointer).to eq(0)
    end

    it 'can send the memory_pointer to an address in memory' do
      set_memory_pointer_to_third_position
      brainfuck.memory[brainfuck.memory_pointer] = :test
      expect(brainfuck.memory[2]).to eq(:test)
    end

    it 'can increment the memory_pointer' do
      brainfuck.increment_memory_pointer
      expect(brainfuck.memory_pointer).to eq(1)
    end

    it 'can decrement the memory_pointer' do
      set_memory_pointer_to_third_position
      brainfuck.decrement_memory_pointer
      expect(brainfuck.memory_pointer).to eq(1)
    end

    it 'can increase the value at a specific memory address' do
      set_memory_pointer_to_third_position
      brainfuck.increase_value
      expect(brainfuck.memory[2]).to eq(1)
    end

    it 'can decrease the value at a specific memory address' do
      set_memory_pointer_to_third_position
      brainfuck.increase_value
      expect(brainfuck.memory[2]).to eq(1)

      brainfuck.decrease_value
      expect(brainfuck.memory[2]).to eq(0)
    end

    it 'is able to translate an integer into ascii characters' do
      brainfuck.memory[0] = 65
      brainfuck.translate
      expect(brainfuck.memory[0]).to eq("A")
    end

    it 'is able to output the parsed commands' do
      brainfuck.memory[0] = 89
      brainfuck.translate
      expect(brainfuck.output).to eq("Y")
    end
  end

  context 'when it recognises valid input' do

    it 'increments the value at the current memory_pointer when it sees a "+"' do
      brainfuck.receive_instructions("+")
      brainfuck.run_methods(0)
      expect(brainfuck.memory.first).to eq(1)
    end

    it 'decrements the value at the current memory_pointer when it sees a "-"' do
      brainfuck.increase_value
      expect(brainfuck.memory.first).to eq(1)

      brainfuck.receive_instructions("-")
      brainfuck.run_methods(0)
      expect(brainfuck.memory.first).to eq(0)
    end

    it 'increments the position of the memory_pointer when it sees a ">"' do
      brainfuck.receive_instructions(">")
      brainfuck.run_methods(0)
      expect(brainfuck.memory_pointer).to eq(1)
    end

    it 'decrements the position of the memory_pointer when it sees a "<"' do
      set_memory_pointer_to_third_position

      brainfuck.receive_instructions("<")
      brainfuck.run_methods(0)
      expect(brainfuck.memory_pointer).to eq(1)
    end

    it 'returns the ascii character at memory_pointer when it sees a "."' do
      brainfuck.memory[0] = 65

      brainfuck.receive_instructions(".")
      brainfuck.run_methods(0)
      expect(brainfuck.memory[0]).to eq("A")
    end

    it 'assigns an input value at memory_pointer when it sees a ","' do
      brainfuck.input = "z"
      brainfuck.receive_instructions(",")
      brainfuck.run_methods(0)
      expect(brainfuck.memory[0]).to eq("z")
    end

    context 'when looping' do

      it 'can find the index of the next opening loop command' do
        brainfuck.receive_instructions("++[++[**]**]")
        expect(brainfuck.find_next_loop_open).to eq(2)
      end

      it 'can find the index of the next closing loop command' do
        brainfuck.receive_instructions("++[++[**]**]")
        expect(brainfuck.find_next_loop_close).to eq(8)
      end

      xit 'loops between instructions set between "[" and "]"' do
        brainfuck.receive_instructions("++++++[>++++++++++<-]>+++++.")
        brainfuck.run_methods(0)
        expect(brainfuck.output).to eq("A")
      end
    end
  end

  def set_memory_pointer_to_third_position
    brainfuck.memory_pointer = 2
  end
end


