require_relative "ast_node.rb"
require_relative "ast.rb"

class ASTVar < ASTNode
	@index
	def initialize(expression, index = 0)
		@value = expression.eval
		@index = index
	end

	def print(out)
		out.write("temp#{@index}")
	end

	def string
		"temp#{@index}"
	end

	def eval
		return @value
	end

	def translate(out)
		out.write("fload #{@index}\n") #maybe
	end
end