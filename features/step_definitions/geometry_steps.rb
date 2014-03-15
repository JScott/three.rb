require 'three'

Given /^I create geometry$/ do
	@geometry = Three::Geometry.new
end

Given /^I create a (.+)? colored material$/ do |color|
	@material = Three::Material.new color: color
end

When /^I change the color to (.+)?$/ do |color|
	@material.color = color
end

When /^I enable wireframe mode$/ do
	@material.wireframe = true
end

Then /^it creates default geometry$/ do
	assert_not_equals [@geometry, nil]
end

Then /^its object's color changes to (.+)?$/ do |color|
	assert_equals [@material.color, Three::Color.by_name(color)]
end

Then /^its object displays in wireframe$/ do
	pending
end