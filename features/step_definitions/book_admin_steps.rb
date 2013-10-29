When /I add the book:/ do |books|
  books.hashes.each do |title, author, description, purchase_url|
    click_link("New Book")
    fill_in("Title", :with => title)
    fill_in("Author", :with => author)
    fill_in("Description", :with => description)
    fill_in("Purchase url", :with => purchase_url)
    click_button("Create Book")
  end
end

Then /there should be a book called "(.*)"/ do |title|
  book = Book.where(:title => title)
  book.should_not == nil
end

Then /there should not be a book called "(.*)"/ do |title|
  book = Book.where(:title => title)
  book.should == nil
end

Then /the book "(.*)" should have the description "(.*)"/ do |title, description|
  book = Book.where(:title => title).first
  book.description.should == description
end

When /I change "(.*)" description to "(.*)"/ do |title, des|
  book = Book.where(:title => title).first
  visit edit_admin_book_path(book)
  fill_in("Description", :with => des)
  click_button("Update Book")
end

  

