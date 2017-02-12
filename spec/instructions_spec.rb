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
    allow(stream.pointer).to receive(:position).and_return(0)
    expect(stream.pointer.position).to eq 0
  end

  it "can increment the pointer" do
    stream = Instructions.new("+++")
    expect(stream.pointer.position).to eq 0
    stream.pointer.increment
    expect(stream.pointer.position).to eq 1
  end

end
