require_relative "../src/ast_product.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTProduct < Test::Unit::TestCase
	def test_eval
		one = ASTNumber.new(10)
		two = ASTNumber.new(2)

		product = ASTProduct.new(one, two)
		assert_equal(20, product.eval)
	end
end