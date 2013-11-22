Feature: Admin bulletin board
  As an admin of the Wisdom Sun website, 
  So that I can control the nature of the posts on the board,
  I want to be able to access the bulletin board, create/update/delete malicious posts and comments.

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
  | I love hot yoga! | user    | 11/12/2013 | Hot yoga      |
  | Mmm fire         | user    | 12/14/2014 | Fiery Buddhas |
  
  And the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And the following users are not admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  And I am logged in as admin
  And I am on the admin bulletin page

Scenario: add a topic
  When I add the topic:
    | name | poster | date       | description         |
    | Fun  | admin  | 10/12/2013 | Talk about fun here |
  Then there should be a topic called "Fun"
  When I add the thread: 
    | name     | poster | date       | description                | topic |
    |Funny fun | admin  | 11/11/2011 | Talk about funny fun here  | Fun   |
  Then there should be a thread called "Funny fun"
  When I add the post:
    | post      | poster | date       | thread    |
    | I lyk fun | admin  | 12/25/2013 | Funny Fun |
  Then there should be a post that says "I lyk fun"

Scenario: modify a topic/thread
  When I change the "Yoga" topic to "Meditation"
  Then there should be a topic called "Meditation"
  When I follow the "Fun" topic 
  And I change the "Funny fun" thread to "Meep"
  Then there should be a thread called "Meep"

Scenario: delete a topic/thread/post
  When I delete the topic "Flaming Buddhas"
  Then there should not be a topic called "Flaming Buddhas"
  And there should not be a thread called "Fiery Buddhas"
  And there should not be a post that says "Mmm fire"

Scenario: editing a nonexistent topic
  When I try to edit a topic with id 5
  Then I should be on the admin bulletin page
  And I should see "Topic does not exist"


