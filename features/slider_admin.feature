Feature: Add, remove, or modify slider images

  As an admin
  So that new slider images can be added, old slider images can be deleted, and slider images can be changed
  I want to log in as admin to modify the Slider images that appear on the home page

Background: Slider images have been added to database

  Given the following slider images exist:
  | name                 | img_url     | link          |
  | Lineage              | img_url_1   | fake_url_1    |
  | Articles & Songs     | img_url_2   | fake_url_2    |
  | Photo Albums         | img_url_3   | fake_url_3    |

  And the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And I am logged in as admin
  And I am on the admin slider page

Scenario: Add a slider image
  When I add the slider image:
  | name                 | img_url     | link          |
  | Around the Web       | img_url_4   | aroundtheweb  |
  Then there should be a slider image named "Around the Web"

Scenario: Modify a slider image's link
  When I change the slider image "Around the Web" link to "about"
  Then the slider image "Around the Web" should have a link to "about"

Scenario: Delete a slider image
  When I delete the slider image "Lineage"
  Then there should not be a slider image named "Lineage"

Scenario: When I try to edit a nonexistant slider image
  When I try to edit a slider image with id 10
  Then I should be on the admin slider page
  And I should see "Slider image does not exist"

Scenario: When I try to make slider image with empty name
  When I click on "New Slider Image"
  And I press "Create Slider Image"
  Then I should see "Cannot have empty name"

Scenario: When I change an slider image name to an empty name
  When I change the slider image "Lineage" name to ""
  Then I should be on the admin slider page
  And I should see "Cannot have empty name"

Scenario: When I try to make slider image with empty img_url
  When I click on "New Slider Image"
  And I press "Create Slider Image"
  Then I should see "Cannot have empty image url"

Scenario: When I change an slider image img_url to an empty img_url
  When I change the slider image "Lineage" img_url to ""
  Then I should be on the admin slider page
  Then I should see "Cannot have empty image url"
