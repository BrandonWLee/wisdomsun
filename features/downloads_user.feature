Feature: Downloads should be visible in the Downloads Tab, with the correct pages
 
	As a visitor of the Wisdom Sun website,
	So that I can download and view files pertaining to my interest
	I want to be able to download files from the Download Pages.

Background: the downloads pages have been seeded
	When the test database has been seeded for downloads test

Scenario: Given I am on the free downloads page
	When I am on the free downloads page
	Then I should see "Audio Dharma Teachings"
	And I should see "Guided Earth Grounding Meditation"
	And I should be able to click Guided Earth Grounding Meditation
	And I should see "The Nature of Mind"
	And I should be able to click The Nature of Mind
	And I should see "Stars of Wisdom Teachings"
	And I should see "Pure Perception and Natural Confidence"
	And I should be able to click Pure Perception and Natural Confidence
	And I should see "Selflessness View and Meditation"
	And I should be able to click Selflessness View and Meditation

Scenario: Given I am on the articles, songs and more page
	When I am on the articles, songs and more page
	Then I should see "Songs"
	And I should see "Articles"
	And I should see "Seven Ways Things Shine Inside And Out"
	And I should be able to click Seven Ways Things Shine Inside And Out
	And I should see "Eighteen Kinds Of Yogic Joy"
	And I should be able to click Eighteen Kinds Of Yogic Joy
	And I should see "Stages of View at the Heart of Definitive Meaning"
	And I should be able to click Stages of View at the Heart of Definitive Meaning
	And I should see "Buddhadharma"
	And I should be able to click Buddhadharma