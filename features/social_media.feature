Feature: clickable social media links on the front page and other pages
  As a user
  So that I can share Wisdom Sun on other social media networks
  I want social media links on the frontpage to go to social media pages

@javascript
Scenario: Facebook link on the front page
	Given I am on the home page
	Then there should be a Facebook Share link

@javascript
Scenario: Twitter link on the front page
	Given I am on the home page
	Then there should be a Twitter Share link

@javascript
Scenario: Email link on the front page
	Given I am on the home page
	Then there should be a Email Share link
