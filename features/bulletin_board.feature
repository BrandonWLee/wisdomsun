Feature: Working Bulletin Board
  As a user of the Wisdom Sun website, 
  So that I can participate in discussions related to Buddhism,
  I want to be able to access the bulletin board, create/update/delete posts and comments.

Background:
  Given the following users are admin:
  |email              | password|
  |admin@wisdomsun.org| password|

  Given the following users are not admin:
  |email              | password|
  |user@wisdomsun.org| password|

