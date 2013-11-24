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
  |Great       | http://www.google.com    | it was aight |
  |Sucky     | http://www.facebook.com  | beautiful   |
  |meh     | http://www.reddit.com  | |

  And I am logged in as admin
  And I am on the admin around the web page


Scenario: add a post
  When I add the web post:
    |title  | ext_link  | commentary    |
    |Wow    | www.yahoo.com   | okay  |
  Then the following around the web posts should exist:
    |title | ext_link | commentary |
    |Wow    | http://www.yahoo.com   | okay  |

Scenario: modify a post
  When I change the web post "Great" to have title "Rawr"
  Then there should not be a web post "Great"
  Then the following around the web posts should exist:
    |title | ext_link | commentary |
    |Rawr    | http://www.google.com  | it was aight |

Scenario: delete a post
  When I delete the web post "Great"
  Then there should not be a web post "Great"

Scenario: try to edit a nonexistent post
  When I try to edit a web post with id 10
  And I should not see "Edit Around The Web Post"

Scenario: create post with empty title
  When I click on "New Around The Web Post"
  And I press "Create Around the web post"
  And I should see "Title can't be blank"
Scenario: modify post to empty title
  When I change the web post "Great" to have title ""
  And I should see "Title can't be blank"
Scenario: should see latest posts on front page
  When I am on the home page
  Then I should see "meh"
  And I should see "Sucky"
Scenario: links and commentary on dedicated page
  When I am on the around the web page
  Then I should see the web posts:
    |title            | ext_link          | commentary |
    |Great       | www.google.com    | it was aight |
    |Sucky     | www.facebook.com  | beautiful   |
    |meh     | www.reddit.com  | |



