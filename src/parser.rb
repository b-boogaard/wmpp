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

      virtual :parse #dependent on ast      
      def CreateRecursiveDescentParser
      	parser = RecrusiveDescentParser.new
            return parser
      end
end

class RecursiveDescentParser < Parser
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
      	message = "syntax error at offset #{at_} near #{peek_}"
	  throw Parser::Syntax(message, at)
      end

      def match(type)
            if peek.type == type
                  ans = Token.new(peek)
                  shift
                  return ans # return true #broken maybe; doesn't follow shared pointer idea
            else
                  return Token.new  #probably broken
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

      def number(node) #ASTNode
            t = match(T_NUMBER)
            if t
                  node = ASTNode.new(t.value)
            else
                  node = ASTNode.new
            end
            return node
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
                  optype
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
#            else return literal
            end
      return false
      end

      def statement(e)
            return (expression(e) and eol)
      end

      def statements(e)
            if endy
                  e = ASTStatements.new
                  return true
            end
            s = ASTNode.new
            if statement(s) and statements(e)
                  e.statements << s #probably broken
                  return true
            end
            syntax
            return false
      end

      def parse(tokens)
      	  @tokens = tokens
	  #@e
	  if statements(@e)
	     return e
	  else 
	       syntax
	  end
      end
      private :peek, :shift, :at, :syntax, :match, :endy, :eol, :lparen, :rparen, :op, :number, :expression, :statement, :statements #:symbol, :literal
end