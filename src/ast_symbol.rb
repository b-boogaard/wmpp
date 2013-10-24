require_relative "ast_node"

class ASTSymbol

	def initialize(name)
		@name = name
	end

	def eval
		# Not complete
		return @name
	end

	def print(out)
		out.puts(@name)
	end

	def translate(out)
		#define translation to rubinius
	end
end