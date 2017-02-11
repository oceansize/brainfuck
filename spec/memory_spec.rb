require 'memory'

describe Memory do

    it 'has 30000 slots' do
      memory = Memory.new
      expect(memory.slots.size).to eq(30000)
    end

end
