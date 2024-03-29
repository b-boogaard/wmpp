	T_END = -1
	T_EOL = "\n"
	T_LPAREN = "("
	T_RPAREN = ")"
	T_TIMES = "*"
	T_PLUS = "+"
	T_DIVIDE = "\\"
	T_MINUS = "-"
	T_NUMBER = "\#"
	T_EQUAL = "=="
	T_ASSIGN = "="
	T_LESS = "<"
	T_GREAT = ">"
	T_LESSEQ = "<="
	T_GREATEQ = ">="
	T_NOTEQ = "!="
	T_ERROR = "?"
	T_SYMBOL = "symbol"
	T_KEYWORD = "keyword"
	T_SUPRESS = ";"

class Token
	attr_accessor :type
	attr_accessor :value
	attr_reader :at

	def initialize(type, value, at)
		@type = type
		@value = value
		@at = at
	end

	def ==(other)
		return self.type == other.type && self.value == other.value && self.at == other.at
	end

	def print(out)
		if (@type == T_END) 
			out.puts("eof");
		elsif (@type == T_NUMBER)
			out.puts("\##{@value}") 
		else 
			out.puts(@type);
		end
	end

	#Pretty sure this is wrong
	# Not sure we even need <<
	def <<(token)
		token.print(self);
		return self
	end
end