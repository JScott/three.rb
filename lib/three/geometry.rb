require 'matrix'

module Three
	class Geometry
		attr_reader :vertices, :vertex_order
		
		def initialize(vertex_order = GL_TRIANGLES)
			@vertex_order = vertex_order
		end

		def push(vertices)
			raise ArgumentError.new "Use the provided Three::Vector3 array structure" unless vertices.class == Snow::CStruct::Vec3::Array
			if @vertices == nil
				@vertices = vertices
			else
				@vertices.merge! vertices
			end
		end
	end
end