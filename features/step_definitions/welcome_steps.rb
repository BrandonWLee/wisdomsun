# Add a declarative step here for populating the DB with books.
Then /^I should see (.+)$/ do |section|
  if section.index('tab') == nil
    element = section.downcase.gsub(/\s/,'-')
    element = '#'+element
    page.has_css?(element)
  else
    tab = section.split(" ")[0]
    element = "#main-"+tab.downcase
    page.has_css?(element)
  end
end
