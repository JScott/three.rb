module Three
	class Controls
		attr_reader :registered_actions

		def initialize
			@registered_actions = {}
		end

		def for key, &action
			@registered_actions[key] = action if action
		end

		def each
			@registered_actions.each do |element| yield element end
		end
	end
end