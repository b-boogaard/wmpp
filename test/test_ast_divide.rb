require_relative "../src/ast_divide.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTDivide < Test::Unit::TestCase
	def test_eval
		one = ASTNumber.new(10)
		two = ASTNumber.new(2)

		product = ASTDivide.new(one, two)
		assert_equal(5, product.eval)
	end
end