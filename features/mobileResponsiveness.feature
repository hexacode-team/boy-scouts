Feature: Mobile friendly and responsive on mobile devices for all potential users of app (admin and scouts)
  USER STORY:
  As a Scout
  So that I can send and receive live data while in the middle of flag runs.
  I want to be able to have up to date information on each individual runs and add maintenance notes on the flag site.

  Scenario: Access admin page on desktop
    Given I am on the home page
    When the browser width is 320px
    Then the element #bs-example-navbar-collapse-1 should have margin-right : -15px













#
#
#
#
#
#  Scenario: Access admin page on smart phone
#    Given I am on the home page and on smart phone
#    When I click on the admin link
#    Then I should land on the admin page with appropriate UI scaling and design
#
#  Scenario: Access admin page on tablet
#    Given I am on the home page and on tablet
#    When I click on the admin link
#    Then I should land on the admin page with appropriate UI scaling and design
#
#  Scenario: Access database dashboard on desktop
#    Given I am on the admin page and on desktop
#    When I click on the dashboard link
#    Then I should land on the dashboard page with appropriate UI scaling and design
#
#  Scenario: Access database dashboard on smart phone
#    Given I am on the admin page and on smart phone
#    When I click on the dashboard link
#    Then I should land on the dashboard page with appropriate UI scaling and design
#
#  Scenario: Access database dashboard on tablet
#    Given I am on the admin page and on tablet
#    When I click on the dashboard link
#    Then I should land on the dashboard page with appropriate UI scaling and design
#
#  Scenario: Access list of users on desktop
#    Given I am on the admin page on desktop
#    When I click on the users link
#    Then I should land on the users list page with appropriate UI scaling and design
#
#  Scenario: Access list of users on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the users link
#    Then I should land on the users list page with appropriate UI scaling and design
#
#  Scenario: Access list of users on tablet
#    Given I am on the admin page on tablet
#    When I click on the users link
#    Then I should land on the users list page with appropriate UI scaling and design
#
#
#  Scenario: Access subscription payment page on desktop
#    Given I am on the admin page on desktop
#    When I click on the payments link
#    Then I should land on the payments page with appropriate UI scaling and design
#
#  Scenario: Access subscription payment page on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the payments link
#    Then I should land on the payments page with appropriate UI scaling and design
#
#  Scenario: Access subscription payment page on tablet
#    Given I am on the admin page on tablet
#    When I click on the payments link
#    Then I should land on the payments page with appropriate UI scaling and design
#
#  Scenario: Access home page from admin page on desktop
#    Given I am on the admin page on desktop
#    When I click on the home link
#    Then I should land on the payments page with appropriate UI scaling and design
#
#  Scenario: Access home page from admin page on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the home link
#    Then I should land on the payments page with appropriate UI scaling and design
#
#  Scenario: Access home page from admin page on tablet
#    Given I am on the admin page on tablet
#    When I click on the home link
#    Then I should land on the payments page with appropriate UI scaling and design
#
#  Scenario: Access list of routes on desktop
#    Given I am on the admin page on desktop
#    When I click on the routes link
#    Then I should land on the routes list page with appropriate UI scaling and design
#
#  Scenario: Access list of routes on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the routes link
#    Then I should land on the routes list page with appropriate UI scaling and design
#
#  Scenario: Access list of routes on tablet
#    Given I am on the admin page on tablet
#    When I click on the routes link
#    Then I should land on the routes list page with appropriate UI scaling and design
#
#  Scenario: Access list of runs on desktop
#    Given I am on the admin page on desktop
#    When I click on the runs link
#    Then I should land on the runs list page with appropriate UI scaling and design
#
#  Scenario: Access list of runs on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the runs link
#    Then I should land on the runs list page with appropriate UI scaling and design
#
#  Scenario: Access list of runs on tablet
#    Given I am on the admin page on tablet
#    When I click on the runs link
#    Then I should land on the runs list page with appropriate UI scaling and design
#
#
#  Scenario: Access list of subscriptions on desktop
#    Given I am on the admin page on desktop
#    When I click on the subscriptions link
#    Then I should land on the subscriptions list page with appropriate UI scaling and design
#
#  Scenario: Access list of subscriptions on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the subscriptions link
#    Then I should land on the subscriptions list page with appropriate UI scaling and design
#
#  Scenario: Access list of subscriptions on tablet
#    Given I am on the admin page on tablet
#    When I click on the subscriptions link
#    Then I should land on the subscriptions list page with appropriate UI scaling and design
#
#
#  Scenario: Access list of groups on desktop
#    Given I am on the admin page on desktop
#    When I click on the groups link
#    Then I should land on the groups list page with appropriate UI scaling and design
#
#  Scenario: Access list of groups on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the groups link
#    Then I should land on the groups list page with appropriate UI scaling and design
#
#  Scenario: Access list of groups on tablet
#    Given I am on the admin page on tablet
#    When I click on the groups link
#    Then I should land on the groups list page with appropriate UI scaling and design
#
#  Scenario: Access list of member runs on desktop
#    Given I am on the admin page on desktop
#    When I click on the member runs link
#    Then I should land on the member runs list page with appropriate UI scaling and design
#
#  Scenario: Access list of member runs on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the member runs link
#    Then I should land on the member runs list page with appropriate UI scaling and design
#
#  Scenario: Access list of member runs on tablet
#    Given I am on the admin page on tablet
#    When I click on the member runs link
#    Then I should land on the member runs list page with appropriate UI scaling and design
#
#  Scenario: Access list of tasks on desktop
#    Given I am on the admin page on desktop
#    When I click on the tasks link
#    Then I should land on the tasks list page with appropriate UI scaling and design
#
#  Scenario: Access list of tasks on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the tasks link
#    Then I should land on the tasks list page with appropriate UI scaling and design
#
#  Scenario: Access list of tasks on tablet
#    Given I am on the admin page on tablet
#    When I click on the tasks link
#    Then I should land on the tasks list page with appropriate UI scaling and design
#
##  Scenario: Generate runsheet pdf
##    Given I am on the admin page
##    When I click on the generate run sheets pdf link
##    Then I should land on the generate run sheets pdf page
#
##  Scenario: Generate runsheet
##    Given I am on the admin page
##    When I click on the generate run sheets link
##    Then I should land on the generate run sheets page
#
#  Scenario: Generate group report pdf on desktop
#    Given I am on the admin page on desktop
#    When I click on the generate group report pdf link
#    Then I should land on the generate group report pdf page with appropriate UI scaling and design
#
#  Scenario: Generate group report pdf on mobile phone
#    Given I am on the admin page on mobile phone
#    When I click on the generate group report pdf link
#    Then I should land on the generate group report pdf page with appropriate UI scaling and design
#
#  Scenario: Generate group report pdf on tablet
#    Given I am on the admin page on tablet
#    When I click on the generate group report pdf link
#    Then I should land on the generate group report pdf page with appropriate UI scaling and design
#
##  Scenario: Generate invoice pdf
##    Given I am on the admin page
##    When I click on the generate invoice pdf link
##    Then I should land on the generate invoice pdf page
#
##  Scenario: Generate invoice
##    Given I am on the admin page
##    When I click on the generate invoice link
##    Then I should land on the generate invoice page