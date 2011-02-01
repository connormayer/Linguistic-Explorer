Feature: Search Lings for Any Property

  Background:
    Given I am a visitor

    # Ling[] Prop[] Val[]
    # selector for ling
    # selector for prop
    # selector for val
    # choosing any
    # choosing all

  Scenario: Visitor selects one language
    And the following lings:
    | name        |
    | English     |
    | Spanish     |
    | German      |
    When I go to the new search page
    And I check "Include language"
    And I select "English" from "Languages"
    And I press "Search"
    Then I should see "Results"
    And I should see "English"
    And I should not see "Spanish"

  Scenario: Visitor selects one language, one property
    And the following lings and properties:
    | name        | property_name     | property_value |
    | English     | Adjective Noun    | yes  |
    | English     | Adjective Degree  | yes  |
    | Spanish     | Adjective Noun    | yes  |
    | German      | Adjective Degree  | yes  |
    When I go to the new search page
    And I check "Include language"
    And I check "Include property"
    And I select "English" from "Languages"
    And I select "Adjective Noun" from "Properties"
    And I press "Search"
    Then I should see "Results"
    And I should see "English"
    And I should see "Adjective Noun" within ".english_property"
    And I should not see "Spanish"
    And I should not see "German"
    And I should not see "Adjective Degree"

  Scenario: Visitor selects multiple languages, one property
    And the following lings and properties:
    | name        | property_name     | property_value |
    | English     | Adjective Noun    | yes  |
    | English     | Adjective Degree  | yes  |
    | Spanish     | Adjective Noun    | yes  |
    | German      | Adjective Degree  | yes  |
    When I go to the new search page
    And I check "Include language"
    And I check "Include property"
    And I select "English" from "Languages"
    And I select "Spanish" from "Languages"
    And I select "German" from "Languages"
    And I select "Adjective Noun" from "Properties"
    And I press "Search"
    Then I should see "Results"
    And I should see "English"
    And I should see "Spanish"
    And I should see "Adjective Noun" within ".english_property"
    And I should see "Adjective Noun" within ".spanish_property"
    And I should not see "German"
    And I should not see "Adjective Degree"

  Scenario: Visitor allows all languages, one property
    And the following lings and properties:
    | name        | property_name     | property_value |
    | English     | Adjective Noun    | yes  |
    | English     | Adjective Degree  | yes  |
    | Spanish     | Adjective Noun    | yes  |
    | German      | Adjective Degree  | yes  |
    | German      | Degree Adjective  | yes  |
    When I go to the new search page
    And I check "Include language"
    And I check "Include property"
    And I allow all languages
    And I select "Adjective Noun" from "Properties"
    And I press "Search"
    Then I should see "Results"
    And I should see "English"
    And I should see "Spanish"
    And I should see "Adjective Noun" within ".english_property"
    And I should see "Adjective Noun" within ".spanish_property"
    And I should not see "German"
    And I should not see "Adjective Degree"
    And I should not see "Degree Adjective"

  Scenario: Visitor allows all languages, multiple properties
    And the following lings and properties:
    | name        | property_name     | property_value |
    | English     | Adjective Noun    | yes  |
    | English     | Adjective Degree  | yes  |
    | Spanish     | Adjective Noun    | yes  |
    | German      | Degree Adjective  | yes  |
    When I go to the new search page
    And I check "Include language"
    And I check "Include property"
    And I allow all languages
    And I select "Adjective Degree" from "Properties"
    And I select "Degree Adjective" from "Properties"
    And I press "Search"
    Then I should see "Results"
    And I should see "English"
    And I should see "German"
    And I should see "Adjective Degree" within ".english_property"
    And I should see "Degree Adjective" within ".german_property"
    And I should not see "Spanish"
    And I should not see "Adjective Noun"
