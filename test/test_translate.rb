require_relative "../src/parser.rb"
require_relative "../src/stringsequence.rb"
require_relative "../src/jasm_translate.rb"


require "test/unit"
class TestParser < Test::Unit::TestCase
	def test_translate_all
		Dir.foreach("#{Dir.pwd}/test/wmpp") do |item|
			next if item == '.' or item == '..'
			path = "#{Dir.pwd}/test/wmpp/#{item}"
			s = File.read(path)
			syspath = "ruby" + " #{Dir.pwd}/src/main_compile.rb test/wmpp/#{item}"
			puts syspath
			system(syspath)
			j = path.split("/")
			j = j[j.length - 1]
			j = j.split(".")
			j = j[0]
			j += ".j"
			dir = Dir.getwd
			sys = "java -jar jasmin.jar -d " + "#{dir}/bin " + "#{dir}/j/#{j}"
			puts sys
			system(sys)
		end 
	end
end