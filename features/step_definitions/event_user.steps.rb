Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # Book.create(:title => book[:title], :author => book[:author], :description => book[:description],
        # :picture => book[:picture], :purchase_url => book[:purchase_url])
    Event.create!(event)
  end
end

Then /^I should see description for "(.*)"$/ do |arg1|
  step %{I should see "#{Event.find_by_name(arg1).description}"}
end

When /^I try to view the event with id (\d+)$/ do |arg1|
  visit path_to("/events/show/#{arg1}")
end

