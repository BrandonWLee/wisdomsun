Feature: Working About Ari Page

  As a user of the Wisdom Sun website,
  I want to be able to go to the About Ari page
  And see the title and the about text

Background: on the About Ari page
  Given I am on Admin About Ari
  And I add the text "This is about Ari"

Scenario:
  Given I am on About Ari
  Then I should see "About Ari"
  And I should see "This is about Ari"
