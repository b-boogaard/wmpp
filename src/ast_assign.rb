require_relative 'ast_node.rb'

class ASTAssign < ASTNode

	def initialize(symbol, value)
		#@symbols = Hash.new(nil)
		@symbol = symbol
		@value = value
	end

	def eval
		# Not complete
		return @value.eval
	end

	def print(out)
		out.puts("#{@value.eval}")
	end

	def translate(out)
		#define translation to rubinius
		raise("No implementation of ASTSymbol translate")
	end
end