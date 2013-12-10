# Add a declarative step here for populating the DB with books.
Given /the following users are admin:/ do |users_table|
  users_table.hashes.each do |user|
    admin = User.create!({:email => user[:email], :password => user[:password]})
    admin.first_name = "Admin"
    admin.last_name = "Admin"
    admin.toggle!(:admin)
    admin.toggle!(:forem_admin)
    admin.confirmed_at = Time.now
    admin.save!
  end
end

Given /the following users are not admin:/ do |users_table|
  users_table.hashes.each do |user|
    usr = User.create!({:email => user[:email], :password => user[:password]})
    usr.first_name = "Fake"
    usr.last_name = "User"
    usr.confirmed_at = Time.now
    usr.save!
  end
end

Given /^I am not logged in/ do 
  if page.has_content?("Sign out")
    click_link("Sign out")
  end
end

When /I login with the correct admin login information/ do
  fill_in("Email", :with => "admin@wisdomsun.org")
  fill_in("Password", :with => "password")
  click_button("Sign in")
end


When /I login with the incorrect admin login information/ do
  fill_in("Email", :with => "user@wisdomsun.org")
  fill_in("Password", :with => "password")
  click_button("Sign in")
end

Given /I am logged in as admin/ do
  step 'I am on the Wisdom Sun homepage'
  step 'I am not logged in'
  step 'I follow "Sign in"'
  step 'I login with the correct admin login information'
end


