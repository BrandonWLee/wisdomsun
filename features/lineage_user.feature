Feature: Downloads should be visible in the Downloads Tab, with the correct pages
 
	As a visitor of the Wisdom Sun website,
	So that I wet my interest in buddhism
	I want to be able to see the lineage of mah buddhist teaches baby.

Background: the database has been seeded
	When the test database has been seeded for lineages test

Scenario: The Lineage page should work
	When I am on the lineages page
	Then I should see "Lineage"
	And I should see "Khenpo Tsültrim Gyamtso Rinpoche"
	And I should see "Chögyam Trungpa Rinpoche"
