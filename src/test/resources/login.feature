Feature: Sign in to the Sauce Demo application

  Background: User opens the Sauce Demo site
    Given I am on the Sauce Demo website

  Scenario: Sign in with valid credentials
    Given I type "standard_user" into the username field
    And I type "secret_sauce" into the password field
    When I press the login button
    Then the home page should be visible

  Scenario: Sign in with invalid credentials
    Given I type "invalid_user" into the username field
    And I type "invalid_password" into the password field
    When I press the login button
    Then An error message stating "Epic sadface: Username and password do not match any user in this service" should appear

  Scenario Outline: Sign in with valid credentials (examples)
    Given I type "<user>" into the username field
    And I type "<password>" into the password field
    When I press the login button
    Then the home page should be visible
    Examples:
      | user          | password     |
      | standard_user | secret_sauce |
      | problem_user  | secret_sauce |

  Scenario Outline: Sign in with invalid credentials (examples)
    Given I type "<user>" into the username field
    And I type "<password>" into the password field
    When I press the login button
    Then An error message stating "Epic sadface: Username and password do not match any user in this service" should appear
    Examples:
      | user          | password       |
      | standard_user | wrong_password |
      | wrong_user    | secret_sauce   |
      | user_3        | password3      |
