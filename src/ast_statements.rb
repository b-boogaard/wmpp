require_relative "ast_node.rb"
require_relative "ast.rb"

class ASTStatements < ASTNode
	attr_accessor :statements

	def initialize
		@statements = Array.new
	end

	def eval
		value = nil

		@statements.each do |statement|
			value = statement.eval
		end

		return value
	end

	def print(out)
		@statements.each do |statement|
			statement.print
		end
	end

	def translate(out)
		#perform translate
		@statements.each do |s|
		    out.write("   ; push java.lang.System.out (type PrintStream)\n")
    		out.write("   getstatic java/lang/System/out Ljava/io/PrintStream;\n")
    		out.write("   \n")
    		s.translate(out)
		    out.write("   \n")
    		out.write("   ; invoke println\n")
    		out.write("   invokevirtual java/io/PrintStream/println(F)V\n")
    		out.write("   \n")
    		$modf+=1
    	end
	end
end