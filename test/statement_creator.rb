require_relative "../src/ast.rb"

class StatementCreator
	def create_statements(n)
		if n > 1
			if rand(2) == 0
				return ASTSum.new(create_statements(n - 1), create_statements(n-1))
			else
				return ASTProduct.new(create_statements(n-1), create_statements(n-1))
			end
		else
   			if rand(2) == 0
   				return ASTSum.new(ASTNumber.new(rand(100)),ASTNumber.new(rand(100)))
   			else
  				return ASTProduct.new(ASTNumber.new(rand(100)),ASTNumber.new(rand(100)))
  			end
  		end
	end
end