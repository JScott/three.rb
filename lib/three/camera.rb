module Three
	class BaseCamera
		attr_accessor :position, :near, :far
		def initialize(near, far)
			@position = Vector3.new
			@near = near
			@far = far
		end
	end

	class OrthographicCamera < BaseCamera
		def initialize(left: -0.5, right: 0.5, top: 0.5, bottom: -0.5, near: 1, far: 10000)
			super near, far
		end
	end

	class PerspectiveCamera < BaseCamera
		attr_accessor :aspect
		def initialize(fov: 75, near: 1, far: 10000)
			super near, far
			@aspect = Three.window.width/Three.window.height
		end
	end
end