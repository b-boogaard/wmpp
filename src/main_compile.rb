require_relative "parser.rb"
require_relative "stringsequence.rb"
require_relative "jasm_translate.rb"

def compile(file)
	sequence = File.read(file)
	tokens = Tokens.new(StringSequence.new(sequence))
	parser = RecursiveDescentParser.new
	statements = parser.parse(tokens)
    translator = JasminTranslator.new
    filename = file[0..-6] + ".j"
    translator.translate(filename,statements)
end

ARGV.each do |a|
	compile(a)
end 