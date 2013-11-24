Given /there are no sliders/ do 
  Sliders.all.each do |slider|
    slider.destroy
  end
end

Given /the following sliders exist:/ do |sliders_table|
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

When /I upload the photo "(.*)"/ do |photo_path|
  step "I attach the file \"#{photo_path}\" to \"Picture\""
end

Then /the slider "(.*)" name should be on page/ do |name|
  slider = Slider.find_by_name(name)
  page.should have_content(name)
end

Then /the slider "(.*)" picture should be on page/ do |name|
  slider = Slider.find_by_name(name)
  page.should have_xpath("//img[@src=\"#{slider.picture.url}\"]")
end

When /^I click on "(.*)" link$/ do |name|
  slider = Slider.find_by_name(name)
  visit '#{slider.link}'
end

Then /^I will be on the "(.*?)" link$/ do |arg1|
  
end  
