Feature: Testing out the basic step definitions for JSON

  Scenario: Domain override (BS1)
    Given I am a JSON API consumer
      And I am executing test "BS1"
     When I request GET "/"
     Then I should get a status code of 200