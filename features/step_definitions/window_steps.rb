require 'three'

Given /^I create a Three application$/ do
	Three::setup
end

Given /^I create a (.+)?x(.+)? Three application$/ do |width, height|
	Three::setup width: width.to_i, height: height.to_i
end


Then /^it creates a default window$/ do
	assert_not_equals [Three.window, nil]
	assert_equals		[Three.window.height, 600],
							[Three.window.width, 800]
end

Then /^it creates a (.+)?x(.+)? window$/ do |width, height|
	assert_not_equals [Three.window, nil]
	assert_equals		[Three.window.height, height.to_i],
							[Three.window.width, width.to_i]
end

Then /^it goes into a frame loop for at least (.+)? frame[s]?$/ do |frames|
	count = 0
	Three::each_frame @controls do
		count += 1
		Three.close_application if count == frames.to_i
	end
	assert_equals [count, frames.to_i]
end