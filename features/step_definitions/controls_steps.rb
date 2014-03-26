require 'three'

Given /^I create controls for a window$/ do
	Three::setup
	@controls = Three::Controls.new
end


When /^I add a function to (.+)?$/ do |key|
	@function = lambda { puts "test" }
	@controls.for key do @function end
end


Then /^it creates an empty controls object$/ do
	@controls.should_not be_nil
	@controls.registered_actions.count.should equal 0
end

Then /^the function is registered for (.+)?$/ do |key|
	@controls.registered_actions.count.should equal 1
	@controls.registered_actions[key].call().should be @function
end