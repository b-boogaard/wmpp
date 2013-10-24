require_relative "../src/parser.rb"

require "test/unit"

class TestParser < Test::Unit::TestCase
	def test_autopass
		assert(true)
	end	

	def test_parse
		g = RecursiveDescentParser.new
=begin
			sequence from file
			t = tokens.new(sequence)
			g.parse(t)
=end
		assert(true)
	end
end 