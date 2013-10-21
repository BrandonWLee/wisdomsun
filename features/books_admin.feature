Feature: add, remove, or modify books

  As an admin
  So that new books can be added, old books can be deleted, and book information can be changed
  I want to log in as admin to modify the Books page

Background: books have been added to database
  Given I am logged in as admin
  And I am on the books page
  And the following books exist:
  | title        | author    | price       | link_to_purchase  | publish_date
  | Mediation       | Brandon Lee  | 15.00      | fake_url      | 12-Dec-2004
  | Beyond the Sunrise  | Jeff Zhan    | 20.00      | fake_url_2    | 4-May-2010
  | Cultivating the Soul| Kevin Dip    | 13.50      | fake_url_3    | 23-Jan-2013 

Scenario: add a book
  When I add the book:
  | Wisdom Moon   | Samuel Leung   | 10.95     | fake_url_4  | 20-Oct-2014
  Then I should see "Wisdom Moon"
  And I should see "Wisdom Moon" before "Samuel Leung"
  And I should see "Samuel Leung" before "$10.95"
  And I should see "$10.95" before "fake_url_4"
  And I should see "fake_url_4" before "20-Oct-2014"

Scenario: delete a book
  When I delete the book "Meditation"
  Then I should not see "Meditation"

Scenario: modify a book's info
  When I change "Beyond the Sunrise's" price to "$100.00"
  Then I should see "Beyond the Sunrise" before "$100.00"
