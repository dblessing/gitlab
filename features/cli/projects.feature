Feature: Projects
  In order to interact with projects
  As a user
  I want to issue various project commands

  Scenario: List projects
    Given projects already exist
    And I issue the projects command without any options
    Then the output should contain a list of projects

