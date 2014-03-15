require 'matrix'

module Three
	class Geometry
		attr_reader :vertices, :vertex_order
		
		def initialize(vertex_order = GL_TRIANGLES)
			@vertex_order = vertex_order
		end

		def push(vertices)
			raise ArgumentError.new "Use the provided Three::Vector3 structure" unless vertices.class == Snow::CStruct::Vec3::Array
			if @vertices == nil
				@vertices = vertices
			else
				@vertices.resize! @vertices.length+vertices.length
				vertices.each_with_index do |vertex, i|
					new_i = @vertices.length - vertices.length + i
					@vertices[new_i] = vertices[i]
				end
			end
		end
	end
end