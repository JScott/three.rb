Feature: Object geometry
	As a developer
	I can create and modify geometry vertices
	So that objects can be displayed in space

	Scenario: Default geometry
		Given I create geometry
		Then it creates default geometry

	Scenario: Custom geometry
		Given I create GL_LINE_STRIP geometry
		Then it creates GL_LINE_STRIP geometry

	Scenario: Push vertex data
		Given I create geometry
		When I push 3 valid vertices
		And I push 3 different valid vertices
		Then the geometry holds 6 vertices
		And the first and last are different

	Scenario Outline: Push invalid vertex data
		Given I create geometry
		When I push <input> vertices
		Then the geometry holds 0 vertices
		Examples:
			| input     |
			| non-array |
			| hash      |
			| false     |
