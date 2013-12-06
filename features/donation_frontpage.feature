Feature: clickable donation link on the front page
  As an admin
  So that I can raise money for my awesome website
  I want a link on the frontpage to go to the donations page

Background: The working website has been set up
	Given the database has been entirely seeded

Scenario: Donation link on the front page
	Given I am on the home page
	When I click on "Donations"
	Then I should be on the support page