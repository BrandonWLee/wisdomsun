Feature: The Downloads Pages are Editable Using Other Pages
 
	As the admin of the wisdom sun website
	So that I can tell people about my lineage
	I want to be able to add to my lineage.

Background: Test database has been seeded and logged in as admin
	When the test database has been seeded for lineages test
  And I am logged in as admin
  And I am on the lineages edit page

Scenario: Linking files in admin are visible
	When I fill in "other_page_body" with "I art thou, Persona!"
	And I press "Update Other page"
	When I am on the lineages page
	Then I should see "I art thou, Persona!"
