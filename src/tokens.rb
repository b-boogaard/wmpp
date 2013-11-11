# Initial Implementation based on C++ code from Dr. MacEvoy

require_relative "token"

class Tokens
	def initialize(sequence)
		@sequence = sequence;
		@ahead = Array.new
		@keywords = Hash.new(false)
		@keywords["if"] = true
		@keywords["while"] = true
		@keywords["endif"] = true
		@keywords["do"] = true
		@keywords["endwhile"] = true
	end

	def next
		p = @sequence.peek(0);
		#puts "#{p} and peek(1) #{@sequence.peek(1)}"
		value = "";
		value += p.to_s;
		t = Token.new(p, value, @sequence.at)

		@sequence.shift

		if (p.to_i != -1 and ((p >= "0" and "9" >= p) or (p=='.')))
			t.type = T_NUMBER
			have_dec = (p=='.')
			while true do 
				check = @sequence.peek(0)
				break if (check.to_i == -1 or (check == '.' and have_dec) or (check!= '.' and ((check < "0") or (check > "9"))))
				if check == '.'
					have_dec = true
				end
				t.value += @sequence.peek(0).to_s 
				@sequence.shift
			end
		elsif p == '='
			if @sequence.peek(0).to_s == '='
				@sequence.shift
				t.type = T_EQUAL
			else
				t.type = T_ASSIGN
			end
		elsif p == '<'
			if @sequence.peek(0).to_s == '='
				@sequence.shift
				t.type = T_LESSEQ
			else
				t.type = T_LESS
			end
		elsif p == '>'
			if @sequence.peek(0).to_s == '='
				@sequence.shift
				t.type = T_GREATEQ
			else
				t.type = T_GREAT
			end
		elsif p == '!'
			if @sequence.peek(0).to_s == '='
				@sequence.shift
				t.type = T_NOTEQ
			else
				t.type = T_ERROR
			end
		elsif p =~ /[a-z]/
			if @sequence.peek(0) =~ /[a-z]/
				while true do
					p += @sequence.peek(0)
					@sequence.shift
					break if not(@sequence.peek(0) =~ /[a-z]/)
				end
				if @keywords[p]
					t.type = T_KEYWORD
					t.value = p
				else
					t.type = T_SYMBOL
				end
			else
				t.type = T_SYMBOL
			end
		else
			case p
			when "("
				t.type = T_LPAREN
			when ")"
				t.type = T_RPAREN
			when "*"
				t.type = T_TIMES
			when "+"
				t.type = T_PLUS
			when "-"
				t.type = T_MINUS
			when "/"
				t.type = T_DIVIDE
			when "\n"
				t.type = T_EOL
				t.value = "";
			when "\r"
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