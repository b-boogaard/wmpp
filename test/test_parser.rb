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
		r = rand(4)
		if r == 0
			return "(#{genSequence(i-1)}+#{genSequence(i-1)})"
		elsif r == 1
			return "(#{genSequence(i-1)}*#{genSequence(i-1)})"
	    elsif r == 2
	        return "(#{genSequence(i-1)}-#{genSequence(i-1)})"
	    else
		    return "(#{genSequence(i-1)}/1)" #DON'T DIVIDE BY ZERO
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
			s = ""
			last = ""
			rand(10).times do
			 	temp = genSequence(i%5) + "\n"
			 	s += temp
			 	last = temp
			end
			t = Tokens.new(StringSequence.new(s))
			#e = g.parse(t)
			e = g.parse_test(t)
			e.statements.reverse!
		
			assert_equal(e.eval, eval(last), "#{e.eval} != #{last.to_s}, probably a parsing error")
		end
=begin
			sequence from file
			t = tokens.new(sequence)
			g.parse(t)
=end
		assert(true)
	end
end 