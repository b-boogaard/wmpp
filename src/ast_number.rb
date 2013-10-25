require_relative "ast_node.rb"

class ASTNumber < ASTNode
	def initialize(value)
		if (value != nil and value.is_a? Integer)
			@value = value
		else 
			@value = nil
		end
	end

	def eval
		return nil if (@value.nil?)
		return @value.to_i
	end

	def print(out)
		out.write "#{@value}"
	end

	def translate(out)
		#define translation to rubinius
		raise("No implementation of ASTNumber translate")
	end
end