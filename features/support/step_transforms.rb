Transform /^-?[0-9]+$/ do |integer|
	integer.to_i
end

Transform /^0x[0-9a-fA-F]+$/ do |number|
	number.hex
end

Transform /^true$/ do |bool|
	true
end

Transform /^false$/ do |bool|
	false
end

Transform /^GL_.*$/ do |gl_constant|
	eval gl_constant
end