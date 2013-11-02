Feature: Donations and Support

	As a user
	So that I can help support this awesome website
	I want to be able to donate via paypal

Scenario: Accessing Support should lead to the Donations Page
	Given I am on the support page
	Then I should see "Support Wisdom Sun"
	Then I should see "Donation"
	Then I should see "Make a Donation by Check"
	Then I should see "Make a Donation Online with Paypal"

Scenario: Clicking the Paypal link
	Given I am on the support page
	When I press "Donate by Paypal"
	Then I should be able to donate by Paypal