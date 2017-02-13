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

  describe "commmands" do
    xit "calls :move_memory_pointer_forward when receiving a '>'" do
    end
    xit "calls :move_memory_pointer_backward when receiving a '<'" do
    end
    xit "calls :increase_value when receiving a '+'" do
    end
    xit "calls :decrease_value when receiving a '-'" do
    end
    xit "calls :translate when receiving a '.'" do
    end
    xit "calls :assign_input when receiving a ','" do
    end
    xit "calls :loop_start when receiving a '['" do
    end
    xit "calls :loop_end when receiving a ']'" do
    end
  end

end
