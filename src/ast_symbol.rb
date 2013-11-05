require_relative "ast_node"

class ASTSymbol < ASTNode

	def initialize(symbol)
		#@symbols = Hash.new(nil)
		@symbol = symbol
	end

	def eval
		# Not complete
		return @symbol.eval
	end

	def print(out)
		out.puts("#{@symbol.eval}")
	end

	def translate(out)
		#define translation to rubinius
		out.write("field public #{@symbol.to_s} F\n")
	end
end