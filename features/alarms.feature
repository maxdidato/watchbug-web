Feature: Alarms


  Scenario: Alarms for my vehicle being stolen
    Given I have logged in
    When an alarm is generated for my watchbug id
    Then I should see a popup saying "Your vehicle is being stolen"


  Scenario: Alarms for another vehicle being stolen
    Given I have logged in
    When an alarm is generated for another watchbug id
    Then I should not see a popup


  Scenario: Engage protection mode
    Given I have logged in
    And the api server accepts the protection mode request
    When I click 'Protection Mode'
    Then I should see 'Request sent'

  Scenario: Error while engaging protection mode
    Given I have logged in
    And the api server does not accept the protection mode request
    When I click 'Protection Mode'
    Then I should see 'Something went wrong'

