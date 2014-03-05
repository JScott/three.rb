module Three
	class Renderer
		attr_accessor :vbo, :vao
		def initialize
			@vao = VertexArray.new
			@vao.bind
			Three::GLUtils.error_check

			@vbo = Buffer.new GL_ARRAY_BUFFER
			@vbo.bind
			Three::GLUtils.error_check

			# === TODO: custom shaders in an object's material
			vertex_shader = Three::GLUtils.compile_shader GL_VERTEX_SHADER, "passthru.vert"
			fragment_shader = Three::GLUtils.compile_shader GL_FRAGMENT_SHADER, "passthru.frag"
			Three::GLUtils.error_check

			program = Three::GLUtils.create_shader_program vertex_shader, fragment_shader
			program.use
			Three::GLUtils.error_check
			# ===

			vertices_per_face = 3 # Three.rb, not Two.rb
			glVertexAttribPointer 0, vertices_per_face, GL_FLOAT, GL_FALSE, 0, 0
			glEnableVertexAttribArray 0
			Three::GLUtils.error_check
		end

		def render(scene, camera)
			scene.objects.each do |object|
				case object
				when Three::Mesh
					#color = object.material.color
					@vao.bind # TODO: do I need this when I bind it earlier?

					# TODO: modify how vertices are pushed. it should be one contiguous struct, not an array
					vertices = object.geometry.vertices
					glBufferData GL_ARRAY_BUFFER, vertices.bytesize, vertices.address, GL_STATIC_DRAW
					glDrawArrays GL_TRIANGLES, 0, vertices.count
					Three::GLUtils.error_check
				end
			end
		end
	end
end