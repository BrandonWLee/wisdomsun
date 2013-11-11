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
  click("New Album")
  fill_in("Album Name", album_name)
end

When /I add the photo to the album named "(.*)"/ do |album_name|
  select("Add to Album", album_name)
end

Then /there should be a photo with the description "(.*)"/ do |description|
  photo = Photo.find(:description => description)
  photo.should_not == nil
end

Then /there should be an album with the name "(.*)"/ do |name|
  album = Album.find(:name => name)
  album.should_not == nil
end

Then /there should be a photo with the description "(.*)" in the album "(.*)"/ do |description, name|
  photo = Photo.find(:description => description)
  photo.should_not == nil
  album = Album.find(:name => name)
  album.should_not == nil
  album.photos.should include(photo)    # TODO if more than one photo has that description?
end

When /I go to the edit page of the album "(.*)"/ do |album_name|
  album = Album.find(:name => album_name)
  visit admin_edit_book_page(album)
end

When /I try to edit a photo with id (.*)/ do |id|
  visit admin_edit_photo_page(:id => id)
end




