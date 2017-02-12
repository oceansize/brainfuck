class Pointer

  attr_accessor :position

  def initialize
    @position = 0
  end

  def increment
    self.position += 1
  end

  def decrement
    self.position -= 1
  end
end
