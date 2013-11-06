class ASTLess < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
      @index = 0
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTLess initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return (@lhs.eval < @rhs.eval ? 1 : 0)
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
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpl\n")
      out.write("i2f\n")
      out.write("ldc -1.0\n")
      out.write("fsub\n")
      out.write("ldc 0.0\n")
      out.write("fcmpl\n")
      out.write("ifeq Tru#{$modf}\n")
      out.write("goto Fal#{$modf}\n")
      out.write("Tru#{$modf}:\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Fal#{$modf}:\n")
      out.write("ldc 0.0\n")    
      out.write("Endy#{$modf}:\n") 
      $modf+=1
      out.write("fstore #{@index}\n")
      out.write("fload #{@index}\n")
  end

end

class ASTLessEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
      @index = 0
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
      out.write("dup2\n")
    #eq
      out.write("fsub\n")    
      out.write("ldc 0.0\n")
      out.write("fcmpl\n") 
      out.write("ifeq Trueq#{$modf}\n")
      out.write("goto Endyeq#{$modf}\n")
      out.write("Trueq#{$modf}:\n")
      out.write("pop\n")
      out.write("pop\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Endyeq#{$modf}:\n") 
      #end eq
      
      out.write("fcmpl\n")
      out.write("i2f\n")
      out.write("ldc -1.0\n")
      out.write("fsub\n")
      out.write("ldc 0.0\n")
      out.write("fcmpl\n")
      out.write("ifeq Tru#{$modf}\n")
      out.write("goto Fal#{$modf}\n")
      out.write("Tru#{$modf}:\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Fal#{$modf}:\n")
      out.write("ldc 0.0\n")    
      out.write("Endy#{$modf}:\n") 
      $modf+=1
      out.write("fstore #{@index}\n")
      out.write("fload #{@index}\n")
  end

end

class ASTEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
      @index = 0
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTEqual initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return (@lhs.eval == @rhs.eval ? 1 : 0)
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
      out.write("fsub\n")
      out.write("ldc 0.0\n")
      out.write("fcmpl\n")
     # out.write("f2i\n")
      out.write("ifeq Tru#{$modf}\n")
      out.write("goto Fal#{$modf}\n")
      out.write("Tru#{$modf}:\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Fal#{$modf}:\n")
      out.write("ldc 0.0\n")    
      out.write("Endy#{$modf}:\n") 
      $modf+=1
      out.write("fstore #{@index}\n")
      out.write("fload #{@index}\n")
  end

end

class ASTGreater < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
      @index = 0
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTGreater initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return (@lhs.eval > @rhs.eval ? 1 : 0)
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
      @lhs.translate(out)
      @rhs.translate(out)
      out.write("fcmpg\n")
      out.write("i2f\n")
      out.write("ldc 1.0\n")
      out.write("fsub\n")
      out.write("ldc 0.0\n")
      out.write("fcmpl\n")
      out.write("ifeq Tru#{$modf}\n")
      out.write("goto Fal#{$modf}\n")
      out.write("Tru#{$modf}:\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Fal#{$modf}:\n")
      out.write("ldc 0.0\n")    
      out.write("Endy#{$modf}:\n") 
      $modf+=1
      out.write("fstore #{@index}\n")
      out.write("fload #{@index}\n")
  end

end

class ASTGreaterEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
      @index = 0
    else
      raise SyntaxError, "Type mismatch excpected ASTNode in ASTGreaterEqual initialization"
    end
  end

def eval
    if ((@lhs.eval != nil) and (@rhs.eval != nil))
      return @lhs.eval >= @rhs.eval ? 1 : 0
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
      out.write("dup2\n")
    #eq
      out.write("fsub\n")    
      out.write("ldc 0.0\n")
      out.write("fcmpl\n") 
      out.write("ifeq Trueq#{$modf}\n")
      out.write("goto Endyeq#{$modf}\n")
      out.write("Trueq#{$modf}:\n")
      out.write("pop\n")
      out.write("pop\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Endyeq#{$modf}:\n") 
      #end eq
      
      out.write("fcmpg\n")
      out.write("i2f\n")
      out.write("ldc 1.0\n")
      out.write("fsub\n")
      out.write("ldc 0.0\n")
      out.write("fcmpl\n")
      out.write("ifeq Tru#{$modf}\n")
      out.write("goto Fal#{$modf}\n")
      out.write("Tru#{$modf}:\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Fal#{$modf}:\n")
      out.write("ldc 0.0\n")    
      out.write("Endy#{$modf}:\n") 
      $modf+=1
      out.write("fstore #{@index}\n")
      out.write("fload #{@index}\n")
  end

end

class ASTNotEqual < ASTNode
	def initialize(lhs, rhs)
    if ((lhs.is_a? ASTNode) and (rhs.is_a? ASTNode)) 
      @lhs = lhs
      @rhs = rhs
      @index = 0
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
      out.write("fsub\n")
      out.write("ldc 0.0\n")
      out.write("fcmpl\n")
     # out.write("f2i\n")
      out.write("ifeq Fal#{$modf}\n")
      out.write("goto Tru#{$modf}\n")
      out.write("Tru#{$modf}:\n")
      out.write("ldc 1.0\n")  
      out.write("goto Endy#{$modf}\n")  
      out.write("Fal#{$modf}:\n")
      out.write("ldc 0.0\n")    
      out.write("Endy#{$modf}:\n") 
      $modf+=1
      out.write("fstore #{@index}\n")
      out.write("fload #{@index}\n")
  end

end