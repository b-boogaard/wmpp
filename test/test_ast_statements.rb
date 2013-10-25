require_relative "../src/ast_statements.rb"
require_relative "statement_creator.rb"
require "test/unit"

class TestASTStatements < Test::Unit::TestCase
	def test_eval_print
		s = ASTStatements.new
		sc = StatementCreator.new
		e = Array.new

		num = 1 #+ rand(10)

		num.times do |n|
			temp = sc.create_statements(n)
			s.statements.push(temp)
			e.push(temp)
			ios = IO.new STDOUT.fileno
			temp.print(ios)
			puts ""
		end
		count = 0
		s.statements.each do |statement|
			assert_equal(e[count].eval, statement.eval, "#{statement} != statement.eval")# if statement != nil
			count += 1
		end

	end


end