require_relative "sequence.rb"

class StringSequence < Sequence
private:
	@s
	@offset
public:
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

class IStreamSequence < Sequence
private:
	@is #istream
	@ahead
	@offset
public:
	def initialize(is) #will this work?
		@is = is
		@offset = 0
		@ahead = Array.new
	end	

	def peek(delta = 0)
		while @ahead.size <= delta do
			ahead << 			
		end
	end 

	def at
		@offset - @ahead.size
	end 

	def shift(delta = 1)

	end 
end