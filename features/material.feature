Feature: Create material
	As a developer
	I can create and modify new material
	So that it can hold important material data

	Scenario: Default material
		Given I create a material
		Then it creates a default material

	Scenario: Change material color
		Given I create a material
		When I change the color to 0xff0000
		Then its object's color changes to red

	Scenario: Change color by name
		Given I create a material
		When I change the color to red
		Then its object's color changes to red

	Scenario: Change color with an invalid value
		Given I create a material
		When I change the color to false
		Then its object's color changes to white

	Scenario: Render in wireframe
		Given I create a material
		When I enable wireframe mode
		Then its object displays in wireframe