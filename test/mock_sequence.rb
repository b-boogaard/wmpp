# Basic implementation in order to test tokens.rb

class MockSequence

	def initialize(arry)
		@sequence = arry
		@index = 0
	end

	def peek
		return @sequence[@index] if @index < (@sequence.length - 1)
	end

	def shift
		@index += 1
		#@sequence.shift
	end

	def at
		return @index
	end
end