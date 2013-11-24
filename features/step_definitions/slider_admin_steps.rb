Then /^there should be a slider named "(.*?)"$/ do |name|
  slider = Slider.where(:name => name).first
  slider.should_not == []
end

When /^I change the slider "(.*?)" link to "(.*?)"$/ do |name, link|
  slider = Slider.where(:name => name).first
  visit edit_admin_slider_path(slider)
  fill_in("Link", :with => link)
  click_button("Update Slider")
end

Then /^the slider "(.*?)" should have a link to "(.*?)"$/ do |name, link|
  slider = Slider.where(:name => name).first
  slider.link.should == link
end

When /^I delete the slider "(.*?)"$/ do |name|
  slider = Slider.where(:name => name).first
  visit admin_slider_path(slider)
  click_link("Delete Slider")
end

Then /^there should not be a slider named "(.*?)"$/ do |name|
  slider = Slider.where(:name => name)
  slider.should == []
end

When /^I try to edit a slider with id 10$/ do 
  visit('/admin/sliders/10/edit')
end

When /^I change the slider "(.*?)" name to "(.*?)"$/ do |name, name2|
  slider = Slider.where(:name => name).first
  visit edit_admin_slider_path(slider)
  fill_in("Name", :with => name2)
  click_button("Update Slider")
end

When /^I change the slider "(.*?)" picture to "(.*?)"$/ do |name, img_url|
  slider = Slider.where(:name => name).first
  visit edit_admin_slider_path(slider)
  fill_in("Picture", :with => img_url)
  click_button("Update Slider")
end
When /I add the slider:/ do |sliders_table|
  sliders_table.hashes.each do |slider|
    new_slider = Slider.new
    new_slider.name = slider[:name]
    new_slider.link = slider[:link]
    file = File.new(slider[:picture])
    new_slider.picture = file
    file.close
    new_slider.save!
  end
end
