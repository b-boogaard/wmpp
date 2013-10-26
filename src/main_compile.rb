require_relative "parser.rb"
require_relative "stringsequence.rb"
require_relative "jasm_translate.rb"

def compile(file)
	s = File.read(file)
	t = Tokens.new(StringSequence.new(s))
	g = RecursiveDescentParser.new
	e = g.parse(t)
    r = JasminTranslator.new
    j = file[0..-6]
    j += ".j"
    r.translate(j,e)
end

ARGV.each do |a|
	compile(a)
end 