Feature: events are all present on the webpage and navigation works
  
  As a visitor of the Wisdom Sun Website,
  So that I can view that events are on sale,
  I want to be able to navigate the events page,
  and be able to see the events and their descriptions

Background: events have been added to the database
  Given the following events exist:
    | name      | date | description | location | time |
    | Meditation| Sept | yoga        | sf       | 6pm  |
    | Retreat   | Oct  | fun fun fun | cruz     | 5pm  |

  And I am on the events page

Scenario: event names are on the page
  When I am on the events page
  Then I should see "Meditation" 
  Then I should see "Retreat"

Scenario: clicking on event name leads to description 
  When I am on the events page
  And I follow "Meditation"
    Then I should see description for "Meditation"
    And I follow "Back to event list"
    Then I should be on the events page
  And I follow "Retreat"
    Then I should see description for "Retreat"

