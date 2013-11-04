Feature: About Ari and Rose, the class, and the lineage
  As an admin of the Wisdom Sun website,
  So that my students can learn more about the owners, the classes, and the history of Buddhist meditation,
  I want them to be able to view the pages that have that information.

Scenario: About page
  Given I am on the admin About page
  When I fill in the About body with "This is about Wisdom Sun" 
  And I am on the About page
  Then I should see "About"
  And I should see "This is about Wisdom Sun"

Scenario: About Ari page
  Given I am on the admin About Ari page
  When I add the text "This is about Ari"
  And I am on About Ari page
  Then I should see "About Ari"
  And I should see "This is about Ari"

Scenario: on the About Rose page
  Given I am on the admin About Rose page
  When I add the text "This is about Rose"
  And I am on About Rose page
  Then I should see "About Rose"
  And I should see "This is about Rose"

Scenario: Lineage page
  Given I am on the admin Lineage page
  When I add the text "Khenpo Tsültrim Gyamtso Rinpoche"
	And I am on the Lineage page
	Then I should see "Lineage"
	And I should see "Khenpo Tsültrim Gyamtso Rinpoche"

Scenario: Teaching Series for Purchase
  Given I am on the admin Teaching Series for Purchase page
  When I add the text "This is the teaching series"
  And I am on the Teaching Series for Purchage page
  Then I should see "Teaching Series for Purchase"
  And I should see "This is the teaching series"

Scenario: Personal Sessions
  Given I am on the admin Personal Sessions page
  When I add the text "This is the personal sessions"
  And I am on the Personal Sessions page
  Then I should see "Personal Sessions"
  And I should see "This is the personal sessions"

