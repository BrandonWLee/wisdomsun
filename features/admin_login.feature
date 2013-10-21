Feature: login to the website with admin privileges 

  As an admin
  So that viewers are updated with new events or other information
  I want to log in as admin to change or add content on the website

Background: 
  Given that I am on the Wisdom Sun homepage

Scenario: login using the admin login
  When I login with the correct admin login information
  Then I should see the admin page

Scenario: login using nonadmin login should fail
  When I login with the incorrect admin login information
  Then I should be on the homepage
  And I should see the error "Incorrect Login"



