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
		def initialize fov, aspect, near, far
			super()

		end
	end
end