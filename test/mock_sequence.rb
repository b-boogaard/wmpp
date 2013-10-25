# Basic implementation in order to test tokens.rb

class MockSequence

	def initialize(arry)
		@sequence = arry
		@index = 0
	end

	def peek(n)
		if @index + n < (@sequence.length)
		 	return @sequence[@index + n]
		else
			return -1
		end
	end

	def shift
		@index += 1
		#@sequence.shift
	end

	def at
		return @index
	end
end