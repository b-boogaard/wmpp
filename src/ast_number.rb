require_relative "ast_node.rb"

class ASTNumber < ASTNode
	def initialize(value)
		if value == nil
			@value = nil
		elsif value.to_s =~ (/^[-]?[0-9]+([0-9]*)?$/)
			@value = value.to_i
		elsif value.to_s =~ (/^([-]?[0-9]+([0-9]*)?)?\.[0-9]+([0-9]*)?$/)
			@value = value.to_f
		else
			raise SyntaxError, "Trying to initialize ASTNumber with non-integer or non-float value"
		end
	end

	def eval
		return nil if (@value.nil?)
		if @value.is_a? Float
			return @value.to_f
		end
		if @value.is_a? Integer
			return @value.to_i
		end
	end

	def print(out)
		out.write "#{@value}"
	end

	def translate(out)
		#define translation to rubinius
		raise("No implementation of ASTNumber translate")
	end
end