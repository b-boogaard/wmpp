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
      virtual :parse(tokens) #dependent on ast      
      def CreateRecursiveDescentParser
      	  parser = RecrusiveDescentParse.new
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
	  throw ::Parser::Syntax(message, at)
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
      private :peek, :shift, :at, :syntax, :match, :end, :eol, :lparen, :rparen, :op, :number, :symbol, :literal, :expression, :statement, :statements
end