require_relative "parser.rb"
require_relative "../src/stringsequence.rb"

g = RecursiveDescentParser.new
puts "Enter some math: "
input = gets.chomp
while (input != "-1") do
	t = Tokens.new(StringSequence.new(input))
	e = g.parse_test(t)
	e.statements.reverse!
	print "= #{e.eval}\n"
	puts "Enter some math: "
	input = gets.chomp
end