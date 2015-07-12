Feature: User Managent

  Scenario: New User Registration
    Given I navigate to '/users/new'
    And I set 'myemail@domain.com' as 'Email'
    And I set 'whatever' as 'Password'
    And I set 'Massimiliano' as 'First name'
    And I set 'Di Dato' as 'Surname'
    When I click 'Register'
    Then I should see 'User was successfully created.'