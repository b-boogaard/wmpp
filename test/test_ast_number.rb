require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTNumber < Test::Unit::TestCase
	def test_eval
		number = ASTNumber.new(10)

		assert_equal(10, number.eval)
	end

	def test_string_to_integer
		number = ASTNumber.new("10")

		assert_equal(10, number.eval)
	end

	def test_string_to_float
		number = ASTNumber.new("10.102")

		assert_equal(10.102, number.eval)
	end
end