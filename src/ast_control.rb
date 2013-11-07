require_relative "ast_node.rb"
require_relative "ast.rb"

class ASTIf < ASTNode
	@i
	def initialize(expression, index)
		@conditional = expression
		@i = index
	end
=begin
	def eval
		if (@conditional.eval==1)

		end
	end
=end
	def string
		return "if"
	end

	def translate(out)
		@conditional.translate(out)
		out.write("	ldc 1.0\n")
		out.write("	fcmpl\n")
		out.write("	dup\n")
		out.write("	ifeq Bcon#{@i}\n")
		out.write("	pop\n")
		out.write("	goto Econ#{@i}\n")
		out.write("Bcon#{@i}:\n")
		out.write("	ifeq itrue#{@i}\n")
		out.write("	ldc 0.0\n\tgoto iend#{@i}\n")
		out.write("itrue#{@i}:\n\tldc 1.0\n")
		out.write("iend#{@i}:\n")
		#out.write("	i2f\n")
	end
end


class ASTWhile < ASTNode
	@i
	def initialize(expression, index)
		@conditional = expression
		@i = index
	end
=begin
	def eval
		if (@conditional.eval==1)

		end
	end
=end
	def string
		return "if"
	end

	def translate(out)
		out.write("SW#{@i}:\n")
		@conditional.translate(out)
		out.write("	ldc 1.0\n")
		out.write("	fcmpl\n")
		out.write("	dup\n")
		out.write("	ifeq Bcon#{@i}\n")
		out.write("	pop\n")
		out.write("	goto Econ#{@i}\n")
		out.write("Bcon#{@i}:\n")
		out.write("	ifeq itrue#{@i}\n")
		out.write("	ldc 0.0\n\tgoto iend#{@i}\n")
		out.write("itrue#{@i}:\n\tldc 1.0\n")
		out.write("iend#{@i}:\n")
		#out.write("	i2f\n")
	end
end

class ASTEndIf < ASTNode
	@i
	def initialize(index)
		@i = index
	end

	def string
		return "endif"
	end

	def translate(out)
		out.write("Econ#{@i}:\n")
	end
end

class ASTEndWhile < ASTNode
	@i
	def initialize(index)
		@i = index
	end

	def string
		return "endwhile"
	end

	def translate(out)
		out.write("goto SW#{@i}\n")
		out.write("Econ#{@i}:\n")
	end
end