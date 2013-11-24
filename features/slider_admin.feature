Feature: Add, remove, or modify slider images

  As an admin
  So that new slider images can be added, old slider images can be deleted, and slider images can be changed
  I want to log in as admin to modify the Slider images that appear on the home page

Background: Slider images have been added to database

  Given the following sliders exist:
  | name                 | picture                             | link                |
  | Lineage              | ./app/assets/images/sliders/1.jpg   | lineage             |
  | Articles & Songs     | ./app/assets/images/sliders/2.jpg   | articles_and_songs  |
  | Photo Albums         | ./app/assets/images/sliders/3.jpg   | albums              |

  And the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And I am logged in as admin
  And I am on the admin slider page

Scenario: Add a slider
  When I add the slider:
  | name                 | picture                             | link          |
  | Around the Web       | ./app/assets/images/sliders/3.jpg   | aroundtheweb  |
  Then there should be a slider named "Around the Web"

Scenario: Modify a slider's link
  When I change the slider "Lineage" link to "about"
  Then the slider "Lineage" should have a link to "about"

Scenario: Delete a slider
  When I delete the slider "Lineage"
  Then there should not be a slider named "Lineage"

Scenario: When I try to edit a nonexistant slider
  When I try to edit a slider with id 10
  Then I should be on the admin slider page
  And I should see "Slider does not exist"

Scenario: When I try to make slider with empty name
  When I click on "New Slider"
  And I press "Create Slider"
  Then I should see "Cannot have empty name"

Scenario: When I change an slider name to an empty name
  When I change the slider "Lineage" name to ""
  Then I should be on the admin slider page
  And I should see "Cannot have empty name"

Scenario: When I try to make slider with empty picture
  When I click on "New Slider"
  And I press "Create Slider"
  Then I should see "Cannot have empty picture"
