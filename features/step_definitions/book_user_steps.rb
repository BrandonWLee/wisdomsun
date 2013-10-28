# Add a declarative step here for populating the DB with books.

Given /the following books exist/ do |books_table|
  books_table.hashes.each do |book|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # Book.create(:title => book[:title], :author => book[:author], :description => book[:description],
        # :picture => book[:picture], :purchase_url => book[:purchase_url])
    Book.create!(book)
  end
end

Then /the book title "(.*)" should be on page/ do |title|
  pattern = title
  !page.body.match(pattern)
end

Then /the book title "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  pattern = e1 + ".*" + e2
  !page.body.match(pattern).nil?
end

# When(/^I click on the "(.*)" purchase link$/) do |arg1|
  # click_link(Book.find_by_title(arg1).purchase_url)
# end


When(/^I click on "(.*?)" purchase link$/) do |arg1|
  path_to(Book.find_by_title(arg1).purchase_url)
end

Then /^I will be on the "(.*)" purchase link$/ do |arg1|
  # http://www.example.com is the default root for testing
  current_url.should == "http://www.example.com#{path_to(Book.find_by_title(arg1).purchase_url)}"
end
