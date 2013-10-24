require_relative "ast_node.rb"

class ASTDivide < ASTNode
	@lhs
  @rhs

  def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
          @lhs = lhs
          @rhs = rhs
        else
          raise("Type mismatch excpected ASTNode in ASTDivide initialization")
        end
  end

  def eval
  	return @lhs.eval / @rhs.eval
  end

  def print(out)
  	out.puts "(#{@lhs} / #{@rhs})"
  end

  def translate(out)
  	#translate
  	raise("No implementation of ASTDivide translate")
  end
end