require_relative "parser.rb"
require_relative "stringsequence.rb"
require_relative "jasm_translate.rb"

def compile(file)
	file = ARGV[0]
	sequence = File.read("#{Dir.pwd}/#{file}")
	tokens = Tokens.new(StringSequence.new(sequence))
	parser = RecursiveDescentParser.new
	statements= parser.parse(tokens)
    translator = JasminTranslator.new
    name = file.split("/")
    filename = name[name.length - 1]
    temp = filename.split(".")
    filename = temp[0]
    filename += ".j"
    translator.translate(filename,statements)
end

ARGV.each do |a|
	compile(a)
end 