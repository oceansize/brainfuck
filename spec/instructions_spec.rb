require 'instructions'

describe Instructions do

    it 'accepts a string' do
      stream = Instructions.new("+++")
      expect(stream.sequence).to eq(["+", "+", "+"])
    end

end
