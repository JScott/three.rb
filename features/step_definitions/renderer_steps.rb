require 'three'

Given /^I create a renderer$/ do
	v = "#{File.expand_path File.dirname(__FILE__)}/passthru.vert"
	f = "#{File.expand_path File.dirname(__FILE__)}/passthru.frag"
	@renderer = Three::Renderer.new vertex_shader: v, fragment_shader: f
end


When /^a cube is added to the scene$/ do
	pending "Three::BoxGeometry"
	@mesh = Three::Mesh.new geometry: Three::BoxGeometry.new(200, 200, 200)
	@scene.add @mesh
end

When /^the scene is drawn from the camera$/ do
	@renderer.render @scene, @camera
end


Then /^it creates a default renderer$/ do
	@renderer.vao.should_not be_nil
	@renderer.vbo.should_not be_nil
	@renderer.program.should_not be_nil
end

Then /^the scene objects display appropriately$/ do
	pending "Requires a pdiff framework"
end