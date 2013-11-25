Feature: Categories for Users
  As a user of the Wisdom Sun website,
  So that I can view categories of pages
  I want to be able to navigate to differen categories
  and see its contents.

Background: Create categories.
  Given the following categories exist:
  | name		| position	| refactored_name	|
  |	Teachings	| 0			| teachings			|
  | Resources	| 1			| resources			|
  
  Given the following other_pages exist:
  | category_id | title						| refactored_title			| body				|
  | 1			| Teachings of Buddha I	 	| teachings_buddha_i		| "Filler text"		|
  | 1			| Life of Buddha			| teachings_buddha_ii		| "Filler text2"	|
  | 2			| Videos					| videos					| "Filler text3" 	|
  | 2			| Mediation Music			| mediation_music			| "Filler text4"	|

@javascript
Scenario: Can see contents of each category
Given I am on the home page
When I hover over the categories tab on the menu bar
Then I should see "Teachings" 
When I click on "Teachings"
Then I should see "Teachings of Buddha I"
And I should not see "Videos"

Scenario: Can access page contents within categories
Given I am on the home page
When I click on "Other"
And I click on "Teachings of Buddha I"
Then I see "Teachings of Buddha I" and its contents on the page.
When I click on "Other"
And I click on "Life of Buddha"
Then I see "Teachings of Buddha I" and its contents on the page.
