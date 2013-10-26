# Add a declarative step here for populating the DB with books.

Given /the following books exist/ do |books_table|
  books_table.hashes.each do |book|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # Book.create(:title => book[:title], :author => book[:author], :description => book[:description],
        # :picture => book[:picture], :purchase_url => book[:purchase_url])
    Book.create!(book)
  end
end

