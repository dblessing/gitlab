Feature: Gem version
  In order to know the gem version
  As a user
  I want to issue a version command

  Scenario: Full version command
    Given I issue the full version command
    Then the output should contain the version string

  Scenario: Short flag version command
    Given I issue the short flag version command
    Then the output should contain the version string

  Scenario: Long flag version command
    Given I issue the long flag version command
    Then the output should contain the version string
