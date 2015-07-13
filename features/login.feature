Feature: User Login

  Scenario: Registered user login
    Given I have registered using 'email@domain.com' as username and 'password' as password
    When I navigate to '/users/sign_in'
    And I set 'email@domain.com' as 'Email'
    And I set 'password' as 'Password'
    And I click 'Log in'
    Then I should see 'Signed in successfully'