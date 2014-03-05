require 'matrix'

module Three
	class Geometry
		attr_reader :vertices, :faces
		
		def initialize
			@faces = []
		end

		def merge(vertices)
			raise ArgumentError.new ("Push the provided Three::Vector3 structure") unless vertices.class == Snow::CStruct::Vec3::Array
			new_vertices = Three::Vector3[vertices.count + @vertices.count]
			i = 0
			@vertices.each do |v|
				new_vertices[i].x = @vertices[i].x
				new_vertices[i].y = @vertices[i].y
				new_vertices[i].z = @vertices[i].z
				i += 1
			end
			vertices.each do |v|
				new_vertices[i].x = vertices[i].x
				new_vertices[i].y = vertices[i].y
				new_vertices[i].z = vertices[i].z
				i += 1
			end
			@vertices.free!
			@vertices = new_vertices
		end

		def push(vertices)
			raise ArgumentError.new ("Faces are defined by 3 vertices") unless vertices.count%3 == 0
			raise ArgumentError.new ("Use the provided Three::Vector3 structure") unless vertices.class == Snow::CStruct::Vec3::Array
			if @vertices == nil
				@vertices = vertices
			else
				@vertices.merge vertices
			end
			# TODO: do something with faces. we might need lighting first
			#@faces.push({:normal => get_normal(vertices[0], vertices[1], vertices[2])})
		end 

		def get_normal(v1, v2, v3)
			# TODO: replace with https://github.com/nilium/ruby-snowmath
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