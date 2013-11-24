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
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "About"
  When I fill in "category_position" with "2"
  And I press "Create Category"
  Then I should see "Category was successfully created."
  And I should see "about"

Scenario: Creating a Bad Page
  When I go to the admin other pages page
  And I click on "New Other Page"
  And I press "Create Other page"
  Then I should see "Title can't be blank"

Scenario: Creating an Already Taken Page Name
  When I go to the admin other pages page
  And I click on "New Other Page"
  And I fill in "other_page_title" with "testy title"
  And I select "testy category" from "other_page_category_id"
  And I press "Create Other page"
  When I go to the admin other pages page
  And I click on "New Other Page"
  And I fill in "other_page_title" with "testy title"
  And I select "testy category" from "other_page_category_id"
  And I press "Create Other page"
  Then I should see "Refactored title has already been taken"

Scenario: Creating a Good Page
  When I go to the admin other pages page
  And I click on "New Other Page"
  And I fill in "other_page_title" with "testy title"
  And I select "testy category" from "other_page_category_id"
  And I press "Create Other page"
  Then I should see "Other page was successfully created"

Scenario: Creating the About Ari Goldfield Page
  When I go to the admin other pages page
  And I click on "New Other Page"
  And I fill in "other_page_title" with "About Ari Goldfield"
  And I fill in "other_page_body" with "This is about Ari"
  And I select "About" from "other_page_category_id"
  And I press "Create Other page"
  Then I should see "Other page was successfully created"
  When I go to the about ari goldfield page
  Then I should see "About Ari Goldfield"
  And I should see "This is about Ari"

Scenario: Updating a Page
  When I go to the admin other pages page
  And I click on "New Other Page"
  And I fill in "other_page_title" with "testy title"
  And I select "testy category" from "other_page_category_id"
  And I press "Create Other page"
  Then I should see "Other page was successfully created"
  When I click on "Edit Other Page"
  And I fill in "other_page_title" with "again again"
  And I press "Update Other page"
  Then I should see "Other page was successfully updated"
  And I should see "again_again"
