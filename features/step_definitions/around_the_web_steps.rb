Given /the following around the web posts exist:/ do |posts_table|
  posts_table.hashes.each do |post|
    AroundTheWebPost.create! title: post[:title], external_link: post[:ext_link], commentary: post[:commentary]
  end
end

Then /the following around the web posts should exist:/ do |posts_table|
  posts_table.hashes.each do |post|
    pst = AroundTheWebPost.find_by_title post[:title]
    pst.should_not == nil
    pst.external_link.should == post[:ext_link]
    pst.commentary.strip.should == post[:commentary]
  end
end

When /I add the web post:/ do |posts_table|
  posts_table.hashes.each do |post|
    click_link("New Around The Web Post")
    fill_in("Title", :with => post[:title])
    fill_in("External link", :with => post[:ext_link])
    fill_in("Commentary", :with => post[:commentary])
    click_button("Create Around the web post")
  end
end

Then /there should not be a web post "(.*)"/ do |title|
  post = AroundTheWebPost.find_by_title title
  post.should == nil
end

When /I change the web post "(.*)" to have title "(.*)"/ do |from_title, to_title|
  post = AroundTheWebPost.find_by_title from_title
  within("tr#around_the_web_post_#{post.id}") do
    click_link("Edit")
  end
  fill_in("Title", :with => to_title)
  click_button("Update Around the web post")
end
When /I delete the web post "(.*)"/ do |title|
  post = AroundTheWebPost.find_by_title title
  within("tr#around_the_web_post_#{post.id}") do
    click_link("Delete")
  end
end
When /^I try to edit a web post with id 10/ do
  begin
    visit('/admin/around_the_web_posts/10/edit')
  rescue
    assert true
  end
end
Then /I should see the web posts:/ do |posts_table|
  posts_table.hashes.each do |post|
    step "I should see \"#{post[:title]}\""
    step "I should see \"#{post[:commentary]}\""
  end
end


