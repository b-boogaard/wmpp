class ASTLess < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTLess initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval < @rhs.eval ? 1 : 0
    else
      raise RuntimeError, "Trying to perfrom < with a nil object"
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
    out.write "(#{lhs} < #{rhs})\n"
  end


  def translate(out)
    #translate
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n") #broken
      out.write("ifeq\n")
  end

end

class ASTLessEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTLessEqual initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval <= @rhs.eval ? 1 : 0
    else
      raise RuntimeError, "Trying to perfrom <= with a nil object"
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
    out.write "(#{lhs} <= #{rhs})\n"
  end


  def translate(out)
    #translate
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n") #broken
      out.write("#{-1.to_f}\n")
      out.write("fcmpl\n")
  end

end

class ASTEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTEqual initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval == @rhs.eval ? 1 : 0
    else
      raise RuntimeError, "Trying to perfrom == with a nil object"
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
    out.write "(#{lhs} == #{rhs})\n"
  end


  def translate(out)
    #translate
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n") #brokenz
  end

end

class ASTGreater < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTGreater initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval > @rhs.eval ? 1 : 0
    else
      raise RuntimeError, "Trying to perfrom > with a nil object"
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
    out.write "(#{lhs} > #{rhs})\n"
  end


  def translate(out)
    #translate
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n") #broken
  end

end

class ASTGreaterEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTGreaterEqual initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval > @rhs.eval ? 1 : 0
    else
      raise RuntimeError, "Trying to perfrom > with a nil object"
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
    out.write "(#{lhs} > #{rhs})\n"
  end


  def translate(out)
    #translate
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n") #broken
  end

end

class ASTNotEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTNotEqual initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval != @rhs.eval ? 1 : 0
    else
      raise RuntimeError, "Trying to perfrom <> with a nil object"
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
    out.write "(#{lhs} <> #{rhs})\n"
  end


  def translate(out)
    #translate
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n") #broken
  end

end