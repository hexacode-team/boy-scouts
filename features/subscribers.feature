Feature: Database Normalization between Service Address and Billing Address Information
  As an Admin
  So that there duplicate invoices are not created for multiple service address with the same billing addresses,
  I want the database to be normalized between service and billing address so that the correct and proper relations are created and no duplicate invoices are created.

  Scenario: Test subscribers page UI responsiveness on desktop
    Given I am testing on the admin page and then clicking subscriber on desktop
    When the browser width is 777px
    Then the element with class "navbar-toggle" should have display : none
    Then the element with class "navbar-toggle" should have display : inline-block

    Given I am testing on the admin page and then clicking subscriber on smartphone
    When the browser width is 320px
    Then the element with class "navbar-toggle" should have display : inline-block
    Then the element with id "sidebar-button" should have display : block
    Then the element with class "table" should have top : -9999px !important



