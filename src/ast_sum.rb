require_relative "ast_node.rb"

class ASTSum < ASTNode
	@lhs
  	@rhs

  def initialize(lhs, rhs)
  	@lhs = lhs
  	@rhs = rhs
  end

  def eval
  	return @lhs.eval + @rhs.eval
  end

  def print(out)
  	out.puts "(#{@lhs} + #{@rhs})"
  end

  def translate(out)
  	#translate
  	raise("No implementation of ASTSum translate")
  end
end