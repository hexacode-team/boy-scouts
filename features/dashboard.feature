Feature: dashboardPage
	In order to go to dashboard
	As an admin
	I want to be able to access database dashboard

	Scenario: Access database dashboard
		Given I am on the admin page
		When I click on the dashboard link
		Then I should land on the dashboard page