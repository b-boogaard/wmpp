require_relative "../src/tokens"
require_relative "mock_sequence"
require "test/unit"

class TestTokens < Test::Unit::TestCase

	def test_next_shift
		sequence = MockSequence.new(["1", "2", "3", "+", "-", "/", "*", "8", "9", "0", "\n", ")"])
		tokens = Tokens.new(sequence)
		# Check initial peek
		assert_equal("123", tokens.peek(0).value)
		
		assert_equal("+", tokens.peek(1).value)
		assert_equal("*", tokens.peek(4).value)

		# Shift tokens
		tokens.shift(1)

		#Check next peek
		assert_equal("+", tokens.peek(0).value)

		tokens.shift(2)

		assert_equal("/", tokens.peek(0).value)
		assert_equal("890", tokens.peek(2).value)

		sequence = MockSequence.new(["(", "3", "+", "4", ")"])
		tokens = Tokens.new(sequence)

		assert_equal("(", tokens.peek(0).value)
		assert_equal("3", tokens.peek(1).value)

		tokens.shift(1)

		assert_equal("3", tokens.peek(0).value)
		assert_equal("+", tokens.peek(1).value)

		sequence = MockSequence.new(["1", "2", "3"])
		tokens = Tokens.new(sequence)
		assert_equal("123", tokens.peek(0).value)
	end
end