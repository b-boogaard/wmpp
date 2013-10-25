require_relative "../src/ast_sum.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTSum < Test::Unit::TestCase
	def test_eval
		num = rand(30)
		checks = Array.new

		num.times do
			first = rand(1000)
			second = rand(1000)

			lhs = ASTNumber.new(first)
			rhs = ASTNumber.new(second)

			sum = ASTSum.new(lhs, rhs)
			assert_equal((first + second), sum.eval, "#{(first+second)} != sum.eval: #{sum.eval}")
		end
	end
end