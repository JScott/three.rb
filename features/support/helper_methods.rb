def assert_equals(*pairs)
	pairs.each do |key, value|
		raise "Expected #{key} (#{key.class}) to be #{value} (#{value.class})" unless key == value
	end
end

def assert_not_equals(*pairs)
	pairs.each do |key, value|
		raise "Expected #{key} (#{key.class}) not to be #{value} (#{value.class})" unless key != value
	end
end