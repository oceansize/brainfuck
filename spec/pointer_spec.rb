require 'pointer'

describe Pointer do

  it 'can increment the pointer' do
    pointer = Pointer.new
    pointer.increment
    expect(pointer.position).to eq(1)
  end

end
