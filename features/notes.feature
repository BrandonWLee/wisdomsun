Feature: Notes page and on Homepage
  As an admin,
  So that my users can be enlightened by some notes and quotes easily,
  I want them to be able to see the latest one on the front page, and a page full of old ones.

Background:
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given the following users are not admin:
  |email              | password|
  |user@wisdomsun.org| password|

  Given the following quotes exist:
  |quote            | source  |
  |I am the man     | jeff    |
  |I love you       |         |

  And I am logged in as admin
  And I am on the admin quotes page

Scenario: add a quote
  When I add the quote:
    |quote            | source  |
    |Wow     | Jose    |
  Then there should be a quote called "Wow"
  And it should have a source "Jose"
Scenario: modify a quote
  When I change the quote "I am the man" to have title "I am the woman"
  Then there should not be a quote "I am the man"
  And there should be a quote "I am the woman"
  And it should have a source "Jeff"

Scenario: delete a quote
  When I delete the quote "I love you"
  Then there should not be a quote "I love you"

Scenario: try to edit a nonexistent quote
  When I try to edit the quote with id 10
  Then I should be on the admin quotes page
  And I should see "Quote does not exist"

Scenario: create empty quote 
  When I click on "New Quote"
  And I press "Create Quote"
  Then I should see "Cannot have empty quote"

Scenario: modify quote to empty
  When I change the quote "I love you" to have quote ""
  Then I should be on the edit page for quote "I love you"
  And I should see "Cannot have empty quote"

Scenario: should see latest quote on front page
  When I am on the home page
  Then I should see "I love you"
  And I should not see "I am the man"

Scenario: dedicated page should have all
  When I am on the quotes page
  Then I should see the quotes:
    |quote            | source  |
    |I am the man     | jeff    |
    |I love you       |         |






