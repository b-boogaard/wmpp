require_relative "../src/ast_minus.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTMinus < Test::Unit::TestCase
	def test_eval
		30.times do
			first = rand(1000)
			second = rand(1000)

			lhs = ASTNumber.new(first)
			rhs = ASTNumber.new(second)

			minus = ASTMinus.new(lhs, rhs)
			assert_equal((first.to_i - second.to_i), minus.eval, "#{(first.to_i-second.to_i)} != minus.eval: #{minus.eval}")
		end
	end

	def test_eval_direct
		first = 10
		second = 10

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		minus = ASTMinus.new(lhs, rhs)
		assert_equal(0, minus.eval, "0 != #{minus.eval}")
	end

	def test_nil_lsh
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		minus = ASTMinus.new(lhs, rhs)
		assert_raise(RuntimeError) {minus.eval}
	end

	def test_product_creation_with_nil
		first = rand(1000)

		lhs = ASTNumber.new(first)

		assert_raise(SyntaxError) {minus = ASTMinus.new(lhs, nil)}
	end

	def test_basic_print
		first = rand(1000)
		second = rand(1000)

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		minus = ASTMinus.new(lhs, rhs)
		ios = IO.new STDOUT.fileno
		assert(minus.print(ios))
	end

	def test_print_with_astnumber_has_nil
		ios = IO.new STDOUT.fileno
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		minus = ASTMinus.new(lhs, rhs)

		assert(minus.print(ios))
	end
end