# Holds values as assigned by brainfuck

require 'memory'

describe Memory do

  let(:memory) { Memory.new }

  it "has 30000 slots" do
    expect(memory.slots.size).to eq 30000
  end

  describe "has a pointer" do

    it "which has a position" do
      expect(memory.current_location).to eq 0
    end

    it "that position can be increased" do
      memory.move_location_forward
      expect(memory.current_location).to eq 1
    end

    it "that position can be decreased" do
      memory.move_location_backward
      expect(memory.current_location).to eq -1
    end
  end

end
