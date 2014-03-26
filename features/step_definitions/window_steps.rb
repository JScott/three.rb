require 'three'

Given /^I create a Three application$/ do
	Three::setup
end

Given /^I create a (.+)?x(.+)? Three application$/ do |width, height|
	Three::setup width: width.to_i, height: height.to_i
end


Then /^it creates a default window$/ do
	Three.window.should_not be_nil
	Three.window.height.should equal 600
	Three.window.width.should equal 800
end

Then /^it creates a (.+)?x(.+)? window$/ do |width, height|
	Three.window.should_not be_nil
	Three.window.height.should be height.to_i
	Three.window.width.should be width.to_i
end

Then /^it goes into a frame loop for at least (.+)? frame[s]?$/ do |expected_frames|
	count = 0
	Three::each_frame do
		count += 1
		Three.close_application if count == expected_frames.to_i
	end
	count.should be expected_frames.to_i
end