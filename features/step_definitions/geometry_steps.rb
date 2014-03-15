require 'three'

Given /^I create geometry$/ do
	@geometry = Three::Geometry.new
end

Given /^I create (.+)? geometry$/ do |vertex_order|
	@geometry = Three::Geometry.new vertex_order
end


When /^I push (\d+)?( different)? valid vertices$/ do |number, different|
	vertices = Three::Vector3[number]
	number.times do |i|
		vertices[i].x = 1.0
	end if different
	@geometry.push vertices
end

When /^I push (.+[^valid])? vertices$/ do |input_type|
	case input_type
	when "non-array"
		expect {
			@geometry.push Three::Vector3.new
		}.to raise_error ArgumentError
	when "hash"
		expect {
			@geometry.push({:x => 0, :y => 0, :z => 0})
		}.to raise_error ArgumentError
	when false
		expect {
			@geometry.push false
		}.to raise_error ArgumentError
	else
		raise "No test defined for #{input_type} (#{input_type.class})"
	end
end


Then /^it creates (.+)? geometry$/ do |vertex_order|
	vertex_order = GL_TRIANGLES if vertex_order == "default"
	@geometry.vertex_order.should be vertex_order
end

Then /^the geometry holds (.+)? vertices$/ do |expected_length|
	if expected_length == 0
		@geometry.vertices.should be_nil
	else
		@geometry.vertices.length.should be expected_length
	end
end

Then /^the first and last are different$/ do
	last_value = @geometry.vertices[@geometry.vertices.length-1].x
	@geometry.vertices.first.x.should_not be last_value
end