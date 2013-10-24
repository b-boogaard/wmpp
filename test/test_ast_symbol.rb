require_relative "../src/ast_symbol.rb"
require "test/unit"

class TestASTSymbol < Test::Unit::TestCase
	def test_eval
		symbol = ASTSymbol.new("x")
		assert_equal("x", symbol.eval)
	end
end