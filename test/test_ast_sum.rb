require_relative "../src/ast_sum.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTSum < Test::Unit::TestCase
	def test_eval
		30.times do
			first = rand(1000)
			second = rand(1000)

			lhs = ASTNumber.new(first)
			rhs = ASTNumber.new(second)

			sum = ASTSum.new(lhs, rhs)
			assert_equal((first.to_i + second.to_i), sum.eval, "#{(first.to_i+second.to_i)} != sum.eval: #{sum.eval}")
		end
	end

	def test_eval_direct
		first = 10
		second = 10

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		sum = ASTSum.new(lhs, rhs)
		assert_equal(20, sum.eval, "100 != #{sum.eval}")
	end

	def test_nil_lsh
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		sum = ASTSum.new(lhs, rhs)
		assert_raise(RuntimeError) {sum.eval}
	end

	def test_product_creation_with_nil
		first = rand(1000)

		lhs = ASTNumber.new(first)

		assert_raise(SyntaxError) {sum = ASTSum.new(lhs, nil)}
	end

	def test_basic_print
		first = rand(1000)
		second = rand(1000)

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		sum = ASTSum.new(lhs, rhs)
		ios = IO.new STDOUT.fileno
		assert(sum.print(ios))
	end

	def test_print_with_astnumber_has_nil
		ios = IO.new STDOUT.fileno
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		sum = ASTSum.new(lhs, rhs)

		assert(sum.print(ios))
	end
end