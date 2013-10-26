require_relative "../src/parser.rb"
require_relative "../src/stringsequence.rb"
require_relative "../src/jasm_translate.rb"


require "test/unit"

class Float
	 def sigfig_to_s(digits)
		f = sprintf("%.#{digits - 1}e", self).to_f
		i = f.to_i
		(i == f ? i : f).to_s
	  end
end

class TestParser < Test::Unit::TestCase
	def test_translate_all
		Dir.foreach("#{Dir.pwd}/test/wmpp") do |item|
			next if item == '.' or item == '..' or item == '.DS_Store'
			path = "#{Dir.pwd}/test/wmpp/#{item}"
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

			sys_jav = "java -classpath " + "#{dir}/bin #{j[0..-3]}" + " > #{dir}/tmp/results.txt"
			system(sys_jav)
			j = File.read("#{dir}/tmp/results.txt")

			array = Array.new

			j.each_line do |line|
				array << line
			end
 
			array.reverse!
			s = File.read(path)
			g = RecursiveDescentParser.new

			t = Tokens.new(StringSequence.new(s))
			e = g.parse(t)
			e.statements.reverse!

			i = 0
			e.statements.each do |statement|
				javaline = array[i]
				assert_equal(statement.eval.to_f.sigfig_to_s(4), javaline.to_f.sigfig_to_s(4), "#{statement.eval} != #{javaline}")
				i += 1
			end
			
		end 
	end
end