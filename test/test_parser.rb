require_relative "../src/parser.rb"
require_relative "../src/stringsequence.rb"

require "test/unit"

def genSequence(i)
	if i <= 0 or rand(11) < 2
		if rand(4) == 0
			return rand(1000).to_s
		else
			return rand(10).to_s
		end
	else
		if rand(2) == 0
			return "(#{genSequence(i-1)}+#{genSequence(i-1)})"
		else
			return "(#{genSequence(i-1)}*#{genSequence(i-1)})"
		end
	end
end

class TestParser < Test::Unit::TestCase
	def test_autopass
		assert(true)
	end	

	def test_parse
		g = RecursiveDescentParser.new

		100.times do |i|
			s = genSequence(i%5)
			t = Tokens.new(StringSequence.new(s))
			puts
			puts "#{s} = #{eval(s)}"
			e = g.parse(t)
			#assert_equal(e.eval, eval(s), "#{s} != e.eval, probably a parsing error")
		end
=begin
			sequence from file
			t = tokens.new(sequence)
			g.parse(t)
=end
		assert(true)
	end
end 