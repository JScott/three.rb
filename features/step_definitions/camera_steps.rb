require 'three'

Given /^I create a[ ]?(.+)? camera object$/ do |camera_type|
	case camera_type
	when "orthographic"
		@camera = Three::OrthographicCamera.new
	when "perspective"
		@camera = Three::PerspectiveCamera.new
	else
		@camera = Three::BaseCamera.new
	end
end


Then /^it creates a default[ ]?(.+)? camera object$/ do |camera_type|
	@camera.should_not be_nil
	@camera.position.should_not be_nil
	@camera.near.should be 1
	@camera.far.should be 10000
end

Then /^it sets the aspect ratio to (.+)?$/ do |ratio|
	@camera.aspect.should be ratio.to_i
end