Feature: Enter Form Login
  Enter Form Login

  @scenario_outline
  Scenario Outline: Enter Login Form
    When I enter LoginForm: account: "<account>", "<password>"
    Then I expect login "<result>"

    Examples:
      | account | password      | result          |
      | root123 | Password123   | Welcoe root123  |
      | root123 | Password123@@ | Welcome root123 |
      | root123 | Password123   | Welcome root123 |
