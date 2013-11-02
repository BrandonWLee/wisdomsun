Feature: Contacts Page
	As a User
	In case I want to contact the purveyors of this amazing website
	I want to be able to go to the contact page and unassumingly tell them about my daily life

Scenario: Contacts should render the correct text
	Given I am on the contact page
	Then I should see "Contact Wisdom Sun"
	Then I should see "601 29th Street"
	Then I should see "San Francisco, CA 94131"

Scenario: I should be able to fill in contact submission form
	Given I am on the contact page
	When I fill in "contact_name" with "Akemi Homura"
	When I fill in "contact_email" with "HomuHomuChan17@HappyMahouShoujo.org"
	When I fill in "contact_subject" with "Do you believe in fate?"
	When I fill in "contact_text" with "Eybeybey"
	When I press "Send"
	Then I should be on the contact page
	Then I should see "Information Submitted"