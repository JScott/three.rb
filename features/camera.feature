Feature: Camera objects
	As a developer
	I can create cameras
	To represent user views

	Scenario: Default orthographic camera
		Given I create a orthographic camera object
		Then it creates a default orthographic camera object

	Scenario: Default perspective camera
		Given I create a 150x100 Three application
		And I create a perspective camera object
		Then it creates a default perspective camera object
		And it sets the aspect ratio to 1.5