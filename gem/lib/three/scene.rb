module Three
	class Scene
		attr_reader :objects
		def initialize
			@objects = []
		end

		def add(object)
			@objects.push(object)
		end
	end
end