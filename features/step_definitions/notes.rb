Given /the following quotes exist:/ do |quotes_table|
  quotes_table.hashes.each do |quote|
    Quote.create! quote: quote[:quote], source: quote[:source]
  end
end

When /I add the quotes:/ do |quotes_table|
  quotes_table.hashes.each do |quote|
    click_link("New Quote")
    fill_in("Quote", :with => quote[:quote])
    fill_in("Source", :with => quote[:source])
    click_button("Create Quote")
  end
end

Then /there should be a quote called "(.*)"/ do |quote|
  found_quote = Quote.find_by_quote quote
  found_quote.should_not == nil
end

Then /there should not be a quote "(.*)"/ do |quote|
  found_quote = Quote.find_by_quote quote
  found_quote.should == nil
end

When /I delete the quote "(.*)"/ do |quote|
  found_quote = Quote.find_by_quote quote
  within("tr#quote_#{found_quote.id}") do
    click_link("Delete")
  end
end
Then /the following quotes should exist:/ do |quotes_table|
  quotes_table.hashes.each do |quote|
    found_quote = Quote.find_by_quote quote[:quote]
    found_quote.should_not == nil
    found_quote.source.should == quote[:source]
  end
end


When /I change the quote "(.*)" to have quote "(.*)"/ do |from_quote, to_quote|
  quote = Quote.find_by_quote from_quote
  within("tr#quote_#{quote.id}") do
    click_link("Edit")
  end
  fill_in("Quote", :with => to_quote)
  click_button("Update Quote")
end

When /^I try to edit a quote with id 10/ do
  begin
    visit('/admin/quotes/10/edit')
  rescue
    assert true
  end
end

Then /I should see the quotes:/ do |quotes_table|
  quotes_table.hashes.each do |quote|
    step "I should see \"#{quote[:quote]}\""
    step "I should see \"#{quote[:source]}\""
  end
end
