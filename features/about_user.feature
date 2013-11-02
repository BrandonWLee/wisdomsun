Feature: Working About Page

  As a user of the Wisdom Sun website,
  I want to be able to go to the About page
  And see the title and the about text

Background: on the About page
  Given I am on Admin About
  And I add the text "This is about Wisdom Sun"

Scenario:
  Given I am on About
  Then I should see "About"
  And I should see "This is about Wisdom Sun"
