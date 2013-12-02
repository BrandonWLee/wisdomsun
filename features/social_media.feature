Feature: clickable social media links on the front page
  As a user
  So that I can share Wisdom Sun on other social media networks
  I want social media links on the frontpage to go to social media pages

Background: The working website has been set up
	Given the working website has been set up

Scenario: Facebook link on the front page
	Given I am on the home page
	When I click the Facebook Share link
	Then I should be on the Facebook Share page

Scenario: Twitter link on the front page
	Given I am on the home page
	When I click the Twitter Share link
	Then I should be on the Twitter Share page

Scenario: LinkedIn link on the front page
	Given I am on the home page
	When I click the LinkedIn Share link
	Then I should be on the LinkedIn Share page

Scenario: Email link on the front page
	Given I am on the home page
	When I click the Email Share link
	Then I should see "Send Email"
