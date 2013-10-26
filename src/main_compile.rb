require_relative "parser.rb"
require_relative "stringsequence.rb"
require_relative "jasm_translate.rb"

def compile(file)
	file = ARGV[0]
	s = File.read("#{Dir.pwd}/#{file}")
	t = Tokens.new(StringSequence.new(s))
	g = RecursiveDescentParser.new
	e = g.parse(t)
    r = JasminTranslator.new
    name = file.split("/")
    j = name[name.length - 1]
    temp = j.split(".")
    j = temp[0]
    j += ".j"
    r.translate(j,e)
end

ARGV.each do |a|
	compile(a)
end 