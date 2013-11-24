Given /the following categories exist:/ do |categories|
  categories.hashes.each do |category|
    Category.create(:name => category[:name], :position => category[:position], :refactored_name => category[:refactored_name])
  end
end

Given /the following other_pages exist:/ do |pages|
  pages.hashes.each do |page|
    OtherPage.create(:title => page[:title], :category_id => page[:category_id], :refactored_title => page[:refactored_title])
  end
end

