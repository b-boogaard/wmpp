require_relative "../src/ast_divide.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTDivide < Test::Unit::TestCase
	def test_eval
		num = rand(30)
		checks = Array.new

		num.times do
			first = rand(1000)
			second = rand(1000)

			second = 1 if second <= 0
			lhs = ASTNumber.new(first)
			rhs = ASTNumber.new(second)

			divide = ASTDivide.new(lhs, rhs)
			assert_equal((first / second), divide.eval, "#{(first/second)} != divide.eval: #{divide.eval}")
		end
	end
end