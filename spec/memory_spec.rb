require 'memory'

describe Memory do

  it "has 30000 slots" do
    memory = Memory.new
    expect(memory.slots.size).to eq 30000
  end

  describe "has a pointer" do

    it "which has a position" do
      memory = Memory.new
      allow(memory.pointer).to receive(:position).and_return(0)
      expect(memory.pointer.position).to eq 0
    end

    it "can increment the pointer" do
      stream = Instructions.new("+++")
      expect(stream.pointer.position).to eq 0
      stream.pointer.increment
      expect(stream.pointer.position).to eq 1
    end

  end

end
