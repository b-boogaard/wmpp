require_relative "../src/ast_minus.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTMinus < Test::Unit::TestCase
	def test_eval
		30.times do |x|
			if x % 2 == 0
				first = rand(1000)
				second = rand(1000)
			else
				first = rand(1000)
				second = rand(1000)
				second = second.to_f
			end

			lhs = ASTNumber.new(first.to_s) # passed as Sting
			rhs = ASTNumber.new(second)		# passed as either Integer or Float

			minus = ASTMinus.new(lhs, rhs)
			if x % 2 == 0
				assert_equal((first.to_i - second.to_i), minus.eval, "#{(first.to_i-second.to_i)} != minus.eval: #{minus.eval}")
			else
				assert_equal((first.to_f - second.to_f), minus.eval, "#{(first.to_f - second.to_f)} != minus.eval: #{minus.eval}")
			end
		end
	end

	def test_decimal
		first = 10
		second = 2.5

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		minus = ASTMinus.new(lhs, rhs)
		assert_equal(7.5, minus.eval)
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

	def test_minus_creation_with_nil
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