require_relative '../src/ast_symbol.rb'
require 'test/unit'

class TestSymbol < Test::Unit::TestCase
	def test_symbol
		index1 = 500
		index2 = 500
		var1 = "x"
		var2 = "y"

		symbol1 = ASTSymbol.new(index1, var1)
		symbol2 = ASTSymbol.new(index2, var2)

		assert_equal("x", symbol1.eval)
		assert_equal("y", symbol2.eval)

		assert_equal("x", symbol1.string)
		assert_equal("y", symbol2.string)

		nil_symbol = ASTSymbol.new(index1, nil)

		assert_nil(nil_symbol.string)
	end
end