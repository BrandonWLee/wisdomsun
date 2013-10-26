Feature: add, remove, or modify books

  As an admin
  So that new books can be added, old books can be deleted, and book information can be changed
  I want to log in as admin to modify the Books page

Background: books have been added to database
  Given I am logged in as admin
  And I am on the books page
  And the following books exist:
  | title                | author        | description      | purchase_url  | picture
  | Guns and Cars        | Shensen Wang  | I..err..wut      | fake_url_1    | square_shensen.png
  | Don't be a Derp      | Jeff Zhan     | Vines are cool   | fake_url_2    | square_jeff.png
  | Why don't you Shave  | Kevin Dip     | I'm so awesome   | fake_url_3    | square_kevin.png

Scenario: add a book
  When I add the book:
  | Freakin' Sam   | Samuel Leung   | It's about anime   | fake_url_4  | square_sam.png
  Then I should see "Freakin' Sam"
  And I should see "Freakin' Sam" before "Samuel Leung"
  And I should see "Samuel Leung" before "It's about anime"
  And I should see "It's about anime" before "fake_url_4"
  And I should see "fake_url_4" before "square_sam.png"

Scenario: delete a book
  When I delete the book "Guns and Cars"
  Then I should not see "Guns and Cars"

Scenario: deleting a book that doesn't exist should fail
  When I delete the book "Buddha"
  Then I should be on the Books page
  And I should see the error "Book doesn't exist"

Scenario: modify a book's info
  When I change "Don't be a Derp" "description" to "Nigga my NIGGA"
  Then I should see "Nigga my NIGGA" before "fake_url_4"

Scenario: modify a book that doesn't exist should fail
  When I change "Buddha's" "description" to "Peace and love is the answer"
  Then I should be on the Books page
  And I should see the error "Book doesn't exist"

Scenario: modifying a book's info field that doesnt exist should fail
  When I change "Beyond the Sunrise's" "release_date" to "5-May-2010"
  Then I should be on the Books page
  And I should see the error "Field deosn't exist"

