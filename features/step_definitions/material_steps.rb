require 'three'

Given /^I create a material$/ do
	@material = Three::Material.new
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


Then /^it creates a default material$/ do
	@material.should_not be_nil
	@material.color.should be Three::Color.by_name("white")
	@material.wireframe.should be_false
end

Then /^its object's color changes to (.+)?$/ do |color|
	@material.color.should be Three::Color.by_name(color)
end

Then /^its object displays in wireframe$/ do
	pending
end