Feature: Thumbnail size image auto-generate

  As a user,
  So that I can have a smooth experience on the Wisdom Sun website,
  When looking at thumbnails of any images, I don't want to load the whole original image, just a small version.

Background:
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

Scenario: In viewing album index page, see only small version of pics
  Given I am on the albums page
  Then I should see the medium version of all the album covers
        
Scenario: In viewing photos page of an album, see only small version of pics
  Given I am on the albums page
  When I click on "Retreat" on the albums page
  Then I should see the medium version of all the photos in the album "Retreat"

Scenario: In the admin albums page, the previews should all be thumbnails
  Given I am on the admin albums page
  Then I should see the small version of all the album covers

Scenario: In the admin photos page, the previews of album covers should be thumbnails
  Given I am on the admin photos page
  Then I should see the small version of all the photos

