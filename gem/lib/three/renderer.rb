module Three
	class Renderer
		attr_accessor :vbo, :vao
		def initialize
			#Three.window.resize width, height

			@vao = VertexArray.new
			@vao.bind
			Three::GLUtils.error_check

			@vbo = Buffer.new GL_ARRAY_BUFFER
			@vbo.bind
			Three::GLUtils.error_check
		end

		def render(scene, camera)
			# for each scene mesh
			# grab triangles from geometry
			# grab colour from material
			#glBufferData GL_ARRAY_BUFFER, vertices.bytesize, vertices.address, GL_STATIC_DRAW
			#glDrawArrays GL_TRIANGLES, 0, 3 #3*triangle.count
			#Three::GLUtils.error_check
		end
	end
end