Feature: Object materials
	As a developer
	I can create and modify a new renderer
	So that it can turn data into pretty pictures

	Scenario: Default renderer
		Given I create a renderer
		Then it creates a default renderer

	Scenario: Render scene with camera
		Given I create a renderer
		And I create a scene
		And I create a perspective camera object
		When a cube is added to the scene
		And the scene is drawn from the camera
		Then the scene objects display appropriately