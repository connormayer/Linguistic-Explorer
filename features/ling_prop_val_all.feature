Feature: Search All Ling Prop Value Pair

  Background:
    Given I am a visitor
    And the group "Syntactic Structures"
    And the following "Syntactic Structures" lings:
    | name        | depth |
    | English     | 0     |
    | Spanish     | 0     |
    | German      | 0     |
    And the following "Syntactic Structures" properties:
    | property name     | ling name   | prop val    | category | depth |
    | Adjective Noun    | English     | yes         | Grammar  | 0     |
    | Adjective Noun    | Spanish     | yes         | Grammar  | 0     |
    | Adjective Degree  | English     | yes         | Grammar  | 0     |
    | Adjective Degree  | German      | no          | Grammar  | 0     |
    | Degree Adjective  | German      | yes         | Grammar  | 0     |
    | Degree Adjective  | Spanish     | no          | Grammar  | 0     |

  Scenario: Visitor selects two value pairs
    When I go to the Syntactic Structures search page
    And I select "Adjective Noun: yes" from "Grammar Value Pairs"
    And I select "Adjective Degree: yes" from "Grammar Value Pairs"
    And I choose "All" within "#grammar_value_pairs"
    And I press "Search"
    Then I should see "Results"
    And the following scenario is pending
    Then I should see the following search results:
    | Lings         | Properties        | Value     |
    | English       | Adjective Noun    | yes       |
    | English       | Adjective Degree  | yes       |
    And I should not see "Spanish"
    And I should not see "German"
    And I should not see "no"
    And I should not see "Degree Adjective"
