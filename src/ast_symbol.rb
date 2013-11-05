require_relative "ast_node"

class ASTSymbol < ASTNode

	def initialize(symbol)
		#@symbols = Hash.new(nil)
		@symbol = symbol
	end

=begin
	def insert(symbol, value)
		@symbols[symbol.value] = value.value
	end
=end

	def eval
		# Not complete
		return @symbol.eval
	end

	def print(out)
=begin
		@symbols.each do |key, value|
			out.puts("symbol:#{key}, value:#{value}")
		end
=end
		out.puts("#{@symbol.eval}")
	end

	def translate(out)
		#define translation to rubinius
		raise("No implementation of ASTSymbol translate")
	end
end