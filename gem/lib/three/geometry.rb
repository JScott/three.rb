require 'matrix'

module Three
	class Geometry
		attr_reader :vertices, :faces
		
		def initialize
			#Three.window.resize width, height
			@vertices = []
			@faces = []
		end

		def render(scene, camera)

		end

		def push(vertices)
			raise ArgumentError.new ("Faces are defined by 3 vertices") unless vertices.count%3 == 0
			raise ArgumentError.new ("Use the provided Three::Vector3 structure") unless vertices.first.class == Snow::CStruct::Vec3
			@vertices.push vertices
			@faces.push({:normal => get_normal(vertices[0], vertices[1], vertices[2])})
		end 

		def get_normal(v1, v2, v3)
			#TODO: replace with https://github.com/nilium/ruby-snowmath
			# right now I'm converting to Ruby constructs which may slow things down
			v1 = Vector[v1.x, v1.y, v1.z]
			v2 = Vector[v2.x, v2.y, v2.z]
			v3 = Vector[v3.x, v3.y, v3.z]
			a = v3 - v1
			b = v2 - v1
			c = a.cross_product b
			normal = Three::Vector3.new
			normal.x = c[0]
			normal.y = c[1]
			normal.z = c[2]
			normal
		end
	end
end