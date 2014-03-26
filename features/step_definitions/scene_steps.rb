require 'three'

Given /^I create a scene$/ do
	@scene = Three::Scene.new
end


When /^I add (.+)? meshes to the scene$/ do |number|
	number.times do
		@scene.add(Three::Mesh.new)
	end
end


Then /^it creates a default scene$/ do
	@scene.should_not be_nil
	@scene.objects.should_not be_nil
end

Then /^the scene's object count is (.+)?$/ do |expected_count|
	@scene.should_not be_nil
	@scene.objects.count.should be expected_count
end