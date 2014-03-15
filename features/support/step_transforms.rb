Transform /^0x[0-9a-fA-F]+$/ do |number|
	number.hex
end

Transform /^true$/ do
	true
end

Transform /^false$/ do
	false
end