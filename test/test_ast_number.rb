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

	def test_neg_number_string
		number = ASTNumber.new("-1")

		assert_equal(-1, number.eval)
	end

	def test_float_raw
		number = ASTNumber.new(0.123)

		assert_equal(0.123, number.eval)
	end

	def test_neg_float_string
		number = ASTNumber.new("-23.432")

		assert_equal(-23.432, number.eval)
	end

	def test_neg_float
		number = ASTNumber.new(-23.432)
		assert_equal(-23.432, number.eval)
	end

	def test_float_decimal_only
		number = ASTNumber.new(".034")

		assert_equal(0.034, number.eval)
	end

	def test_float_decimal_with_zero
		number = ASTNumber.new("0.034")

		assert_equal(0.034, number.eval)
	end
end