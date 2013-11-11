Feature: Downloads and Article, Songs, and More
  As an admin of the Wisdom Sun website,
  So that I can put media related to Buddhist meditation for my own enlightenment,
  I want to be able to make pages where my students can download those stuff.

Scenario: Download from the Downloads page
  Given I am on the Downloads page
  Then I should see "Donwloads"
  And I should see the link "Guided Earth Grounding Mediation"
  And I should see the link "Pure Perception and Natural Confidence"
  
Scenario: The Songs and Article should contain the correct text
	Given I am on the admin Songs and Articles page
	Then I should see "Articles, Songs and More"
	And I should see "Seven Ways Things Shine Inside And Out"
	And I should see "Buddhadarma: Love Me, Hate Me by Rose Taylor"
	


