require 'pointer'

class Memory

  attr_reader :slots, :pointer

  def initialize
    @slots = Array.new(30000, 0)
    @pointer = Pointer.new
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
