Feature: Static Pages
  As an admin of the Wisdom Sun website,
  So that I can create any pages I want
  I want to be able to make other pages in a category

Background: Setting up Categories
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given I am logged in as admin
  Given I am on the admin page
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  And I press "Create Category"
  Then I should see "Category was successfully created."
  And I should see "testy_category"

Scenario: Creating a Bad Page
  When I go to the admin other pages page
  And I click on "New Other Pages"
  And I press "Create Other pages"
  Then I should see "Title can't be blank"

Scenario: Creating an Already Taken Page Name
  When I go to the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy category" from "other_pages_category_id"
  And I press "Create Other pages"
  When I go to the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy category" from "other_pages_category_id"
  And I press "Create Other pages"
  Then I should see "Refactored title has already been taken"

Scenario: Creating a Good Page
  When I go to the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy category" from "other_pages_category_id"
  And I press "Create Other pages"
  Then I should see "Other pages was successfully created"

Scenario: Updating a Page
  When I go to the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy category" from "other_pages_category_id"
  And I press "Create Other pages"
  Then I should see "Other pages was successfully created"
  When I click on "Edit Other Pages"
  And I fill in "other_pages_title" with "again again"
  And I press "Update Other pages"
  Then I should see "Other pages was successfully updated"
  And I should see "again_again"