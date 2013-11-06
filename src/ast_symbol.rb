require_relative "ast_node"

class ASTSymbol < ASTNode

	def initialize(symbol)
		@symbol = symbol
	end

	def eval
		# Not complete
		return @symbol
	end

	def print(out)
		out.puts("#{@symbol.eval}")
	end

	def translate(out)
		#define translation to rubinius
		out.write("field public #{@symbol.to_s} F\n")
	end
end