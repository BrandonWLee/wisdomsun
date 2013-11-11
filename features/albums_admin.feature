Feature: Add, remove, or modify albums

  As an admin of the Wisdom Sun website,
  So that I can keep the albums updated,
  I want to be able to remove, create, and update albums.

Background: photos and albums that have been uploaded already
  Given the following photos exist:
  | album_id	| picture	| description	|
  | 1		| ./app/assets/images/photos/1-1.jpg	| close up		|
  | 1		| ./app/assets/images/photos/1-2.jpg	| meep			|
  | 1		| ./app/assets/images/photos/1-4.jpg	| album cover	|
  | 2		| ./app/assets/images/photos/2-1.jpg	| bloop			|

  Given the following albums exist:
  | album_cover	| name		| description				|
  | ./app/assets/images/photos/1-1.jpg     | Retreat	    | Shingle Springs Retreat	|
  | ./app/assets/images/photos/1-2.jpg     | UK		      | Holiday Cornwall	|

  And the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given I am logged in as admin
  Given I am on the admin page

Scenario: Add an album
  When I click on the admin albums page
  And I click on "New Album"
  And I fill in the name "Party"
  And I click "Create Album"
  Then there should be an album with the name "Party"
  
Scenario: Rename an album
  When I click on the admin albums page
  And I go to the edit page of the album "Retreat"
  And I fill in the name "Expedition"
  And I click "Update Album"
  Then there should be an album with the name "Expedition"
  And there should not be an album with the name "Retreat"
  
Scenario: Delete an album with photos in the album and all the photos
  When I click on the admin albums page
  And I go to the album "Retreat"
  And I check "Delete all photos"
  And I click "Delete Album"
  Then there should be no album named "Retreat"
  And there should be no photo with the description "close up"
  And there should be no photo with the description "meep"
  And there should be no photo with the description "album cover"
  And there should be no photo with the description "bloop"

Scenario: When I try to edit a nonexistant album
  When I try to edit a album with id 10
  Then I should be on the admin albums page
  And I should see the error "Album does not exist"
  
Scenario: Delete an album with photos in the album but not the photos
  When I click on the admin albums page
  And I go to the album "Retreat"
  And I check "Don't delete photos"
  And I click "Delete Album"
  Then there should be no album named "Retreat"
  But there should be a photo with the description "close up"
  But there should be a photo with the description "meep"
  But there should be a photo with the description "album cover"
  But there should be a photo with the description "bloop"
  
