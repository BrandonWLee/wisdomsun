Feature: Working website

  As a user of the Wisdom Sun website,
  I want to be able to go to the homepage
  And see the photo slider, tabs for navigation, events, and about us sections

Scenario: navigate to About Us (tab)
  Given I am on the homepage
  And I press About tab
  Then I should be on About

Scenario: navigate to About Us
  Given I am on the homepage
  And I press Read More
  Then I should be on About

Scenario: navigate to Downloads
  Given I am on the homepage
  And I press Downloads tab
  Then I should be on Downloads

Scenario: navigate to Books
  Given I am on the homepage
  And I press Books tab
  Then I should be on Books

Scenario: navigate to Bulletin
  Given I am on the homepage
  And I press Bulletin tab
  Then I should be on Bulletin

Scenario: navigate to Contact
  Given I am on the homepage
  And I press Contact tab
  Then I should be on Contact

Scenario: navigate to Events (tab)
  Given I am on the homepage
  And I press Events tabs
  Then I should be on Events

Scenario: navigate to Events
  Given I am on the homepage
  And I press Events
  Then I should be on Events

Scenario: navigate to Around the Web
  Given I am on the homepage
  And I press Around the Web
  Then I should be on Around the Web

Scenario: seeing all elements
  Given I am on the homepage
  Then I should see Slider
  And I should see Events
  And I should see Around the Web
  And I should see About Us 
  And I should see Home tab
  And I should see About tab
  And I should see Downloads tab
  And I should see Books tab
  And I should see Bulletin tab
  And I should see Contact tab
  And I should see Events tab

