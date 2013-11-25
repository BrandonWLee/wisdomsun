Feature: Slider images are all present on webpage and navigation works
 
	As a visitor of the Wisdom Sun website,
	So that I can view slider images on the homepage,
	I want to be able to navigate the home page, see the slider images and their names, and be able to click on the image to go to their specified url.

Background: Slider has been added to database
  Given the following sliders exist:
  | name                 | picture                  | link                |
  | Lineage              | ./app/assets/images/sliders/1.jpg   | categories/2             |
  | Articles & Songs     | ./app/assets/images/sliders/2.jpg   | otherPages/8  |
  | Photo Albums         | ./app/assets/images/sliders/3.jpg   | albums              |

  And I am on the home page

Scenario: All sliders are on page
  When I am on the home page
  Then the slider "Lineage" picture should be on page
	Then the slider "Articles & Songs" picture should be on page
	Then the slider "Photo Albums" picture should be on page

Scenario: All sliders have names
  When I am on the home page
  Then the slider "Lineage" name should be on page
	Then the slider "Articles & Songs" name should be on page
	Then the slider "Photo Albums" name should be on page

Scenario: Clicking on the link to link leads to correct links
  When I click on "Lineage" link
  	Then I should see "Lineage: An Introduction"
  When I click on "Articles & Songs" link
  	Then I should see "Articles, Songs, & More"
  When I click on "Photo Albums" link
  	Then I should see "Albums"

