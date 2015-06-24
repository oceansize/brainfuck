require 'brainfuck'

describe Brainfuck do

  it 'uses an array as a namespace' do
    brainfuck = Brainfuck.new
    expect(brainfuck.namespace).to eq([])
  end
end
