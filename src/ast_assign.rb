require_relative 'ast_node.rb'

class ASTAssign < ASTNode

	def initialize(symbol, value)
		#@symbols = Hash.new(nil)
		@symbol = symbol
		@value = value
	end

=begin
	def insert(symbol, value)
		@symbols[symbol.value] = value.value
	end
=end

	def eval
		# Not complete
		return @value.eval
	end

	def print(out)
=begin
		@symbols.each do |key, value|
			out.puts("symbol:#{key}, value:#{value}")
		end
=end
		out.puts("#{@value.eval}")
	end

	def translate(out)
		#define translation to rubinius
		raise("No implementation of ASTSymbol translate")
	end
end