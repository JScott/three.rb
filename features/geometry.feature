Feature: Object geometry
	As a developer
	I can create and modify geometry vertices
	So that objects can be displayed in space

	Scenario: Default geometry
		Given I create geometry
		Then it creates a default geometry

	Scenario Outline: Set material color
		Given I create a <input> colored material
		Then its object's color changes to <expected>
		Examples:
			| input    | expected |  
			| 0xff0000 | red      |  
			| red      | red      |  
			| false    | white    |  

	Scenario Outline: Change material color
		Given I create a material
		When I change the color to <input>
		Then its object's color changes to <expected>
		Examples:
			| input    | expected |  
			| 0xff0000 | red      |  
			| red      | red      |  
			| false    | white    |  

	Scenario: Render in wireframe
		Given I create a material
		When I enable wireframe mode
		Then its object displays in wireframe