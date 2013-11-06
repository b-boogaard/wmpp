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

	def string
    if (@symbol.eval != nil)
      symbol = @symbol.string
    else
      lhs = "nil" 
    end
    return "(#{@symbol.eval})\n"
  end

	def translate(out)
		#define translation to rubinius
		out.write("field public #{@symbol.to_s} F\n")
	end
end