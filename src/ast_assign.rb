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

	def string
		return "#{@symbol.eval}=#{@value.string}"
	end

	def translate(out)
		@value.translate(out)
		out.write(" fstore #{@symbol.register}\n")
		out.write(" fload #{@symbol.register}\n")
	end
end