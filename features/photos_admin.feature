Feature: Add, remove, or modify photos and albums

  As an admin of the Wisdom Sun website,
  So that I can keep the photos & albums updated,
  I want to be able to remove, create, and update photos & albums.

Background: photos and albums that have been uploaded already
  Given the following photos exist:
  | album_id	| location	| description	|
  | 1		| 1-1.jpg	| close up		|
  | 1		| 1-2.jpg	| meep			|
  | 1		| 1-4.jpg	| album cover	|
  | 2		| 2-1.jpg	| bloop			|

  Given the following album exists:
  | album_cover	| name		| description				|
  | 1-1.jpg     | Retreat	    | Shingle Springs Retreat	|
  | 1-2.jpg     | UK		      | Holiday Cornwall	|
  Given I am logged in as admin
  Given I am on the admin page

Scenario: Create a photo and add it to a new album
  When I click on the admin photo page
  And I click on "New Photo"
  And I upload the photo "1-3.jpg" 
  And I fill in the description "A nice picture"
  And I add a new album named "Nice Picture Album"
  And I click "Create Photo"
  Then there should be a photo with the description "A nice picture"
  And there should be an album with the name "Nice Picture Album"
  And there should be a photo named "A nice picture" in the album "Nice Picture Album"

Scenario: Add a photo to an album through the album page
  When I click on the admin album page
  And I go to the edit page of the album "Retreat"
  And I click on "Add Photo"
  And I upload the photo "1-3.jpg"
  And I fill in the description "A very nice picture"
  And I click "Create Photo"
  Then there should be a photo with the description "A very nice picture"
  And there should be a photo named "A very nice picture" in the album "Retreat"

Scenario: Add a photo to an album through the photo page
  When I click on the admin photo page
  And I click on "New Photo"
  And I upload the photo "1-3.jpg" 
  And I fill in the description "A super nice picture"
  And I add the photo to the album named "Retreat"
  And I click "Create Photo"
  Then there should be a photo with the description "A super nice picture"
  And there should be a photo named "A super nice picture" in the album "Retreat"

Scenario: Delete a photo from an album
  When I click on the admin album page
  And I go to the edit page of the album "Retreat"
  And I delete the photo with description "close up"
  Then there should be no photo with the description "close up" in the album "Retreat"


Scenario: Add a photo to no album
  When I click on the admin photo page
  And I click on "Add photo"
  And I upload the photo "1-4.jpg" 
  And I fill in the description "A picture"
  And I click "Create Photo"
  Then there should be a photo with the description "A picture"

Scenario: Try to add a non picture file as a photo
  When I click on the admin photo page
  And I click on "Add photo"
  And I upload the photo "nonpicture.txt"
  And I click "Create Photo"
  Then I should see an error "Could not create photo: nonpicture.txt is not a photo"

Scenario: When I try to edit a nonexistant photo
  When I try to edit a photo with id 10
  Then I should be on the admin photo page
  And I should see the error "Photo does not exist"
