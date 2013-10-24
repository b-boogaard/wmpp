require_relative "../src/ast_node"
require "test/unit"

class Test_ASTNode < Test::Unit::TestCase
	def test_eval
		node = ASTNode.new
		assert_not_nil(node.eval)
	end
end