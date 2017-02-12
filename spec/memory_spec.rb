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

    it "can increment the pointer" do
      allow(memory.pointer).to receive(:position).and_return(0)
      expect(memory.pointer.position).to eq 0

      allow(memory.pointer).to receive(:increment)
      memory.pointer.increment

      allow(memory.pointer).to receive(:position).and_return(1)
      expect(memory.pointer.position).to eq 1
    end

    it "can decrement the pointer" do
      allow(memory.pointer).to receive(:position).and_return(0)
      expect(memory.pointer.position).to eq 0

      allow(memory.pointer).to receive(:increment)
      memory.pointer.increment

      allow(memory.pointer).to receive(:position).and_return(1)
      expect(memory.pointer.position).to eq 1
    end
  end

end
