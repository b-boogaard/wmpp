require_relative "ast_node.rb"

class ASTSum < ASTNode
  def initialize(lhs, rhs)
  	if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTSum initialization"
    end
  end

  def eval
  	 if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval + @rhs.eval
    else
      raise RuntimeError, "Trying to perfrom + with a nil object"
    end
  end

  def print(out)
  	if (@lhs.eval != nil)
      lhs = @lhs.eval
    else
      lhs = "nil" 
    end

    if (@rhs.eval != nil)
      rhs = @rhs.eval
    else
      rhs = "nil"
    end
    out.write "(#{lhs} * #{rhs})\n"
    #out.write "\n"
  end

  def translate(out)
  	#translate
  	  @lhs.translate(out)
      @rhs.translate(out)
      out.write("fadd\n")
  end
end