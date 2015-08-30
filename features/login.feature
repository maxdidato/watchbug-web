Feature: User Login

  Scenario: Login existing user
    Given I have registered using 'email@domain.com' as email and 'password' as password
    And I have completed my onbording
    When I navigate to '/users/sign_in'
    And I set 'email@domain.com' as 'Email'
    And I set 'password' as 'Password'
    And I click 'Log in'
    Then I should see 'Hello'


  Scenario: Logout
    Given I have registered using 'email@domain.com' as email and 'password' as password
    And I have completed my onbording
    And I signed in
    When I click 'Log out'
    Then I should see 'Log in'