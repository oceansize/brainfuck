class Memory

	attr_reader :slots

	def initialize
		@slots = Array.new(30000, 0)
	end
end
