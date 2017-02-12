require 'pointer'

class Memory

  attr_reader :slots, :pointer

  def initialize(size: 30000, default_content: 0)
    @slots = Array.new(size, default_content)
    @pointer = Pointer.new
  end

  def capacity
    slots.size
  end

  def current_location
    pointer.position
  end

  def move_location_forward
    pointer.increment
  end

  def move_location_backward
    pointer.decrement
  end
end
