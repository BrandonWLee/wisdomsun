Feature: Browsing through photos and albums
	As a visitor of the Wisdom Sun website,
	So that I can view albums and photos from past events,
	I want to look at all of the past albums and individual 
	photos uploaded.

Background: Create albums and add photos to them
  Given the following photos exist:
  | album_id	| picture	 							| description	|
  | 1			| ./app/assets/images/photos/1-1.jpg	| close up		|
  | 1			| ./app/assets/images/photos/1-2.jpg	| meep			|
  | 1			| ./app/assets/images/photos/1-4.jpg	| album cover	|
  | 2			| ./app/assets/images/photos/2-1.jpg	| bloop			|

  Given the following albums exist:
  | album_cover								| name				| description				|
  | ./app/assets/images/photos/1-1.jpg     	| Retreat	    	| Shingle Springs Retreat	|
  | ./app/assets/images/photos/1-2.jpg    	| UK		      	| Holiday Cornwall			|
  
  And I am on the albums page.

Scenario: all the album titles are on the page.
  Given I am on the albums page
  Then I should see "Albums"
  And I should see the album titles "Retreat" and "UK" on the page.

Scenario: all the album covers are on the page.	
  Given I am on the albums page
  Then I should see the album covers of "Retreat" and "UK" on the page. 

Scenario: all the album descriptions are on the page.
  Given I am on the albums page
  When I click on "Retreat"
  Then I should see the album descriptions of "Retreat".
  When I click on "Back to Albums" on the albums page
  And I click on "UK"
  Then I should see the album descriptions of "UK".
  
Scenario: all the pictures are in a specific album's page
  Given I am on the albums page
  When I click on "Retreat"
  Then I should see "Photos"
  Then I should see all of the photos in the album "Retreat".

Scenario: trying to view a album that doesn't exist
  Given I am on the photos page
  When I try to view the album with id 10
  Then I should be on the albums page
  And I should see "Album does not exist"