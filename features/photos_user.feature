Feature: 
	As a visitor of the Wisdom Sun website,
	So that I can view albums and photos from past events,
	I want to look at all of the past albums and individual 
	photos uploaded.

Background: Create albums and add photos to them
  Given the following photos exist:
  | album_id	| location	 | description	|
  | 1		| 1-1.jpg	| close up		|
  | 1		| 1-2.jpg	| meep			|
  | 1		| 1-4.jpg	| album cover	|
  | 2		| 2-1.jpg	| bloop			|

  Given the following album exists:
  | album_cover	| name		| description				|
  | 1-1.jpg     | Retreat	    | Shingle Springs Retreat	|
  | 1-2.jpg     | UK		      | Holiday Cornwall	|
  And I am on the albums page.
 
Scenario: all the album titles are on the page.
  Given I am the albums page
  I should see the album titles "Retreat" and "UK" on the page.

Scenario: all the album covers are on the page.	
  Given I am on the albums page
  I should see the album covers of "Retreat" and "UK" on the page. 

Scenario: all the album descriptions are on the page.
  Given I am on the albums page
  Then I should see the album descriptions of "Retreat" and "UK" on the page.
  
Scenario: all the pictures are in a specific album's page
  Given I am on the albums page
  Then I click on "Retreat"
  Then I should see "Retreat Photos"
  Then I should see all of the photos in the album "Retreat".

Scenario: clicking on a picture results in it popping up
  Given I am on the albums page
  Then I click on "Retreat"
  Then I click on the first picture
  Then I should see a popup of the first picture.
  
