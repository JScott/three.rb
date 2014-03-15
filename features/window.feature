Feature: Window contexts
	As a developer
	I can create and modify a new window
	So that it can display cool stuff

	Scenario: Default window
		Given I create a Three application
		Then it creates a default window

	Scenario: Custom window
		Given I create a 100x200 Three application
		Then it creates a 100x200 window

	Scenario: Renders frames
		Given I create a Three application
		Then it goes into a frame loop for at least 60 frames