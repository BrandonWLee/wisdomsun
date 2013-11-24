Feature: 
  As a user of the Wisdom Sun website,
  So that I can create threads and posts for discussion 
  I want to be able to access the bulletin board, create/update/delete threads and posts

Background:

  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And the following users are not admin:
  |email              | password|
  |user@wisdomsun.org | password|

  And the following forem categories exist:
  | name  |
  |General|

  And the following forums exist:
  |title             | description                    |category_name|
  | Yoga             | Talk about yoga here           | General     |
  | Flaming Buddhas  | Talk about flaming buddhas here| General     |
  | Fun stuff        | Talk about fun stuff here      | General     |

   And the following posts exist:
  | topic_name       | text    | user_name          |
  | Hot yoga         | blah    | admin@wisdomsun.org |
  | Fiery Buddhas    | whee    | user@wisdomsun.org |
  | Funny yoga       | bloop   | user@wisdomsun.org|
  
  And the following topics exist:
  | subject       | user_name                   |forum_name       | post_name |
  | Hot yoga      | admin@wisdomsun.org         | Yoga            | blah      |
  | Funny yoga    | user@wisdomsun.org         | Fun stuff       |bloop      |
  | Fiery Buddhas | user@wisdomsun.org          | Flaming Buddhas | whee      |

  And I am on the Wisdom Sun homepage
  And I am not logged in
  When I follow "Sign in"
  And I login with the incorrect admin login information"
  Then I should be on the homepage
  And I press the Bulletin tab
  Then I should be on Bulletin

Scenario: add a thread
  When I follow "Yoga"
  And I follow "New topic"
  And I fill in "topic_subject" with "Fun"
  And I fill in "topic_posts_attributes_0_text" with "Shalallaa"
  And I press "Create Topic"
  Then I should see "Shalallaa"
  And I follow "Yoga"
  Then I should see "Fun"

Scenario: add a post
  When I follow "Flaming Buddhas"
  And I follow "Fiery Buddhas"
  And I follow "Reply"
  And I fill in "post_text" with "WHEEE"
  And I press "Post Reply"
  Then I should see "WHEEE"

Scenario: delete own post 
  When I follow "Flaming Buddhas"
  And I follow "Fiery Buddhas"
  Then I should see "Wheee"
  And I follow "Delete"
  Then I should not see "Wheee"

Scenario: editing own post
  When I follow "Flaming Buddhas"
  And I follow "Fiery Buddhas"
  And I follow "Editing post"
  And I fill in "post_text" with "SON"
  Then I press "Edit"
  Then I should see "SON"
