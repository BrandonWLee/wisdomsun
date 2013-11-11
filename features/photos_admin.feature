Feature: Add, remove, or modify photos

  As an admin of the Wisdom Sun website,
  So that I can keep the photos updated,
  I want to be able to remove, create, and update photos.

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

#Scenario: Create a photo and add it to a new album
#  When I am on the admin photos page
#  And I click on "New Photo"
#  And I upload the photo "./app/assets/images/photos/1-3.jpg" 
#  And I fill in the description "A nice picture"
#  And I add a new album named "Nice Picture Album"
#  And I press "Create Photo"
#  Then there should be a photo with the description "A nice picture"
#  And there should be an album with the name "Nice Picture Album"
#  And there should be a photo with the description "A nice picture" in the album "Nice Picture Album"
#
#Scenario: Add a photo to an album through the album page
#  When I am on the admin albums page
#  And I check out the edit page of the album "Retreat"
#  And I click on "Add Photo"
#  And I upload the photo "./app/assets/images/photos/1-3.jpg"
#  And I fill in the description "A very nice picture"
#  And I press "Create Photo"
#  Then there should be a photo with the description "A very nice picture"
#  And there should be a photo with the description "A very nice picture" in the album "Retreat"
#
Scenario: Add a photo to an album through the photo page
  When I am on the admin photos page
  And I click on "New Photo"
  And I upload the photo "./app/assets/images/photos/1-3.jpg" 
  And I fill in "Description" with "A super nice picture"
  And I add the photo to the album named "Retreat"
  And I press "Create Photo"
  Then there should be a photo with the description "A super nice picture"
  And there should be a "A super nice picture" photo in the "Retreat" album 

Scenario: Add a photo to no album
  When I am on the admin photos page
  And I click on "New Photo"
  And I upload the photo "./app/assets/images/photos/1-4.jpg" 
  And I fill in "Description" with "A picture"
  And I press "Create Photo"
  Then there should be a photo with the description "A picture"

Scenario: Try to add a non picture file as a photo, should fail
  When I am on the admin photos page
  And I click on "New Photo"
  And I upload the photo "./app/assets/images/photos/nonpicture.txt"
  And I press "Create Photo"
  Then I should see "is invalid"

