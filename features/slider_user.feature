Feature: Slider images are all present on webpage and navigation works
 
	As a visitor of the Wisdom Sun website,
	So that I can view slider images on the homepage,
	I want to be able to navigate the home page, see the slider images and their names, and be able to click on the image to go to their specified url.

Background: Slider image have been added to database
  Given the following slider images exist:
  | name                 | img_url                            | link                |
  | Lineage              | ./app/assets/images/slider/1.jpg   | lineage             |
  | Articles & Songs     | ./app/assets/images/slider/2.jpg   | articles_and_songs  |
  | Photo Albums         | ./app/assets/images/slider/3.jpg   | albums              |

  And I am on the home page

Scenario: All slider images are on page
  When I am on the home page
  Then the slider image "Lineage" img_url_1 should be on page
	Then the slider image "Articles & Songs" img_url_2 should be on page
	Then the slider image "Photo Albums" img_url_3 should be on page

Scenario: All slider images have names
  When I am on the home page
  Then the slider image "Lineage" name should be on page
	Then the slider image "Articles & Songs" name should be on page
	Then the slider image "Photo Albums" name should be on page

Scenario: Clicking on the link to link leads to correct links
  When I click on "Lineage" link
  	Then I will be on the "Lineage" link
  When I click on "Articles & Songs" link
  	Then I will be on the "Articles & Songs" link
  When I click on "Photo Albums" link
  	Then I will be on the "Photo Albums" link

