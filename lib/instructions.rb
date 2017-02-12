require 'pointer'

class Instructions

  attr_reader :sequence, :pointer

  def initialize(instructions)
    @sequence = sanitize(instructions)
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

  def value
    sequence[current_location]
  end

  private

  def sanitize(instructions)
    raise "Invalid syntax" unless instructions.is_a?(String)
    validate(instructions)
  end

  def validate(instructions)
    sequence = instructions.split(//)
    sequence.each do |command|
      raise "Invalid command" unless Brainfuck::METHOD_LOOKUP.has_key?(command)
    end
  end
end
