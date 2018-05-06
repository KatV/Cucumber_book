Feature: Cash Withdrawal
  ​
  Scenario: Successful withdrawal from an account in credit
  ​
    Given my account has been credited with USD10000
    When I withdraw USD2000
    Then USD2000 should be dispensed
    And the balance of my account should be USD8000
