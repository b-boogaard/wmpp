require_relative "ast_node"

class ASTSymbol < ASTNode

	attr_reader :register
	attr_reader :name
	
	def initialize(register, name)
		@register = register
		@name = name
	end

	def eval
		return @name
	end

	def print(out)
		out.puts("#{@name}")
	end

	def string
    if (@name != nil)
      return "#{@name}"
    else
      return nil
    end
  end

	def translate(out)
		#define translation
		out.write("	fload #{@register}\n")
	end
end