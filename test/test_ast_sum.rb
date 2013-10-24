require_relative "../src/ast_sum.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTSum < Test::Unit::TestCase
	def test_eval
		one = ASTNumber.new(10)
		two = ASTNumber.new(2)

		sum = ASTSum.new(one, two)
		assert_equal(12, sum.eval)
	end
end