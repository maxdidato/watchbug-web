Feature: User Management

  Scenario: New User Registration
    Given I navigate to '/users/sign_up'
    And I set 'my_email@domain.com' as 'Email'
    And I set 'whatever' as 'Password'
    And I set 'whatever' as 'Password confirmation'
    And I set 'my_username' as 'Username'
    When I click 'Sign up'
    Then I should see 'Welcome! You have signed up successfully.'