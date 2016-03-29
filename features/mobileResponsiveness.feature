Feature: Mobile friendly and responsive on mobile devices for all potential users of app (admin and scouts)
  USER STORY:
  As a Scout
  So that I can send and receive live data while in the middle of flag runs.
  I want to be able to have up to date information on each individual runs and add maintenance notes on the flag site.


  Scenario: Test home page UI responsiveness on desktop
    Given I am testing responsiveness on the home page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none


  Scenario: Test home page UI responsiveness on smart phone
    Given I am testing responsiveness on the home page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block


  Scenario: Test home page UI responsiveness on tablet
    Given I am testing responsiveness on the home page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none



  Scenario: Test groupList page UI responsiveness on desktop
    Given I am testing responsiveness on the groupList page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none


  Scenario: Test groupList page UI responsiveness on smart phone
    Given I am testing responsiveness on the groupList page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block


  Scenario: Test groupList page UI responsiveness on tablet
    Given I am testing responsiveness on the groupList page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none


  Scenario: Test routeList page UI responsiveness on desktop
    Given I am testing responsiveness on the routeList page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none


  Scenario: Test routeList page UI responsiveness on smart phone
    Given I am testing responsiveness on the routeList page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block


  Scenario: Test routeList page UI responsiveness on tablet
    Given I am testing responsiveness on the routeList page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none


  Scenario: Test admin page UI responsiveness on desktop
    Given I am testing responsiveness on the admin page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test admin page UI responsiveness on smart phone
    Given I am testing responsiveness on the admin page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test admin page UI responsiveness on tablet
    Given I am testing responsiveness on the admin page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block


  Scenario: Test users page UI responsiveness on desktop
    Given I am testing responsiveness on the users page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test users page UI responsiveness on smart phone
    Given I am testing responsiveness on the users page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test users page UI responsiveness on tablet
    Given I am testing responsiveness on the users page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block


  Scenario: Test payments page UI responsiveness on desktop
    Given I am testing responsiveness on the payments page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test payments page UI responsiveness on smart phone
    Given I am testing responsiveness on the payments page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test payments page UI responsiveness on tablet
    Given I am testing responsiveness on the payments page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block





  Scenario: Test routes page UI responsiveness on desktop
    Given I am testing responsiveness on the routes page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test routes page UI responsiveness on smart phone
    Given I am testing responsiveness on the routes page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test routes page UI responsiveness on tablet
    Given I am testing responsiveness on the routes page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block


  Scenario: Test runs page UI responsiveness on desktop
    Given I am testing responsiveness on the runs page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test runs page UI responsiveness on smart phone
    Given I am testing responsiveness on the runs page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test runs page UI responsiveness on tablet
    Given I am testing responsiveness on the runs page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block



  Scenario: Test subscriptions page UI responsiveness on desktop
    Given I am testing responsiveness on the subscriptions page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test subscriptions page UI responsiveness on smart phone
    Given I am testing responsiveness on the subscriptions page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test subscriptions page UI responsiveness on tablet
    Given I am testing responsiveness on the subscriptions page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block


  Scenario: Test groups page UI responsiveness on desktop
    Given I am testing responsiveness on the groups page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test groups page UI responsiveness on smart phone
    Given I am testing responsiveness on the groups page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test groups page UI responsiveness on tablet
    Given I am testing responsiveness on the groups page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block


  Scenario: Test member runs page UI responsiveness on desktop
    Given I am testing responsiveness on the member runs page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test member runs page UI responsiveness on smart phone
    Given I am testing responsiveness on the member runs page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test member runs page UI responsiveness on tablet
    Given I am testing responsiveness on the member runs page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block


  Scenario: Test tasks page UI responsiveness on desktop
    Given I am testing responsiveness on the tasks page
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

  Scenario: Test tasks page UI responsiveness on smart phone
    Given I am testing responsiveness on the tasks page
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important


  Scenario: Test tasks page UI responsiveness on tablet
    Given I am testing responsiveness on the tasks page
    When the browser width is 768px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with id "sidebar-button" should have display : block



#
#
#
#
#  Scenario: Access database dashboard on desktop
#    Given I am on the dashboard page
#    When the browser width is greater than or equal to 768px
#    Then the element #container-fluid should have margin-right : 0px
#
#
#  Scenario: Access database dashboard on smart phone vertical
#    Given I am on the dashboard page
#    When the browser width is 320px
#    Then the element #container-fluid should have margin-right : -15px
#
#  Scenario: Access database dashboard on smart phone horizontal
#    Given I am on the dashboard page
#    When the browser width is 480px
#    Then the element #container-fluid should have margin-right : -15px
#
#
#  Scenario: Access database dashboard on tablet vertical
#    Given I am on the dashboard page
#    When the browser width is 768px
#    Then the element #container-fluid should have margin-right : 0px
#
#
#  Scenario: Access database dashboard on tablet horizontal
#    Given I am on the dashboard page
#    When the browser width is 1024px
#    Then the element #container-fluid should have margin-right : 0px
#
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