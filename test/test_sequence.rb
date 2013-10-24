require_relative "../src/sequence.rb"
require_relative "../src/stringsequence.rb"
require "test/unit"

class TestSequence < Test::Unit::TestCase
	def test_autopass
		assert(true)
	end

	def test_string_sequence
		s = StringSequence.new("This is a test of the string sequence")
		i = 0
		temp = s.s
		temp.each_char do |c|
			assert(s.peek(i) == c)
			i += 1
		end

		s.shift(3)
		assert(s.at == 3)
		i = 0
		temp = temp[3..-1]
		temp.each_char do |c|
			assert(s.peek(i) == c, "#{s.peek(i)} != #{c} or #{s.offset} + #{i} > #{s.s.length}")
			i += 1
		end
	end
end