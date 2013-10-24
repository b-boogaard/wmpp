require_relative "../src/token"
require "test/unit"

class TestToken < Test::Unit::TestCase
	
	def test_token_compare
		test_token = Token.new(T_MINUS, '-', 0)
		test_token_2 = Token.new(T_MINUS, '-', 0)

		assert(test_token == test_token_2)
	end

	
end