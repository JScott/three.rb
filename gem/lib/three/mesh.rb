module Three
	class Mesh
		attr_accessor :geometry, :material
		def initialize(geometry, material)
			@geometry = geometry
			@material = material
		end
	end
end