module Three
	class Camera
		attr_accessor :position, :near, :far
		def initialize(near, far)
			@position = Vector3.new
			@near = near
			@far = far
		end
	end

	class OrthographicCamera < Camera
		def initialize(left, right, top, bottom, near, far)
			super near, far
		end
	end

	class PerspectiveCamera < Camera
		attr_accessor :aspect
		def initialize(fov, near, far)
			super near, far
			@aspect = Three.window.width/Three.window.height
		end
	end
end