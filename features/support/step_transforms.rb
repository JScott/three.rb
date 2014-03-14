Transform /^0x[0-9a-fA-F]+$/ do |number|
	number.hex
end

Transform /^true$/ do |number|
	true
end

Transform /^false$/ do |number|
	false
end