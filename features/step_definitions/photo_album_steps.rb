Given /the following photos exist:/ do |photos_table|
  photos_table.hashes.each do |photo|
    new_photo = Photo.new
    new_photo.album_id = photo[:album_id]
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

When /I upload the photo "(.*)"/ do |photo_path|
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




