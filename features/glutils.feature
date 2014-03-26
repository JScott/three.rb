Feature: GL utility data structures
	As a developer
	I want recurring sets of GL functions abstracted
	To save time and improve readability

	Scenario: Use Vector3
		Given I create a 3D vector
		Then it creates a default 3D vector

	Scenario: Step through Vertex3 arrays
		Given I create an array of 6 3D vectors

	Scenario: Combine Vertex3 arrays
		Given I create two distinct arrays of 6 3D vectors
		When I merge those vectors
		Then the resulting array has 12 vectors
		And they are in the correct order

	Scenario: Use Vector2
		Given I create a 2D vector
		Then it creates a default 2D vector

	# GLUtil currently has nothing worth automated tests