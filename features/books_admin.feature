Feature: add, remove, or modify books

  As an admin
  So that new books can be added, old books can be deleted, and book information can be changed
  I want to log in as admin to modify the Books page

Background: books have been added to database

  Given the following books exist:
  | title                | author        | description      | purchase_url  |
  | Guns and Cars        | Shensen Wang  | I..err..wut      | fake_url_1    |
  | Don't be a Derp      | Jeff Zhan     | Vines are cool   | fake_url_2    |
  | Why don't you Shave  | Kevin Dip     | I'm so awesome   | fake_url_3    |

  And the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And I am logged in as admin
  And I am on the admin books page

Scenario: add a book
  When I add the book:
  | title          | author        | description      | purchase_url  |
  | Freakin' Sam   | Samuel Leung   | It's about anime   | fake_url_4  | 
  Then there should be a book called "Freakin' Sam"

Scenario: modify a book's info
  When I change "Don't be a Derp" description to "Nigga my NIGGA"
  Then the book "Don't be a Derp" should have the description "Nigga my NIGGA"


