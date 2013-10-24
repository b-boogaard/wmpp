class Token
	@@T_END = -1
	@@T_EOL = "\n"
	@@T_LPAREN = "("
	@@T_RPAREN = ")"
	@@T_TIMES = "*"
	@@T_PLUS = "+"
	@@T_DIVIDE = "\\"
	@@T_MINUS = "-"
	@@T_NUMBER = "\#"
	@@T_ERROR = "?"

	def initialize(type_, value_, at_)
		@type = type_;
		@value = value_;
		@at = at_;
	end

	def ==(other)
		return self.type == other.type && self.value == other.value && self.at == other.at;
	end

	def print(out)
		if (@type == T_END) 
			out.write("eof");
		elsif (@type == T_NUMBER)
			out.write("\##{@value}") 
		else 
			out.write(@type);
		end
	end

	#Pretty sure this is wrong
	def <<(out, token)
		token.print(out);
		return out
	end
end