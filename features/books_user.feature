Feature: books are all present on webpage and navigation works
 
	As a visitor of the Wisdom Sun website,
	So that I can view what books are on sale,
	I want to be able to navigate the books page 
	and browse through to see the author, short description, and price of each book.

Background: books have been added to database
  Given the following books exist:
  | title				| author		| price		 	| purchase_url		| publish_date
  | Meditation 			| Brandon Lee	| 15.00			| fake_url			| 12-Dec-2004
  | Beyond the Sunrise	| Jeff Zhan		| 20.00			| fake_url_2		| 4-May-2010
  | Cultivating the Soul| Kevin Dip		| 13.50			| fake_url_3		| 23-Jan-2013
  

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
  When I click on Meditation book image
  	Then I should be on the Meditation image popup page
  When I click on Beyond the Sunrise book image
  	Then I should be on the Beyond the Sunrise image popup page
  When I click on Cultivating the Soul image
  	Then I should be on the Cultivating the Soul image popup page

Scenario: clicking on the link to purchase page leads to correct links
  When I click on Meditation purchase link
  	Then I should be on the Meditation purchase link
  When I click on the Beyond the Sunrise purchase link
  	Then I should be on the Beyond the Sunrise purchase link
  When I click on the Cultivating the Soul purchase link
  	Then I should be on the Cultivating the Soul purchase link

Scenario: clicking on the title leads to detailed description of the book
  When I click on Meditation 
  	Then I should see more details about Meditation
  When I click on Beyond the Sunrise
  	Then I should see more details about Beyond the Sunrise
  When I click on Cultivating the Soul
  	Then I should see more details about Cultivating the Soul  	