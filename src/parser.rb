#Parser
#There are doubtlessly broken things in here

require_relative "tokens.rb"
require_relative "virtual.rb"
require_relative "ast.rb"

class Parser
      class Syntax
        def initialize(error, at)
          @error = error
	    @at = at
	   end    
	    
	   def print(out)
	     out.puts("error at #{@at}: #{@error}")
	   end
      end

public
      virtual :parse #dependent on ast      
end

class RecursiveDescentParser < Parser
      @tokens #tokens
      def peek(delta = 0)
      	  return @tokens.peek(delta)
      end

      def shift(delta = 1)
      	  return @tokens.shift(delta)
      end

      def at
      	  return peek.at
      end

      def syntax
            at_ = at
	      peek_ = peek
      	message = "syntax error at offset #{at_} near #{peek_.value}"
	  #throw Parser.Syntax(message, at)
      end

      def match(type)
            if peek.type == type
                  ans = Token.new(type,peek.value,at)
                  shift
                  return ans # return true #broken maybe; doesn't follow shared pointer idea
            else
                  return false #Token.new  #probably broken
            end
      end

      def endy
            match(T_END)
      end

      def eol
            match(T_EOL)
      end

      def lparen
            match(T_LPAREN)
      end

      def rparen
            match(T_RPAREN)
      end

      def op(type) 
            t = peek #Token
            if t.type == T_PLUS or t.type == T_TIMES
                  type = t.type
                  shift
                  return true
            else
                  return false
            end
      end

      def op_test
            t = peek
            if t.type == T_PLUS or t.type == T_TIMES or t.type == T_DIVIDE or t.type == T_MINUS or t.type == T_EQUAL or t.type == T_LESS or t.type == T_LESSEQ or t.type == T_GREAT or t.type == T_GREATEQ
                  type = t.type
                  shift
                  return type
            else
                  syntax
                  return false
            end
      end

      def number(node) #ASTNode
            t = match(T_NUMBER)
            if t
                  node = ASTNumber.new(t.value)
            else
                  return false
            end
      end

      def number_test
            t = match(T_NUMBER)
            if t
                  return ASTNumber.new(t.value)
            else
                  return false
            end
      end
=begin
      def symbol(x) #ASTNode
            t = match(T_SYMBOL)
      end

      def literal

      end
=end
      def expression(e)
           if peek.type == T_LPAREN
                  lhs = ASTNode.new
                  optype = T_PLUS
                  rhs = ASTNode.new
                  if lparen and expression(lhs) and op(optype) and expression(rhs) and rparen
                        if optype == T_PLUS
                              e = ASTSum.new(lhs,rhs)
                        elsif optyp == T_TIMES
                              e = ASTProduct.new(lhs,rhs)
                        else 
                              assert(false, "OP not + or *")
                        end
                        return true
                  else
                        syntax
                  end
            else return number(e)
            end
      return false
      end

      def expression_test
           if peek.type == T_LPAREN
                  shift
                  lhs = expression_test
                  optype = op_test
                  rhs = expression_test
                  shift
                  if optype == T_PLUS
                        return ASTSum.new(lhs,rhs)
                  elsif optype == T_TIMES
                        return ASTProduct.new(lhs,rhs)
                  elsif optype == T_DIVIDE
                        return ASTDivide.new(lhs,rhs) 
                  elsif optype == T_MINUS
                        return ASTMinus.new(lhs,rhs) 
                  elsif optype == T_EQUAL
                        return ASTEqual.new(lhs,rhs)  
                  elsif optype == T_LESS
                        return ASTLess.new(lhs,rhs)  
                  elsif optype == T_LESSEQ
                        return ASTLessEqual.new(lhs,rhs)  
                  elsif optype == T_GREAT
                        return ASTGreater.new(lhs,rhs) 
                  elsif optype == T_GREATEQ
                        return ASTGreaterEqual.new(lhs,rhs)                                      
                  else 
                        assert(false, "OP not + or *")
                  end
                  return true
            else return number_test
            end
      return false
      end


      def statement(e)
            return (expression(e) and (eol or endy))
      end

      def statement_test
            e = expression_test
            if (eol or endy)
                  return e
            else
                  syntax
            end
      end

      def statements(e)
            if endy
                  e = ASTStatements.new
                 return true
            end
            s = nil
            if (statement(s) and statements(e))
                  e.statements << s#probably broken
                  return true
            end
            syntax
            return false
      end

      def statements_test
            if endy
                  return ASTStatements.new
            end
            s = statement_test
            if not s; syntax end
            e = statements_test
            e.statements << s
            return e
      end
=begin
      def parse(tokens)
        @tokens = tokens
	  e = ASTStatements.new
	  if statements(e)
	     return e
	  else 
	       syntax
	  end
      end
=end
      def parse(tokens)
        @tokens = tokens
        e = statements_test
        e.statements.reverse!
        return e
      end
      private :peek, :shift, :at, :match, :endy, :eol, :lparen, :rparen, :op, :number, :expression, :statement, :statements #:symbol, :literal
end
