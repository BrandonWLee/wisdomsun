Feature: Working website

  As a user of the Wisdom Sun website,
  I want to be able to go to the homepage
  And see the photo slider, tabs for navigation, events, and about us sections

Scenario: navigate to About Us
Given I am on the homepage
And I press Read More
Then I should be on About Us 
