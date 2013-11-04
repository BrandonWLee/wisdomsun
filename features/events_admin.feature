Feature: add, remove, or modify events

  As an admin
  So that new events can be added, old events can be deleted, and event information can be updated
  I want to login as as admin to modify the Events page

Background: events have been added to database

  Given the following events exist:
    | name       | date | description | location | time |
    | Meditation | Sept | relaxing    | sf       | 6pm  |
    | Retreat    | Oct  | fun fun fun | s cruz   | 8pm  |
    
  And the following users are admin:
    | email               | password |
    | admin@wisdomsun.org | password |

  And I am logged in as admin
  And I am on the admin events page

Scenario: add an event
  When I add the event: 
    | name          | date | description | location | time |
    | How to be Man | Nov  | By Shensen  | apt      | 3am  |
  Then there should be an event called "How to be Man"

Scenario: modify an event
  When I change the "Meditation" description to "Yoga"
  Then the event "Meditation" should have the description "Yoga"

Scenario: delete an event
  When I delete the event "Retreat"
  Then there should not be an event called "Retreat"

Scenario: When I try to edit a nonexistant event
  When I try to edit a event with id 10
  Then I should be on the admin events page
  And I should see the error "Event does not exist"

Scenario: When I change an event title to an empty title
  When I change the "Meditation" title to ""
  Then I should be on the admin events page
  And I should see the error "Cannot have empty title"

