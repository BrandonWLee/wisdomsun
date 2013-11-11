Feature: books are all present on webpage and navigation works
 
	As a visitor of the Wisdom Sun website,
	So that I can view what books are on sale,
	I want to be able to navigate the books page 
	and browse through to see the author, short description, and price of each book.

Background: books have been added to database
  Given the following books exist:
  | title				| author		| purchase_url		| description	|
  | Meditation 			| Brandon Lee	| books				| bloop			|
  | Beyond the Sunrise	| Jeff Zhan		| books				| bleep			|
  | Cultivating the Soul| Kevin Dip		| books				| meep			|
  

  And I am on the books page

Scenario: all book titles are on page
  When I am on the books page
  # your steps here
  	Then the book title "Meditation" should be on page
	Then the book title "Beyond the Sunrise" should be on page
	Then the book title "Cultivating the Soul" should be on page

Scenario: all authors are on page
  When I am on the books page
  	Then the book title "Meditation" before "Brandon Lee"
  	Then the book title "Beyond the Sunrise" before "Jeff Zhan"
  	Then the book title "Cultivating the Soul" before "Kevin Dip"

Scenario: all the links_to_purchase are on page
  When I am on the books page
  	Then the book title "Meditation" before "12-Dec-2004"
  	Then the book title "Beyond the Sunrise" before "4-May-2010"
  	Then the book title "Cultivating the Soul" before "23-Jan-2013"

Scenario: clicking on the link to purchase page leads to correct links
  When I click on "Meditation" purchase link
  	Then I will be on the "Meditation" purchase link
  When I click on "Beyond the Sunrise" purchase link
  	Then I will be on the "Beyond the Sunrise" purchase link
  When I click on "Cultivating the Soul" purchase link
  	Then I will be on the "Cultivating the Soul" purchase link

Scenario: trying to view a book that doesn't exist
  Given I am on the books page
  When I try to view the book with id 10
  Then I should see "Book does not exist"
