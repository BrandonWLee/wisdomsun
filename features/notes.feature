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
  |I am the man     | Jeff    |
  |I love you       |         |

  And I am logged in as admin
  And I am on the admin quotes page

Scenario: add a quote
  When I add the quotes:
    |quote            | source  |
    |Wow     | Jose    |
  Then the following quotes should exist:
  |quote|source|
  |Wow|Jose|
Scenario: modify a quote
  When I change the quote "I am the man" to have quote "I am the woman"
  Then there should not be a quote "I am the man"
  Then the following quotes should exist:
  |quote|source|
  |I am the woman|Jeff|

Scenario: delete a quote
  When I delete the quote "I love you"
  Then there should not be a quote "I love you"

Scenario: try to edit a nonexistent quote
  When I try to edit a quote with id 10
  And I should not see "Edit Quote"

Scenario: create empty quote 
  When I click on "New Quote"
  And I press "Create Quote"
  Then I should see "Quote can't be blank"

Scenario: modify quote to empty
  When I change the quote "I love you" to have quote ""
  And I should see "Quote can't be blank"

Scenario: should see latest quote on front page
  When I am on the home page
  Then I should see "I love you"
  And I should not see "I am the man"

Scenario: dedicated page should have all
  When I am on the quotes page
  Then I should see the quotes:
    |quote            | source  |
    |I am the man     | Jeff    |
    |I love you       |         |






