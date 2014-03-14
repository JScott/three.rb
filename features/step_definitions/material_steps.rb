require 'three'

Given /^I create a material$/ do
	@material = Three::Material.new
end

When /^I change the color to (.+)?$/ do |color|
	@material.color = color
end

When /^I enable wireframe mode$/ do
	@material.wireframe = true
end

Then /^it creates a default material$/ do
	assert_equals	[@material.color, Three::Color.by_name("white")],
						[@material.wireframe, false]
end

Then /^its object's color changes to (.+)?$/ do |color|
	assert_equals [@material.color, Three::Color.by_name(color)]
end

Then /^its object displays in wireframe$/ do
	pending
end