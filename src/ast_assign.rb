require_relative 'ast_node.rb'

class ASTAssign < ASTNode

	def initialize(symbol, value)
		if symbol.is_a? ASTSymbol
			@symbol = symbol
			@value = value
		end
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