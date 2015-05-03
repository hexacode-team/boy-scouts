Feature: routeList page to view route lists
	In order to go to routeList page
	As an admin
	I want to be able to access the list of routes
	
	Scenario: Access route list page
		Given I am on the home page
		When I click on the routeList link
		Then I should land on the route list page