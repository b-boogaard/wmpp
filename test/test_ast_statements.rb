require_relative "../src/ast_statements.rb"
require_relative "statement_creator.rb"
require "test/unit"

class TestASTStatements < Test::Unit::TestCase
	def test_eval
		s = ASTStatements.new
		sc = StatementCreator.new
		e = Array.new

		num = 1 + rand(100)

		num.times do |n|
			temp = sc.create_statements(1)
			s.statements.push(temp)
			e.push(temp)
		end
		count = 0
		s.statements.each do |statement|
			assert_equal(e[count].eval, statement.eval, "#{statement} != statement.eval")
			count += 1
		end

	end


end