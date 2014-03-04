module Three
	class Material
		attr_accessor :color, :wireframe
		def initialize(color: Three::Color.by_name("white"), wireframe: false)
			color = Three::Color.by_hex(fixnum_to_string color) if (color.class == Fixnum)
			@color = color
			@wireframe = wireframe
		end

		def fixnum_to_string(fixnum_hex)
			"#{fixnum_hex.to_s(16)}"
		end
	end
end