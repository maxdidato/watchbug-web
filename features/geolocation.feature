Feature: Geolocalisation of the vechicle

  Scenario: Show current location
    Given I have logged in
    And the last known position for my device is lat:'51 34.0752' and long:'-000 08.1995'
    When I click 'Current location'
    Then I should see an iframe with google maps pointing to '51 34.0752,-000 08.1995'

 Scenario: Show device battery status
   Given I have logged in
   And the battery level is '10'
   When I click 'Current location'
   Then I should see the battery level set to '10%'