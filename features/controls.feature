Feature: Object meshes
	As a developer
	I can attach functions to inputs
	So that the visuals are interactive

	Scenario: Default scene
		Given I create controls for a window
		Then it creates an empty controls object

	Scenario: Add controls
		Given I create controls for a window
		When I add a function to Glfw::KEY_ESCAPE
		Then the function is registered for Glfw::KEY_ESCAPE
		# unfortunately we can't actually trigger it in test

	# So then I also can't test it's connection with Window