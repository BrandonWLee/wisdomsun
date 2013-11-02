Feature: The Lineage Page
	As a user
	So that I can see the history of the admin
	I want to be able to view their lineage

Scenario: Lineage Page should Contain the Correct Text
	Given I am on the lineage page
	Then I should see "Lineage"
	Then I should see "Khenpo Tsültrim Gyamtso Rinpoche"