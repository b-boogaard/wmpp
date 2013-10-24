# Initial Implementation based on C++ code from Dr. MacEvoy

require 'token'

class Tokens
	def initialize(sequence_)
		@sequence = sequence_;
		@ahead = Array.new
	end

	def next
		p = @sequence.peek;
		value = "";
		value += p;
		t = Token.new(p, value, @sequence.at)

		@sequence.shift

		if p.to_i >= 0 && 9 <= p.to_i
			t.type = Token::T_NUMBER

			while true do 
				check = @sequence.peek
				break if (check.to_i < 0) || (check.to_i > 9)
				t.value += @sequence.peek
				@sequence.shift
			end
		elsif p == ('a'...'z')
			t.type = Token::T_SYMBOL
		else
			case p
			when '('
				t.type = Token::T_LPAREN
			when ')'
				t.type = Token::T_RPAREN
			when '*'
				t.type = Token::T_TIMES
			when '+'
				t.type = Token::T_PLUS
			when '-'
				t.type = Token::T_MINUS
			when '\\'
				t.type = Token::T_DIVIDE
			when '\n'
				t.type = Token::T_EOF
				t.value = "";
			when '\r'
				@sequence.shift if @sequence.peek == '\n'
				t.type = Token::T_EOL
				t.value = ""
			when -1
				t.type = Token::T_END
				t.value = ""
			else
				t.type = Token::T_ERROR
			end
		end
		ahead.insert(0, t) 
	end

	def peek(delta) 
		while ahead.size <= delta do
			next
		end
	end

	def shift(delta)
		while ahead.size < delta do
			next
		end
		while delta > 0 do
			ahead.delete_at(0)
			delta -= 1
		end
	end
end