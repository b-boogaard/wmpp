require_relative "../src/ast_minus.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTMinus < Test::Unit::TestCase
	def test_eval
		num = rand(30)
		checks = Array.new

		num.times do
			first = rand(1000)
			second = rand(1000)

			lhs = ASTNumber.new(first)
			rhs = ASTNumber.new(second)

			minus = ASTMinus.new(lhs, rhs)
			assert_equal((first - second), minus.eval, "#{(first-second)} != minus.eval: #{minus.eval}")
		end
	end
end