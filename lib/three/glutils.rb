module Three
	Vector3 	= Snow::CStruct[:Vec3, 'x: float :4; y: float :4; z: float :4']
	Vector2	= Snow::CStruct[:Vec2, 'x: float :4; y: float :4']
	#Vertex 	= Snow::CStruct.new {
	#	vec3  :position,      align: 4
	#	vec3  :normal,        align: 4
	#	vec2 	:texcoord, [2], align: 4
	#	color :color,         align: 4
	#}
	class Snow::CStruct::Vec3::Array
		def step(by, &method)
			(0..@length).step(by) do |i| method.call(i) end
		end

		def merge!(vertices)
			raise ArgumentError.new ("Can only merge with another Three::Vector3::Array") unless vertices.class == Snow::CStruct::Vec3::Array
			old_length = self.length
			self.resize! old_length+vertices.length
			vertices.each_with_index do |v, i|
				self[old_length+i].x = vertices[i].x
				self[old_length+i].y = vertices[i].y
				self[old_length+i].z = vertices[i].z
			end
		end
	end

	
	class GLUtils
		def self.error_check
			error = glGetError()
			raise "GLError (#{error.to_s(16)}): #{get_error_string(error.to_i)}" unless error == GL_NO_ERROR
		end

		def self.compile_shader(type, path)
			shader = Shader.new type
			shader.source = File.open(path).read
			shader.compile
			puts "Compiling #{path}", shader.info_log
			return shader
		end

		def self.create_shader_program(*shaders)
			program = Program.new
			shaders.each do |shader|
				program.attach_shader shader
			end
			program.link
			puts "Creating shader program", program.info_log
			return program
		end

		def self.get_error_string(code)
			case code
			when GL_INVALID_ENUM
				"An unacceptable value is specified for an enumerated argument. The offending command is ignored and has no other side effect than to set the error flag."
			when GL_INVALID_VALUE
				"A numeric argument is out of range. The offending command is ignored and has no other side effect than to set the error flag."
			when GL_INVALID_OPERATION
				"The specified operation is not allowed in the current state. The offending command is ignored and has no other side effect than to set the error flag."
			when GL_INVALID_FRAMEBUFFER_OPERATION
				"The framebuffer object is not complete. The offending command is ignored and has no other side effect than to set the error flag."
			when GL_OUT_OF_MEMORY
				"There is not enough memory left to execute the command. The state of the GL is undefined, except for the state of the error flags, after this error is recorded."
			when GL_STACK_UNDERFLOW
				"An attempt has been made to perform an operation that would cause an internal stack to underflow."
			when GL_STACK_OVERFLOW
				"An attempt has been made to perform an operation that would cause an internal stack to overflow."
			end
		end
	end
end