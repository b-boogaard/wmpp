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

         def string
            "error at #{@at}: #{@error}"
         end
      end

public
      virtual :parse #dependent on ast      
end

class RecursiveDescentParser < Parser
      @tokens #tokens
      @controlstack
      @controlcount
      attr_reader :exps

      def initialize
            @symbols = ASTSymbols.new
            @var_index = 500
            @exps = Hash.new
            @controlstack = Array.new
            @controlcount = -1
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
	     abort(Parser::Syntax.new(message, at_).string)
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

      def supress
            match(T_SUPRESS)
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
            if t.type == T_PLUS or t.type == T_TIMES or t.type == T_DIVIDE or t.type == T_MINUS or t.type == T_EQUAL or t.type == T_LESS or t.type == T_LESSEQ or t.type == T_GREAT or t.type == T_GREATEQ or t.type == T_NOTEQ
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
                  if not @symbols.lookup(peek.value).nil?
                        lhs = @symbols.lookup(peek.value)
                        shift
                  else
                        lhs = ASTSymbol.new(@var_index, peek.value)
                        @symbols.insert(peek.value, lhs)
                        @var_index += 1
                        shift
                  end
                  if peek.type == T_ASSIGN
                        symbol = lhs
                        shift
                        rhs = expression
                        return ASTAssign.new(symbol, rhs)
                  else
                        return lhs
                  end
            elsif peek.type == T_KEYWORD
                  if peek.value == "if"
                        shift
                        cond = expression
                        if !cond
                              syntax
                        end
                        @controlcount+=1
                        @controlstack.push(@controlcount)
                        return ASTIf.new(cond,@controlcount)
                  elsif peek.value == "while"
                        shift
                        cond = expression
                        if !cond
                              syntax
                        end
                        @controlcount+=1
                        @controlstack.push(@controlcount)
                        return ASTWhile.new(cond,@controlcount)
                  elsif peek.value == "endif"
                        shift
                        return ASTEndIf.new(@controlstack.pop)
                  elsif peek.value == "endwhile"
                        shift
                        return ASTEndWhile.new(@controlstack.pop)
                  end
            elsif peek.type == T_LPAREN
                  shift
                #  if peek.type == T_SYMBOL
                 #       lhs = @symbols.lookup(peek.value)
                 #       shift
                 # else
                  lhs = expression
                  if @exps.has_key? (lhs.string+@controlstack[-1].to_s)
                              #puts "common sub found #{@exps[lhs.string].string}: #{@exps[lhs.string].eval}"
                        lhs = @exps[lhs.string+@controlstack[-1].to_s]
                  elsif not (lhs.is_a? ASTNumber or lhs.is_a? ASTIf or lhs.is_a? ASTEndWhile or lhs.is_a? ASTWhile or lhs.is_a? ASTEndIf or lhs.is_a? ASTSymbol or lhs.is_a? ASTAssign)#not (lhs.string < "9" and lhs.string > "0")
                              #puts "#{lhs.string}"
                        lhs.set_index($temp)
                        @exps[lhs.string+@controlstack[-1].to_s] = ASTVar.new(lhs,$temp)
                        $temp += 1
                             # lhs = @exps[lhs.string]
                  end
                  
                  optype = op
                  if peek.type == T_SYMBOL
                        rhs = @symbols.lookup(peek.value)
                        shift
                  else
                        rhs = expression
                        if @exps.has_key? rhs.string+@controlstack[-1].to_s
                              #puts "common sub found #{@exps[rhs.string].string}: #{@exps[rhs.string].eval}"
                              rhs = @exps[rhs.string+@controlstack[-1].to_s]
                        elsif not(rhs.is_a? ASTNumber  or rhs.is_a? ASTIf or rhs.is_a? ASTEndWhile or rhs.is_a? ASTWhile or rhs.is_a? ASTEndIf or rhs.is_a? ASTSymbol or rhs.is_a? ASTAssign)#not (rhs.string > "0" and rhs.string < "9")
                              #puts "#{rhs.string}"
                              rhs.set_index($temp)
                              @exps[rhs.string+@controlstack[-1].to_s] = ASTVar.new(rhs,$temp)
                              $temp += 1
                            #  rhs = @exps[rhs.string]
                        end
                  end
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
      puts "FALSE"
      return false
      end


      def statement
            e = expression
            if e
            if @exps.has_key? e.string+@controlstack[-1].to_s
                  #puts "common sub found #{@exps[rhs.string].string}: #{@exps[rhs.string].eval}"
                  e = @exps[e.string+@controlstack[-1].to_s]
            elsif not(e.is_a? ASTNumber or e.is_a? ASTIf or e.is_a? ASTEndWhile or e.is_a? ASTWhile or e.is_a? ASTEndIf or e.is_a? ASTSymbol or e.is_a? ASTAssign or e.is_a? ASTAssign)#not (rhs.string > "0" and rhs.string < "9")
                              #puts "#{rhs.string}"
                  e.set_index($temp)
                  @exps[e.string+@controlstack[-1].to_s] = ASTVar.new(e,$temp)
                  $temp += 1
                            #  rhs = @exps[rhs.string]
            end
            else
                  syntax
            end
            #puts e.string
            if supress
                  e.supress = true
            else
                  e.supress = false
            end
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
