Feature: books are all present on webpage and navigation works
 
	As a visitor of the Wisdom Sun website,
	So that I can view what books are on sale,
	I want to be able to navigate the books page 
	and browse through to see the author, short description, and price of each book.

Background: books have been added to database
  Given the following books exist:
  | title				| author		| purchase_url		| description	|
  | Meditation 			| Brandon Lee	| fake_url			| bloop			|
  | Beyond the Sunrise	| Jeff Zhan		| fake_url_2		| bleep			|
  | Cultivating the Soul| Kevin Dip		| fake_url_3		| meep			|
  

  And I am on the books page

Scenario: all book titles are on page
  When I am on the books page
  # your steps here
  	Then I should see "Meditation"
	Then I should see "Beyond the Sunrise"
	Then I should see "Cultivating the Soul"

Scenario: all authors are on page
  When I am on the books page
  	Then I should see "Meditation" before "Brandon Lee"
  	Then I should see "Beyond the Sunrise" before "Jeff Zhan"
  	Then I should see "Cultivating the Soul" before "Kevin Dip"

Scenario: all prices are on page
  When I am on the books page
  	Then I should see "Meditation" before "$15.00"
  	Then I should see "Beyond the Sunrise" before "$20.00"
  	Then I should see "Cultivating the Soul" before "$13.50"

Scenario: all the links_to_purchase are on page
  When I am on the books page
  	Then I should see "Meditation" before "12-Dec-2004"
  	Then I should see "Beyond the Sunrise" before "4-May-2010"
  	Then I should see "Cultivating the Soul" before "23-Jan-2013"

Scenario: clicking on book image leads to larger image
  When I click on "Meditation" book image
  	Then I should be on the "Meditation" image popup page
  When I click on "Beyond the Sunrise" book image
  	Then I should be on the "Beyond the Sunrise" image popup page
  When I click on "Cultivating the Soul" image
  	Then I should be on the "Cultivating the Soul" image popup page

Scenario: clicking on the link to purchase page leads to correct links
  When I click on "Meditation" purchase link
  	Then I should be on the "Meditation" purchase link
  When I click on "Beyond the Sunrise" purchase link
  	Then I should be on the "Beyond the Sunrise" purchase link
  When I click on "Cultivating the Soul" purchase link
  	Then I should be on the "Cultivating the Soul" purchase link
