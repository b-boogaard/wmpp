require_relative "../src/ast_product.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTProduct < Test::Unit::TestCase
	def test_eval
		num = rand(30)
		checks = Array.new

		num.times do
			first = rand(1000)
			second = rand(1000)

			lhs = ASTNumber.new(first)
			rhs = ASTNumber.new(second)

			product = ASTProduct.new(lhs, rhs)
			assert_equal((first * second), product.eval, "#{(first*second)} != product.eval: #{product.eval}")
		end
	end
end