require 'glfw3'
require 'opengl-core'
require 'opengl-core/aux'
require 'snow-data'
include Gl

$gl_uint = Snow::CStruct.new { uint32_t :name }
$gl_string = Snow::CStruct.new { char :ordinal }

class Three
	def get_error_string(code)
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
	
	def self.error_check
		error = glGetError()
		#raise "GLError: #{error.to_s(16)}" unless error == GL_NO_ERROR
		raise "GLError: #{get_error_string(error.to_i)}" unless error == GL_NO_ERROR
	end

	def self.set_key_callback(window, *keys)
		window.set_key_callback do |_window, key_pressed, code, action, mods|
		  	keys.each do |key, function|
		  		function.call if key_pressed == key
		  	end
		end
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
end
