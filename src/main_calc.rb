require_relative "parser.rb"
require_relative "../src/stringsequence.rb"

g = RecursiveDescentParser.new

ARGV.each do |file|
	s = File.read(file)
	t = Tokens.new(StringSequence.new(s))
	e = g.parse(t)
	e.statements.reverse!
	print "= #{e.eval}\n"
end

puts "Enter some math: "
input = gets.chomp
while (input != "-1") do
	t = Tokens.new(StringSequence.new(input))
	e = g.parse(t)
	e.statements.reverse!
	print "= #{e.eval}\n"
	puts "Enter some math: "
	input = gets.chomp
end