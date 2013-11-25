require "selenium-webdriver"

Given /the following categories exist:/ do |categories|
  categories.hashes.each do |category|
    Category.create!(:name => category[:name], :position => category[:position], :refactored_name => category[:refactored_name])
  end
end

Given /the following other_pages exist:/ do |pages|
  pages.hashes.each do |page|
    OtherPage.create!(:title => page[:title], :category_id => page[:category_id], :refactored_title => page[:refactored_title])
  end
end

When(/^I hover over the categories tab on the menu bar$/) do
  # page.find('#menu-category').trigger(:mouseover)
  find('#menu-category').hover
end

Then(/^I see "(.*?)" and its contents on the page\.$/) do |page_title|
  bool = page.body.match(page_title)
  bool2 = page.body.match("Filler text")
  bool && bool2 != false
end

