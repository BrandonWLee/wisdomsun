Feature: Categories for Admin
  As an admin of the Wisdom Sun website,
  So that I can create subsets of pages
  I want to be able to make categories

Background: I am logged in as admin and am on the admin page
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given I am logged in as admin
  Given I am on the admin page

Scenario: Creating a Bad Category
  When I go to the admin categories page
  And I click on "New Category"
  And I press "Create Category"
  Then I should see "Name can't be blank"
  And I should see "Position can't be blank and is not a number"

Scenario: Creating a Category with the same name
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  And I press "Create Category"
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "2"
  And I press "Create Category"
  Then I should see "Refactored name has already been taken"

Scenario: Creating a Category with the same position
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "7"
  And I press "Create Category"
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy2 category"
  When I fill in "category_position" with "7"
  And I press "Create Category"
  Then I should see "Position has already been taken"

Scenario: Creating a Good Category
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  And I press "Create Category"
  Then I should see "Category was successfully created."
  And I should see "testy_category"

Scenario: Creating the About Category
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "About"
  When I fill in "category_position" with "0"
  And I press "Create Category"
  Then I should see "Category was successfully created."
  And I should see "about"

Scenario: Updating a Category
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  And I press "Create Category"
  Then I should see "Category was successfully created."
  And I should see "testy_category"
  When I click on "Edit Category"
  When I fill in "category_name" with "testy category testy"
  And I press "Update Category"
  Then I should see "Category was successfully updated"
  And I should see "testy_category_testy"
