# Keeps track of instructions from user

require 'instructions'

describe Instructions do

  let(:stream) { Instructions.new("+++") }

  context "when initialized" do
    it "Converts input into a sequence of instructions" do
      expect(stream.sequence).to eq ["+", "+", "+"]
    end

    it "rejects incorrect data types" do
      expect { Instructions.new(666) }.to raise_error "Invalid syntax"
    end

    it "rejects incorrect syntax" do
      expect { Instructions.new("+~+") }.to raise_error "Invalid command"
    end
  end

  it "returns the value at the current location" do
    expect(stream.value).to eq "+"
  end

  describe "in order to move through instructions" do
    it "has a pointer location" do
      expect(stream.current_location).to eq 0
    end

    it "which can move forwards" do
      stream.move_location_forward
      expect(stream.current_location).to eq 1
    end

    it "which can move backwards" do
      stream.move_location_backward
      expect(stream.current_location).to eq -1
    end
  end

end
