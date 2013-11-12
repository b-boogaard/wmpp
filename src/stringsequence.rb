require_relative "sequence.rb"

class StringSequence < Sequence
private
public
	attr_accessor :s
	attr_accessor :offset
	def initialize(s)
		@s = s
		@offset = 0
	end

	def peek(delta = 0)
		(@offset + delta < @s.length) ? s[@offset + delta] : -1
	end

	def at
		@offset
	end	

	def shift(delta = 1)
		@offset += delta
	end
end	