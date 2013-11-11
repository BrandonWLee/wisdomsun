Feature: Static Pages
  As an admin of the Wisdom Sun website,
  So that I can create any pages I want
  I want to be able to make other pages in a category

Background: Setting up Categories
  Given I am logged in as admin
  Given I am on the admin page
  When I go to the admin categories page
  And I click on "New Category"
  When I fill in "category_name" with "testy category"
  When I fill in "category_position" with "1"
  Then I should see "Category was successfully created."
  And I should see "testy_category"

Scenario: Creating a Bad Page
  When I click on the admin other pages page
  And I click on "New Other Pages"
  And I click "Create Other pages"
  Then I should see "Title can't be blank"

Scenario: Creating an Already Taken Page Name
  When I click on the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy_category" from "other_pages_category_id"
  And I click "Create Other pages"
  When I click on the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy_category" from "other_pages_category_id"
  And I click "Create Other pages"
  Then I should see "Title can't be blank"

Scenario: Creating a Good Page
  When I click on the admin other pages page
  And I click on "New Other Pages"
  And I fill in "other_pages_title" with "testy title"
  And I select "testy_category" from "other_pages_category_id"
  And I click "Create Other pages"
  Then I should see "Other pages was successfully created"