Feature: login to the website with admin privileges 

  As an admin
  So that viewers are updated with new events or other information
  I want to log in as admin to change or add content on the website

Background:
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given the following users are not admin:
  |email              | password|
  |user@wisdomsun.org| password|

Scenario: login using the admin login
  Given I am on the Wisdom Sun homepage
  And I am not logged in
  When I follow "Sign in"
  And I login with the correct admin login information
  Then I should be on the admin panel

Scenario: login using nonadmin login should bring me back to the home page
  Given I am on the Wisdom Sun homepage
  And I am not logged in
  When I follow "Sign in"
  And I login with the incorrect admin login information
  Then I should be on the homepage

Scenario: logout should bring me back to homepage
  Given I am logged in as admin
  And I am on the admin page
  When I follow "Logout"
  Then I should be on the Wisdom Sun homepage
