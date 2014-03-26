Feature: Object meshes
	As a developer
	I can create and modify a new scene
	So that it can represent a collection of objects

	Scenario: Default scene
		Given I create a scene
		Then it creates a default scene

	Scenario: Add object
		Given I create a scene
		When I add 3 meshes to the scene
		Then the scene's object count is 3