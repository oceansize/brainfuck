# knows how to send instructions to pointers

require 'brainfuck'

describe Brainfuck do

  let(:brainfuck) { Brainfuck.new("+++") }

  context "upon initialisation" do
    it "has a memory" do
      expect(brainfuck).to respond_to :memory
    end

    it "has an instruction stream" do
      expect(brainfuck).to respond_to :instruction_stream
    end
  end

end
