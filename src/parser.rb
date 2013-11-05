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

      def initialize
            @symbols = ASTSymbols.new
      end

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

      def op
            t = peek
            if t.type == T_PLUS or t.type == T_TIMES or t.type == T_DIVIDE or t.type == T_MINUS or t.type == T_EQUAL or t.type == T_LESS or t.type == T_LESSEQ or t.type == T_GREAT or t.type == T_GREATEQ or t.type == T_NOTEQ or t.type == T_ASSIGN
                  type = t.type
                  shift
                  return type
            else
                  syntax
                  return false
            end
      end

      def number
            t = match(T_NUMBER)
            if t
                  return ASTNumber.new(t.value)
            else
                  return false
            end
      end

      def expression
           if peek.type == T_SYMBOL
                  lhs = ASTSymbol.new(peek.value)
                  shift
                  if peek.type == T_ASSIGN
                        shift
                        rhs = expression
                        return @symbols.insert(lhs, rhs)
                  else
                        syntax
                  end
           elsif peek.type == T_LPAREN
                  shift
                  if peek.type == T_SYMBOL
                        lhs = @symbols.lookup(peek.value)
                        shift
                  else
                        lhs = expression
                  end
                  optype = op
                  rhs = expression
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
                  elsif optype == T_NOTEQ
                        return ASTNotEqual.new(lhs,rhs)                             
                  else 
                        assert(false, "OP not + or *")
                  end
                  return true
            else return number
            end
      return false
      end


      def statement
            e = expression
            if (eol or endy)
                  return e
            else
                  syntax
            end
      end

      def statements
            if endy
                  return ASTStatements.new
            end
            s = statement
            if not s; syntax end
            e = statements
            e.statements << s
            return e
      end

      def parse(tokens)
        @tokens = tokens
        e = statements
        e.statements.reverse!
        return e
      end
      private :peek, :shift, :at, :match, :endy, :eol, :lparen, :rparen, :op, :number, :expression, :statement, :statements#, :symbol#, :literal
end
