Feature: Working website
:
  As a user of the Wisdom Sun website,
  I want to be able to go to the homepage
  And see the photo slider, tabs for navigation, events, and about us sections

Background: on the homepage
  Given I am on the homepage

Scenario: navigate to About Us (tab)
  When I press the About tab
    Then I should be on About

Scenario: navigate to About U
  When I press "About Us"
    Then I should be on About

Scenario: navigate to Downloads
  When I press the Downloads tab
    Then I should be on Downloads

Scenario: navigate to Books
  When I press the Books tab
    Then I should be on Books

Scenario: navigate to Bulletin
  When I press the Bulletin tab
    Then I should be on Bulletin

Scenario: navigate to Contact
  When I press the Contact tab
    Then I should be on Contact

Scenario: navigate to Support
  When I press the Support tab
    Then I should be on Support

Scenario: navigate to Events (tab)
  When I press the Events tab
    Then I should be on Events

Scenario: navigate to Events
  When I follow "Events"
    Then I should be on Events

Scenario: navigate to Around the Web
  When I follow "Around the Web"
    Then I should be on Around the Web

Scenario: seeing all elements
  Then I should see element Slider
  And I should see element Events
  And I should see element Around the Web
  And I should see element About Us 
  And I should see element Home tab
  And I should see element About tab
  And I should see element Downloads tab
  And I should see element Books tab
  And I should see element Bulletin tab
  And I should see element Contact tab
  And I should see element Support tab
  And I should see element Events tab

