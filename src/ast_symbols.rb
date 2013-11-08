require_relative 'ast_node.rb'

class ASTSymbols < ASTNode
	def initialize
		@symbols = Hash.new(nil)
	end

	def insert(key, value)
		@symbols[key] = value
	end
	
	def eval
		@symbols.each do |key, value|
			value.eval
		end
	end

	def lookup(key)
		return @symbols[key]
	end

	def print(out)
		@symbols.each do |key, value|
			puts "key:#{key}, value:#{value.print}"
		end
	end

	def translate(out)
		raise "No Implementation"
	end

end