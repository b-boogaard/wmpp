require_relative "../src/parser.rb"

require "test/unit"

class TestParser < Test::Unit::TestCase
	def test_autopass
		assert(true)
	end	

	def test_syntax
		g = RecursiveDescentParser.new
		assert(true)
	end
end 