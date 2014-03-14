module Three
	class Material
		attr_accessor :color, :wireframe
		def initialize(color: Three::Color.by_name("white"), wireframe: false)
			self.color = color
			@wireframe = wireframe
		end

		def color=(color)
			case color
			when Fixnum
				@color = Three::Color.by_hex("#{color.to_s(16)}")
			when String
				@color = Three::Color.by_name(color)
			else
				@color = Three::Color.by_name("white")
			end
		end
	end
end