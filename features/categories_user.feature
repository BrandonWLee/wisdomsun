Feature: Categories for Users
  As a user of the Wisdom Sun website,
  So that I can view categories of pages
  I want to be able to navigate to differen categories
  and see its contents.

Background: Create categories.
  Given the following categories exist:
  | name		| position	| refactored_names	|
  |	About		| 0			| about				|
  | Downloads	| 1			| downloads			|
  
  Given the following other_pages exist:
  | category_id | title					| refactored_title		|
  | 1			| About Ari Goldfield 	| about_ari_goldfield	|
  | 1			| About Rose Goldfield	| about_rose_goldfield	|
  | 2			| Videos				| videos				|
  | 2			| Mediation Music		| mediation_music		| 

Scenario: Can see contents of each category
Given I am on the home page
When I hover over "Other" on the menu bar
And I hover over "About"
Then I should see "About Ari Goldfield" 
And I should see "About Rose Goldfield"
And I should not see "Videos"

Scenario: Can access pages within categories
Given I am on the home page
When I hover over "Other" on the menu bar
And I hover over "About"
And I click over "About Ari Goldfield"
Then I should be on the "About Ari Goldfield" page.
When I hover over "About"
And I click over "About Rose Goldfield"
Then I should be on the "About Rose Goldfield" page.
