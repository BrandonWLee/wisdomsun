Feature: display list of movies sorted by different criteria
 
  As a visitor of the Wisdom Sun website,
  So that I can view what books are on sale,
  I want to be able to browse through the books and see the author, 
  short description, and price of each book.

Background: movies have been added to database
  Given the following books exist:
  | title				| author		| price		 	| link_to_purchase	| publish_date
  | Mediation 			| Brandon Lee	| 15.00			| fake_url			| 12-Dec-2004
  | Beyond the Sunrise	| Jeff Zhan		| 20.00			| fake_url_2		| 4-May-2010
  | Cultivating the Soul| Kevin Dip		| 13.50			| fake_url_3		| 23-Jan-2013

  And I am on the books page

Scenario: all books are on page
