# Holds values as assigned by brainfuck

require 'memory'

describe Memory do

  let(:memory) { Memory.new }

  context "by default" do

    it "has 30000 slots" do
      expect(memory.capacity).to eq 30000
    end
  end

  it "can have a custom capacity" do
    small_memory = Memory.new(size: 10)
    expect(small_memory.capacity).to eq 10
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
