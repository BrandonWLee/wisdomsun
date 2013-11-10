Feature: Categories for Admin
  As an admin of the Wisdom Sun website,
  So that I can create subsets of pages
  I want to be able to make categories

Background: I am logged in as admin and am on the admin page
  Given I am logged in as admin
  Given I am on the admin page

Scenario: Creating a Bad Category
  When I go to the admin categories page
  And I click on "New Category"
  And I click on "Create Category"
  Then I should see "Name can't be blank"
  And I should see "Position can't be blank and is not a number"

Scenario: Creating a Category with the same name
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "2"
  Then I should see "Refactored name has already been taken"

Scenario: Creating a Category with the same position
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "7"
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy2 category"
  When I fill in "category_position" with "7"
  Then I should see "Position has already been taken"

Scenario: Creating a Good Category
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  Then I should see "Category was successfully created."
  And I should see "testy_category"