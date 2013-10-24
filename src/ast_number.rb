require_relative "ast_node.rb"

class ASTNumber < ASTNode
	def initialize(value)
		@value = value
	end

	def eval
		return @value
	end

	def print(out)
		out.puts(@value)
	end

	def translate(out)
		#define translation to rubinius
		raise("No implementation of ASTNumber translate")
	end
end