Feature: Working About Rose Page

  As a user of the Wisdom Sun website,
  I want to be able to go to the About Rose page
  And see the title and the about text

Background: on the About Rose page
  Given I am on Admin About Rose
  And I add the text "This is about Rose"

Scenario:
  Given I am on About Rose
  Then I should see "About Rose"
  And I should see "This is about Rose"
