Feature: 
  As a user of the Wisdom Sun website,
  So that I can create threads and posts for discussion 
  I want to be able to access the bulletin board, create/update/delete threads and posts

Background:
  Given the following topics exist:
  |name             | poster | date       | description                    |
  | Yoga            | admin  | 10/11/2013 | Talk about yoga here           |
  | Flaming Buddhas | admin  | 11/13/2013 | Talk about flaming buddhas here|

  And the following threads exist:
  |name           | poster | date       | description                   | topic           |
  | Hot yoga      | user   | 10/15/2013 | Talk about hot yoga here      | Yoga            |
  | Fiery Buddhas | user   | 10/14/2013 | Talk about fiery buddhas here | Flaming Buddhas |

  And the following posts exist:
  | post             | poster  | date       | thread        |
  | I love hot yoga! | admin   | 11/12/2013 | Hot yoga      |
  | Mmm fire         | user    | 12/14/2014 | Fiery Buddhas |
  
  And the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And the following users are not admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And I am logged in as user
  And I am on the admin bulletin page

Scenario: add a thread
  When I follow the topic "Yoga"
  And I add the thread:
  | name | poster | date | description | topic |
  | Therapeutic Yoga | user | 10/10/2010 | Talk about therapeutic yoga here | Yoga |
  Then there should be a thread called "Therapeutic Yoga"

Scenario: add a post
  When I follow the topic "Yoga"
  And I follow the thread "Therapeutic Yoga"
  And I add the post:
  | post | poster | date | thread |
  | My back feels better | user | 10/11/2013 | Therapeutic Yoga |
  Then there should be a post that says "My back feels better"

Scenario: delete own post 
  When I follow the topic "Yoga"
  And I follow the thread "Therapeutic Yoga"
  And I am the poster of the post with id 2
  And I delete the post with id 2 
  Then there should be no post with id 2

Scenario: trying to delete someone else's post
  When I follow the topic "Yoga"
  And I follow the thread "Hot Yoga"
  And I am not the poster of the post with id 1
  And I delete the post with id 1
  Then I should see "Cannot delete post of another user"

Scenario: editing own post
  When I follow the topic "Flaming Buddhas"
  And I follow the thread "Fiery Buddhas"
  And I change the post that says "Mmm fire" to say "Mmm spicy"
  Then I should see a post that says "Mmm spicy"
