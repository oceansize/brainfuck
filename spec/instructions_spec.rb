require 'instructions'

describe Instructions do

    it "Converts input into a sequence of instructions" do
      stream = Instructions.new("+++")
      expect(stream.sequence).to eq ["+", "+", "+"]
    end

    it "will not accept anything else" do
      expect { Instructions.new(666) }.to raise_error "Invalid syntax"
    end

    it "will reject incorrect syntax" do
      expect { Instructions.new("+~+") }.to raise_error "Invalid command"
    end

    it 'has an instruction pointer which is initialised to zero' do
      stream = Instructions.new("+++")
      expect(stream.pointer).to eq 0
    end

end
