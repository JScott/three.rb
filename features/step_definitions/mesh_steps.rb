require 'three'

Given /^I create a mesh$/ do
	@mesh = Three::Mesh.new
end


Then /^it creates a default mesh$/ do
	@mesh.should_not be_nil
	@mesh.geometry.should_not be_nil
	@mesh.material.should_not be_nil
end