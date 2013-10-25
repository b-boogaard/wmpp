 require_relative "ast_node.rb"

class ASTProduct < ASTNode
	@lhs
  @rhs

  def initialize(lhs, rhs)
    #if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
          @lhs = lhs
          @rhs = rhs
     #   else
      #    raise("Type mismatch excpected ASTNode in ASTProduct initialization")
       # end
  end

  def eval
  	return @lhs.eval * @rhs.eval
  end

  def print(out)
  	out.write "(#{@lhs.print(out)} * #{@rhs.print(out)})"
    #out.write "\n"
  end

  def translate(out)
  	#translate
  	raise("No implementation of ASTProduct translate")
  end
end