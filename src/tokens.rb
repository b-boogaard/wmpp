# Initial Implementation based on C++ code from Dr. MacEvoy

require_relative "token"

class Tokens
	def initialize(sequence)
		@sequence = sequence;
		@ahead = Array.new
	end

	def next
		p = @sequence.peek(0);
		value = "";
		value += p.to_s;
		t = Token.new(p, value, @sequence.at)

		@sequence.shift

		if (p.to_i != -1 and p >= "0" and "9" >= p)
			t.type = T_NUMBER

			while true do 
				check = @sequence.peek(0)
				break if (check.to_i == -1 or (check < "0") or (check > "9"))
				t.value += @sequence.peek(0) 
				@sequence.shift
			end
		elsif p == ('a'...'z')
			t.type = T_SYMBOL
		else
			case p
			when '('
				t.type = T_LPAREN
			when ')'
				t.type = T_RPAREN
			when '*'
				t.type = T_TIMES
			when '+'
				t.type = T_PLUS
			when '-'
				t.type = T_MINUS
			when '\\'
				t.type = T_DIVIDE
			when '\n'
				t.type = T_EOF
				t.value = "";
			when '\r'
				@sequence.shift if @sequence.peek(0) == '\n'
				t.type = T_EOL
				t.value = ""
			when -1
				t.type = T_END
				t.value = ""
			else
				t.type = T_ERROR
			end
		end
		@ahead.push(t) 
	end

	def peek(delta) 
		while @ahead.size <= delta do
			self.next
		end

		counter = 0
		until delta == 0 do
			counter += 1
			delta -= 1
		end
		
		return @ahead[counter]
	end

	def shift(delta)
		while @ahead.size < delta do
			self.next
		end
		while delta > 0 do
			@ahead.delete_at(0)
			delta -= 1
		end
	end
end