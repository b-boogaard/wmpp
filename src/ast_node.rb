class ASTNode

	def print(out)
		# This may change depending on how we decide to abstract streams
		out.write "ASTNode"
	end

	def translate(out)
		# Implement translate to rubinius
		raise("No implementation of ASTNode translate")
	end

	def eval
		return self
	end
end