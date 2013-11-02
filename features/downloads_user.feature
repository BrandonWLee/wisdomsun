Feature: Downloads

	As a user
	So that I can download free music and pdf's about Buddhist teachings
	I want to be able to access the Downloads page

Scenario: Free Downloads has sections for different teachings
	Given I am on the free downloads page
	Then I should see "Free Downloads"
	And I should see "About Dharma Teachings"
	And I should see "Stars of Wisdom Teachings"

Scenario: Clicking an mp3 file link
	Given I am on the free downloads page
	When I click "Some sound byte"
	Then I should be be on a new page
        And I should see a music player
