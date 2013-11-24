Feature: The Downloads Pages are Editable Using Other Pages
 
	As the admin of the wisdom sun website
	So that I can give viewers more detail regarding buddhism
	I want to be able to add downloads and other resources to the website.

Background: Test database has been seeded and logged in as admin
	When the test database has been seeded for downloads test
  And I am logged in as admin
  And I am on the admin articles, songs and more edit page

Scenario: Linking files in admin are visible
	When I fill in "other_page_body" with "<a href='http://www.google.com'> I art thou, Persona! </a>"
	And I press "Update Other page"
	When I am on the articles, songs and more page
	Then I should see "I art thou, Persona!"
	And I should be able to click I art thou, Persona!
