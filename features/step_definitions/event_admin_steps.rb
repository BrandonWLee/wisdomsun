When /I add the event:/ do |events|
  events.hashes.each do |event|
    click_link("New Event")
    fill_in("Name", :with => event[:name])
    fill_in("Date", :with => event[:date])
    fill_in("Description", :with => event[:description])
    fill_in("Location", :with => event[:location])
    fill_in("Time", :with => event[:time])
    click_button("Create Event")
  end
end

Then /there should be an event called "(.*)"/ do |name|
  event = Event.where(:name => name)
  event.should_not == []
end

Then /there should not be an event called "(.*)"/ do |name|
  event = Event.where(:name => name)
  event.should == []
end

Then /the event "(.*)" should have the description "(.*)"/ do |name, description|
  event = Event.where(:name => name).first
  event.description.should == description
end

When /I change the "(.*)" title to ""/ do |name|
  event = Event.where(:name => name).first
  visit edit_admin_event_path(event)
  fill_in("Name", :with => "")
  click_button("Update Event")
end

When /I change the "(.*)" description to "(.*)"/ do |name, description|
  event = Event.where(:name => name).first
  visit edit_admin_event_path(event)
  fill_in("Description", :with => description)
  click_button("Update Event")
end

When /I delete the event "(.*)"/ do |name|
  event = Event.where(:name => name).first
  visit admin_event_path(event)
  click_link("Delete Event")
end

When /^I try to edit a event with id 10/ do
  visit('/admin/events/10/edit')
end

