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
  And I fill in "Name" with "Party"
  And I press "Create Album"
  Then there should be an album with the name "Party"
  
Scenario: Rename an album
  When I click on the admin albums page
  And I check out the edit page of the album "Retreat"
  And I fill in "Name" with "Expedition"
  And I press "Update Album"
  Then there should be an album with the name "Expedition"
  And there should not be an album with the name "Retreat"
  
Scenario: Delete an album with photos in the album and all the photos
  When I click on the admin albums page
  And I click "Delete with Photos" for the album "Retreat"
  Then there should not be an album with the name "Retreat"
  And there should not be a photo with the description "close up"
  And there should not be a photo with the description "meep"
  And there should not be a photo with the description "album cover"
  And there should be a photo with the description "bloop"
  
Scenario: Delete an album with photos in the album but not the photos
  When I click on the admin albums page
  And I click "Delete" for the album "Retreat"
  Then there should not be an album with the name "Retreat"
  But there should be a photo with the description "close up"
  But there should be a photo with the description "meep"
  But there should be a photo with the description "album cover"
  But there should be a photo with the description "bloop"
  
