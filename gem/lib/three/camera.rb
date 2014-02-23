module Three
	class Camera
		def initialize 

		end
	end

	class OrthographicCamera < Camera
		def initialize left, right, top, bottom, near, far
			super()

		end
	end

	class PerspectiveCamera < Camera
		def initialize fov, near, far
			super()
			aspect = Three.window.width/Three.window.height
		end
	end
end