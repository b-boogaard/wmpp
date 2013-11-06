require_relative "ast_node.rb"
require_relative "ast.rb"

class ASTVar < ASTNode
	@index
	def initialize(expression, index = 0)
		@parent = expression
		@index = index
	end

	def print(out)
		out.write("temp#{@index}")
	end

	def string
		"#{@parent.string}"
	end

	def string2
		"temp#{@index}"
	end

	def eval
		return @parent.eval
	end

	def translate(out)
		out.write("fload #{@index}\n") #maybe
	end
end