Feature: Checkout feature

  Background: User should be logged
    Given I am on the Sauce Demo website
    And I type "standard_user" into the username field
    And I type "secret_sauce" into the password field
    When I press the login button

  Scenario: User can checkout a purchase
    Then the home page should be visible
    And I add "Sauce Labs Backpack" to my cart
    And I open the cart
    When I proceed to checkout
    And I enter my checkout details
      | Valentina | Calvo | 12345 |
    And I click on the continue button
    When I finalize the order
    Then I should see a message saying "Thank you for your order!"

  Scenario: Error message when first name is empty
    Then the home page should be visible
    And I add "Sauce Labs Backpack" to my cart
    And I open the cart
    When I proceed to checkout
    When I enter only last name and postal code
      | Calvo | 12345 |
    And I click on the continue button
    Then I should see an error message saying "Error: First Name is required"

  Scenario: Error message when post code is empty
    Then the home page should be visible
    And I add "Sauce Labs Backpack" to my cart
    And I open the cart
    When I proceed to checkout
    And I enter only first name and last name
      | Valentina | Calvo |
    And I click on the continue button
    Then I should see an error message saying "Error: Postal Code is required"
