require 'three'

Given /^I create a (\d)D vector$/ do |dimensions|
	@vector = []
	case dimensions.to_i
	when 2
		@vector = Three::Vector2.new
	when 3
		@vector = Three::Vector3.new
	end
end

Given /^I create an array of (\d) 3D vectors$/ do |count|
	@vectors = Three::Vector3[count.to_i]
end

Given /^I create two distinct arrays of (\d) 3D vectors$/ do |count|
	@first_vectors = Three::Vector3[count.to_i]
	@second_vectors = Three::Vector3[count.to_i]
	@second_vectors.each do |vector|
		vector.x = 1.0
	end
end


When /^I merge those vectors$/ do
	@first_vectors.merge! @second_vectors
end


Then /^it creates a default (\d)D vector$/ do |dimensions|
	case dimensions.to_i
	when 2
		@vector.x.should equal 0.0
		@vector.y.should equal 0.0
	when 3
		@vector.x.should equal 0.0
		@vector.y.should equal 0.0
		@vector.z.should equal 0.0
	end
end

Then /^the resulting array has (\d+) vectors$/ do |count|
	@first_vectors.count.should be count.to_i
end

Then /^they are in the correct order$/ do
	last_x = @first_vectors[@first_vectors.length-1].x
	@first_vectors[0].x.should_not equal last_x
end