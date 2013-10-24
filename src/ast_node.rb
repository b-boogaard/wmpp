class ASTNode

	def print(out, msg)
		# This may change depending on how we decide to abstract streams
		out.puts msg
	end

	def translate(out)
		# Implement translate to rubinius
	end

	def eval
		return self
	end
end