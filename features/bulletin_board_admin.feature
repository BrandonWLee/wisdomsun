Feature: Admin bulletin board
  As an admin of the Wisdom Sun website, 
  So that I can control the nature of the posts on the board,
  I want to be able to access the bulletin board, create/update/delete malicious forums, topics, and posts.

Background:
 
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And the following users are not admin:
  |email              | password|
  |user@wisdomsun.org| password|


And the following forem categories exist:
  | name  |
  |General|

  And the following forums exist:
  |title             | description                    |category_name|
  | Yoga             | Talk about yoga here           | General     |

   And the following posts exist:
  | topic_name       | text    | user_name          |
  | Hot yoga         | blah    | admin@wisdomsun.org |
  
  And the following topics exist:
  | subject       | user_name                   |forum_name       | post_name |
  | Hot yoga      | admin@wisdomsun.org         | Yoga            | blah      |
  | Fun yoga      | user@wisdomsun.org          | Yoga            | bloop     |

  And I am on the Wisdom Sun homepage
  And I am not logged in
  When I follow "Sign in"
  And I login with the correct admin login information"
  Then I should be on the admin page
  When I go to the homepage
  And I press the Bulletin tab
  Then I should be on Bulletin


Scenario: manage categories
  When I follow "Admin Area"
  And I follow "Manage Forum Categories"
  And I follow "Edit"
  And I fill in "category_name" with "Wisdom Sun"
  And I press "Update Category"
  Then I should see "Wisdom Sun"

Scenario: modify a forum/thread
  When I am on the bulletin page
  When I follow "Admin Area"
  When I follow "Manage Forums" 
  When I follow "Edit"
  When I fill in "forum_title" with "Yogi" 
  And I fill in "forum_description" with "mmm"
  And I press "Update Forum"
  Then I should see "Yogi"

Scenario: delete a forum
  When I am on the bulletin page
  When I follow "Admin Area"
  And I follow "Manage Forums"
  And I follow "Delete"
  Then I should not see "Yogi"

Scenario: add a forum
  When I follow "Admin Area"
  And I follow "Manage Forums"
  And I follow "New Forum"
  And I fill in "forum_title" with "Meep"
  And I fill in "forum_description" with "Talk about meep here"
  And I press "Create Forum"
  Then I should see "Meep"



Scenario: deleting another user's topic
  When I am on the bulletin page
  And I follow "Yoga"
  And I follow "Fun yoga"
  And I follow "Delete"
  Then I should not see "Wheee"

