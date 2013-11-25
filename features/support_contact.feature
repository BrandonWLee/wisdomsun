Feature: Support and Contact page
  As an admin of the Wisdom Sun website,
  So that my students can support us via money or words,
  I want them to be able to donate money or contact us via the website.

Scenario: Accessing Support should lead to the Donations Page
	Given I am on the support page
	Then I should see "Support"
	And I should see "Donation"
	And I should see "Make a Donation by Check"
	And I should see "Make a Donation Online with PayPal"

Scenario: Contacts should render the correct text
	Given I am on the contact page
	Then I should see "Contact"
	And I should see "601 29th Street"
	And I should see "San Francisco, CA 94131"

Scenario: I should be able to fill in contact submission form
	Given I am on the contact page
	When I fill in "contact_name" with "Akemi Homura"
	And I fill in "contact_email" with "HomuHomuChan17@HappyMahouShoujo.org"
	And I fill in "contact_subject" with "Do you believe in fate?"
	And I fill in "contact_text" with "Eybeybey"
	And I press "Send"
	Then I should be on the contact page
	And I should see "Information submitted"

Scenario: Valid email must be filled in
	Given I am on the contact page
	When I fill in "contact_name" with "Lemongrab"
	And I fill in "contact_email" with "this_is_an_email"
	And I fill in "contact_subject" with "UNACCEPTABLE!!!"
	And I fill in "contact_text" with "Lemon kingdom"
        When I press "Send"
        Then I should be on the contact page
        But I should see "Error, you must enter a valid email address to submit"

Scenario: Forms must be filled in
	Given I am on the contact page
        When I press "Send"
        Then I should be on the contact page
        But I should see "Error, you must fill in the whole form to submit"

  
