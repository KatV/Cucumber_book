Feature: Cash Withdrawal
  ​
  Scenario: Successful withdrawal from an account in credit
  ​
    Given my account has been credited with USD100
    When I withdraw USD20
    Then USD20 should be dispensed
    And the balance of my account should be USD80
