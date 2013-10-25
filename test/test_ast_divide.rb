require_relative "../src/ast_divide.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTDivide < Test::Unit::TestCase
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

			second = 1 if second <= 0

			lhs = ASTNumber.new(first.to_s) # passed as Sting
			rhs = ASTNumber.new(second)		# passed as either Integer or Float

			divide = ASTDivide.new(lhs, rhs)
			if x % 2 == 0
				assert_equal((first.to_i / second.to_i), divide.eval, "#{(first.to_i/second.to_i)} != divide.eval: #{divide.eval}")
			else
				assert_equal((first.to_f / second.to_f), divide.eval, "#{(first.to_f/second.to_f)} != divide.eval: #{divide.eval}")
			end
		end
	end

	def test_eval_direct
		first = 20
		second = 10

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		divide = ASTDivide.new(lhs, rhs)
		assert_equal(2, divide.eval, "0 != #{divide.eval}")
	end

	def test_eval_float
		first = "9"
		second = "2.0"

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		divide = ASTDivide.new(lhs,rhs)
		assert_equal(4.5, divide.eval, "4.5 != #{divide.eval}")
	end

	def test_integer_division
		first = 9
		second = 2

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		divide = ASTDivide.new(lhs,rhs)
		assert_equal(4, divide.eval, "4 !- #{divide.eval}")
	end

	def test_nil_lsh
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		divide = ASTDivide.new(lhs, rhs)
		assert_raise(RuntimeError) {divide.eval}
	end

	def test_product_creation_with_nil
		first = rand(1000)

		lhs = ASTNumber.new(first)

		assert_raise(SyntaxError) {divide = ASTDivide.new(lhs, nil)}
	end

	def test_basic_print
		first = rand(1000)
		second = rand(1000)

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		divide = ASTDivide.new(lhs, rhs)
		ios = IO.new STDOUT.fileno
		assert(divide.print(ios))
	end

	def test_print_with_astnumber_has_nil
		ios = IO.new STDOUT.fileno
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		divide = ASTDivide.new(lhs, rhs)

		assert(divide.print(ios))
		ios.close
	end

	def test_divide_by_zero
		first = 10
		second = 0

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		divide = ASTDivide.new(lhs,rhs)

		assert_raise(SyntaxError) {divide.eval} 
	end
end