When /I add the book:/ do |books|
  books.hashes.each do |book|
    click_link("New Book")
    fill_in("Title", :with => book[:title])
    fill_in("Author", :with => book[:author])
    fill_in("Description", :with => book[:description])
    fill_in("Purchase url", :with => book[:purchase_url])
    click_button("Create Book")
  end
end

Then /there should be a book called "(.*)"/ do |title|
  book = Book.where(:title => title)
  book.should_not == []
end

Then /there should not be a book called "(.*)"/ do |title|
  book = Book.where(:title => title)
  book.should == []
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

When /I delete the book "(.*)"/ do |title|
  book = Book.where(:title => title).first
  visit admin_book_path(book)
  click_link("Delete Book")
end

When /^I try to edit a book with id 10/ do
  visit('/admin/books/10/edit')
end

When /I book change the Book "(.*)" title to ""/ do |name|
  event = Book.where(:title => name).first
  visit edit_admin_book_path(event)
  fill_in("Title", :with => "")
  click_button("Update Book")
end


  

