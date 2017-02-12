require 'pointer'

class Memory

  attr_reader :slots, :pointer

  def initialize
    @slots = Array.new(30000, 0)
    @pointer = Pointer.new
  end
end
