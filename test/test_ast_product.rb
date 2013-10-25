require_relative "../src/ast_product.rb"
require_relative "../src/ast_number.rb"
require "test/unit"

class TestASTProduct < Test::Unit::TestCase
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

				product = ASTProduct.new(lhs, rhs)
	
			if x % 2 == 0
				assert_equal((first.to_i * second.to_i), product.eval, "#{(first.to_i * second.to_i)} != product.eval: #{product.eval}")
			else
				assert_equal((first.to_f * second.to_f), product.eval, "#{(first.to_f * second.to_f)} != product.eval: #{product.eval}")
			end
		end
	end

	def test_eval_direct
		first = 10
		second = 10

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		product = ASTProduct.new(lhs, rhs)
		assert_equal(100, product.eval, "100 != #{product.eval}")
	end

	def test_nil_lsh
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		product = ASTProduct.new(lhs, rhs)
		assert_raise(RuntimeError) {product.eval}
	end

	def test_product_creation_with_nil
		first = rand(1000)

		lhs = ASTNumber.new(first)

		assert_raise(SyntaxError) {product = ASTProduct.new(lhs, nil)}
	end

	def test_basic_print
		first = rand(1000)
		second = rand(1000)

		lhs = ASTNumber.new(first)
		rhs = ASTNumber.new(second)

		product = ASTProduct.new(lhs, rhs)
		ios = IO.new STDOUT.fileno
		assert(product.print(ios))
	end

	def test_print_with_astnumber_has_nil
		ios = IO.new STDOUT.fileno
		first = rand(1000)

		lhs = ASTNumber.new(nil)
		rhs = ASTNumber.new(first)

		product = ASTProduct.new(lhs, rhs)

		assert(product.print(ios))
	end
end