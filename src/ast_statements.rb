require_relative "ast_node.rb"
require_relative "ast.rb"

class ASTStatements < ASTNode
	attr_accessor :statements

	def initialize
		@statements = Array.new
	end

	def eval
		value = nil

		@statements.each do |statement|
			value = statement.eval
		end

		return value
	end

	def print(out)
		@statements.each do |statement|
			statement.print
		end
	end

	def translate(out)
		#perform translate
		raise("No implementation of ASTStatements translate")
	end
end