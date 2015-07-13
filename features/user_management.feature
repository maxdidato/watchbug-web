Feature: User Management

  Scenario: New User Registration
    Given I navigate to '/users/sign_up'
    And I set 'my_email@domain.com' as 'Email'
    And I set 'whatever' as 'Password'
    And I set 'whatever' as 'Password confirmation'
    When I click 'Sign up'
    Then I should see 'Give us more information'

    Scenario: New User Onboarding
      Given I have registered using 'email@domain.com' as username and 'password' as password
      But I have not completed my onbording yet
      And I signed in
      And I set 'username' as 'Username'
      And I set 'Max' as 'First name'
      And I set 'Max' as 'Surname'
      And I set 'My Id' as 'Watchbug'
      When I click 'Complete Registration'
      Then I should see 'Registration completed'