require 'pointer'

describe Pointer do

	let(:pointer) { Pointer.new }

  it "has a position" do
    expect(pointer.position).to eq 0
  end

	it "can increment the pointer" do
		pointer.increment
		expect(pointer.position).to eq 1
	end

	it 'can decrement the pointer' do
		set_pointer_to_third_position
		pointer.decrement
		expect(pointer.position).to eq 1
	end

	def set_pointer_to_third_position
		2.times { |time| pointer.increment }
	end

end
