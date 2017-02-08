require 'instruction_stream'

describe InstructionStream do

    it 'accepts a string' do
      stream = InstructionStream.new("+++")
      expect(stream.sequence).to eq(["+", "+", "+"])
    end

end
