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

	def string
		ret = ""
		@statements.each do |statement|
			ret += statement.string
			ret += "\n"
		end
		return ret
	end

	def translate(out)
		#perform translate
		
		@statements.each do |s|
    		if s.supress==false
    			out.write("   ; push java.lang.System.out (type PrintStream)\n")
 				out.write("   getstatic java/lang/System/out Ljava/io/PrintStream;\n")
  				out.write("   \n")
  			else
  				out.write("\n")
  			end

    		s.translate(out)
		  
    		$modf+=1
    		if(s.supress==true)
    			if not (s.is_a? ASTEndIf or s.is_a? ASTEndWhile)
    				out.write("pop\n")
    			else
    				out.write("\n")
    			end
    		else
    			if not (s.is_a? ASTEndIf or s.is_a? ASTEndWhile)
	    			out.write("   \n")
    				out.write("   ; invoke println\n")
    				out.write("   invokevirtual java/io/PrintStream/println(F)V\n")
    				out.write("   \n")
    			else
    				out.write("	ldc -1.56")
    				out.write("   \n")
    				out.write("   ; invoke println\n")
    				out.write("   invokevirtual java/io/PrintStream/println(F)V\n")
    				out.write("   \n")
    			end
    		end	

    	end
    	
	end
end