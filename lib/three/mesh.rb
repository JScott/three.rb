module Three
	class Mesh
		attr_accessor :geometry, :material
		def initialize(geometry: Three::Geometry.new, material: Three::Material.new)
			@geometry = geometry
			@material = material
		end
	end
end