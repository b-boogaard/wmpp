require_relative "../src/tokens"
require_relative "mock_sequence"
require "test/unit"

class TestTokens < Test::Unit::TestCase

	def test_next_shift
		sequence = MockSequence.new(["h", "e", "l", "l", "o", "\n"])
		tokens = Tokens.new(sequence)
		# Check initial peek
		assert_equal("h", tokens.peek(0).value)
		
		assert_equal("e", tokens.peek(1).value)
		assert_equal("o", tokens.peek(4).value)

		# Shift tokens
		tokens.shift(1)

		#Check next peek
		assert_equal("e", tokens.peek(0).value)

		tokens.shift(2)

		assert_equal("l", tokens.peek(0).value)
	end
end