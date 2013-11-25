Given /there are no photos/ do 
  Photo.all.each do |photo|
    photo.destroy
  end
end

Given /there are no albums/ do 
  Album.all.each do |album|
    album.destroy
  end
end

Given /the following photos exist:/ do |photos_table|
  photos_table.hashes.each do |photo|
    album = Album.find_by_id(photo[:album_id])
    new_photo = Photo.new
    new_photo.album = album
    new_photo.description = photo[:description]
    file = File.new(photo[:picture])
    new_photo.picture = file
    file.close
    new_photo.save!
  end
end

Given /the following photos in these albums exist:/ do |photos_table|
  photos_table.hashes.each do |photo|
    album = Album.find_by_name(photo[:album])
    new_photo = Photo.new
    new_photo.album = album
    new_photo.description = photo[:description]
    file = File.new(photo[:picture])
    new_photo.picture = file
    file.close
    new_photo.save!
  end
end
Given /the following albums exist:/ do |albums_table|
  albums_table.hashes.each do |album|
    new_album = Album.new
    new_album.name = album[:name]
    new_album.description = album[:description]
    file = File.new(album[:album_cover])
    new_album.album_cover = file
    file.close
    new_album.save!
  end
end

When /I upload the picture to the photo "(.*)"/ do |photo_path|
  step "I attach the file \"#{photo_path}\" to \"Picture\""
end

When /I fill in the description "(.*)"/ do |description|
  fill_in("Description", description)
end

When /I add a new album named "(.*)"/ do |album_name|
  click_link("New Album")
  fill_in("Album Name", album_name)
end

Then /there should be a photo with the description "(.*)"/ do |description|
  photo = Photo.find_by_description(description)
  photo.should_not == nil
end

Then /there should be an album with the name "(.*)"/ do |name|
  album = Album.find_by_name(name)
  album.should_not == nil
end

Then /there should be a photo with the description "(.*)" in the album "(.*)"/ do |description, name|
  photo = Photo.find_by_description(description)
  photo.should_not == nil
  album = Album.find_by_name(name)
  album.should_not == nil
  album.photos.should include(photo)    # TODO if more than one photo has that description?
end

When /I go to the edit page of the album "(.*)"/ do |album_name|
  album = Album.find_by_name(album_name)
  visit edit_admin_book_path(album)
end

When /I click on the admin albums page/ do 
  click_link("Albums")
end

When /I check out the edit page of the album "(.*)"/ do |name|
  album = Album.find_by_name(name)
  album.should_not == nil
  visit edit_admin_album_path(album)
end

Then /there should not be an album with the name "(.*)"/ do |name|
  album = Album.find_by_name(name)
  album.should == nil
end

Then /there should not be a photo with the description "(.*)"/ do |description|
  photo = Photo.find_by_description(description)
  photo.should == nil
end

When /I click "(.*)" for the album "(.*)"/ do |link_name, name|
  album = Album.find_by_name(name)
  album.should_not == nil
  within("tr#album_#{album.id}") do
    click_link(link_name)
  end
end

Then /there should be a "(.*)" photo in the "(.*)" album/ do |photo_d, album_name|
  photo = Photo.find_by_description(photo_d)
  photo.should_not == nil
  photo.album.should_not == nil
  photo.album.name.should == album_name
end

Then /there should not be a "(.*)" photo in the "(.*)" album/ do |photo_d, album_name|
  photo = Photo.find_by_description(photo_d)
  photo.should_not == nil
  photo.album.should == nil
end

When /I add the photo to the album named "(.*)"/ do |name|
  select(name, :from => "Album")
end

Then(/^I should see the album titles "(.*?)" and "(.*?)" on the page\.$/) do |arg1, arg2|
  match1 = page.body.match(arg1)
  match2 = page.body.match(arg2)
  !match1.nil? && !match2.nil?
end

Then(/^I should see the album covers of "(.*?)" and "(.*?)" on the page\.$/) do |arg1, arg2|
  albumcover1 = Album.find_by_name(arg1)
  albumcover2 = Album.find_by_name(arg2)
  match1 = page.body.match(albumcover1.album_cover_file_name)
  match2 = page.body.match(albumcover2.album_cover_file_name)
  !match1.nil? && !match2.nil?
end

Then(/^I should see all of the photos in the album "(.*?)"\.$/) do |arg1|
  albumid = Album.find_by_name(arg1).id
  photos = Photo.where(:album_id => albumid)
  bool = true
  photos.each do |photo|
    bool = bool && page.body.match(photo.picture_file_name)
  end
  bool == true
end

Then(/^I should see the album descriptions of "(.*?)"\.$/) do |arg1|
  album = Album.find_by_name(arg1)
  !page.body.match(album.description).nil?
end

When(/^I click on the first picture of the "(.*?)" album$/) do |arg1|
  id = Album.find_by_name(arg1).id
  photo1 = Photo.where(:album_id => id).first
  visit '#{photo1.picture.url}'
end

When(/^I click on "(.*?)" on the albums page$/) do |arg1|
  click_link(arg1, match: :first)
end  

Then(/^I should see a popup of the first picture of the "(.*?)" album\.$/) do |arg1|
  id = Album.find_by_name(arg1).id
  photo1 = Photo.where(:album_id => id).first.picture_file_name
  pattern = "fancybox-img.*#{photo1}"
  page.body.match(pattern).nil? == false
end

When(/^I try to view the album with id (\d+)$/) do |arg1|
  visit("/photos?album_id=#{arg1}")
  # redirect_to photos_path, :album_id => arg1
end

