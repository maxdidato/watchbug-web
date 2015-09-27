Feature: Alarms


  Scenario: Alarms for my vehicle being stolen
    Given I have logged in
    When an alarm is generated for my watchbug id
    Then I should see a popup saying "Your vehicle is being stolen"


  Scenario: Alarms for another vehicle being stolen
    Given I have logged in
    When an alarm is generated for another watchbug id
    Then I should not see a popup

