require_relative "../src/ast_minus.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTMinus < Test::Unit::TestCase
	def test_eval
		one = ASTNumber.new(10)
		two = ASTNumber.new(2)

		product = ASTMinus.new(one, two)
		assert_equal(8, product.eval)
	end
end