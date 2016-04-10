Feature: Integration with Google Maps
  USER STORY:
  As a Scout
  So that I can better track my progress, navigate to my next flag drop point, notify management of flag anchor maintenance, and to mark my route complete,
  I want to access my route through the application using Google Maps.

  As a Troop Administrator
  So that I can monitor and edit routes collectively or selectively,
  I want access to all routes through the application using Google Maps.

  Scenario: Test Google Map functionality with a route with no stops
  Given I am testing googleMaps on the routes 399 page
  When I am admin user
  Then the element with xpath "//*[@id="route-content"]/div[1]" should have div1 : No routes available!

    
  Scenario: Test Google Map functionality with a route with multiple stops
    Given I am testing googleMaps on the routes 395 page
    When I am admin user
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[1]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[2]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[3]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[4]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[5]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[6]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[7]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[8]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[9]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[10]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[11]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[12]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[13]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[14]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[15]" should exist
    Then the element with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[16]" should exist


  Scenario: Test Change Icon on google map
    Given I am testing googleMaps on the routes 395 page
    When I am admin user
    Then change the icons on the map to "http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_purple.png"


  Scenario: Test change location on google map
    Given I am testing googleMaps on the routes 395 page
    When I am admin user
    Then change the drop pin with xpath "//*[@id="map"]/div/div[1]/div[3]/div[3]/div[1]" loc "802 Welsh Avenue, College Station, TX, 77840" to loc "1005 Holleman Drive, College Station, TX, 77840" and check for a change

