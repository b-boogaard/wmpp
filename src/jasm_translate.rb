require_relative "virtual.rb"

class Translator
virtual :translate
end

class JasminTranslator < Translator
attr_accessor :name
attr_accessor :out
attr_accessor :program

	def header
		@out.write(".class public\n")
		@out.write(".super java/lang/Object\n")
		@out.write("\n")
		@out.write("; default constructor\n")
		@out.write(".method public <init>()V\n")
		@out.write("	aload_0 ; push this\n")
		@out.write("	invokespecial java/lang/Object/<init>()V ; call super\n")
		@out.write("	return\n")
		@out.write(".end method\n")
		@out.write("\n")
		@out.write(".method public static main([Ljava/lang/String;)V\n")
		@out.write("begin:\n")
	end

	def footer
		@out.write("   ; terminate main\n")
    	@out.write("   return\n")
    	@out.write("end:\n")
    	@out.write(".end method\n")
	end

	def body
    	#@program.translate(@out);
	end

	def generate
		header
		body
		footer
	end

	def translate(file, program)
		@name = file[0..-2]
		@out = File.open(file, 'w')
		@program = program
		generate
	end
end