Feature: Around the Web page and on Homepage
  As an admin,
  So that my users can learn about whats happening in the web,
  I want them to be able to see my latest posts on the front page and everything in a dedicated page.

Background:
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given the following users are not admin:
  |email              | password|
  |user@wisdomsun.org| password|

  Given the following around the web posts exist:
  |title            | ext_link          | commentary |
  |Great       | www.google.com    | it was aight |
  |Sucky     | www.facebook.com  | beautiful   |
  |meh     | www.reddit.com  | |

  And I am logged in as admin
  And I am on the admin around the web page


Scenario: add a post
  When I add the web post:
    |title  | ext_link  | commentary    |
    |Wow    | www.yahoo.com   | okay  |
  Then there should be a web post called "Wow"
  And it should have a link to "www.yahoo.com"
  And it should have the commentary "okay"

Scenario: modify a post
  When I change the web post "Great" to have title "Rawr"
  Then there should not be a web post "Great"
  And there should be a web post "Rawr"
  And it should have a link to "www.google.com"
  And it should have the commentary "it was aight"

Scenario: delete a post
  When I delete the web post "Great"
  Then there should not be a web post "Great"

Scenario: try to edit a nonexistent post
  When I try to edit a web post with id 10
  Then I should be on the admin around the web page
  And I should see "Post does not exist"

Scenario: create post with empty title
  When I click on "New Post"
  And I press "Create Post"
  And I should see "Cannot have empty title"
Scenario: modify post to empty title
  When I change the web post "Great" to have title ""
  Then I should be on the edit page for web post "Great"
  And I should see "Cannot have empty title"
Scenario: modify post to empty link
  When I change the web post "Great" to have ext_link ""
  Then I should be on the edit page for web post "Great"
  And I should see "Cannot have empty link"
Scenario: should see latest posts on front page
  When I am on the home page
  Then I should see "meh"
  And I should see "Sucky"
Scenario: links and commentary on dedicated page
  When I am on the around the web page
  Then I should see these web posts:
    |title            | ext_link          | commentary |
    |Great       | www.google.com    | it was aight |
    |Sucky     | www.facebook.com  | beautiful   |
    |meh     | www.reddit.com  | |



