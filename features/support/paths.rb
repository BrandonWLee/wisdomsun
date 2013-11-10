# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^\// then
      '/'
    when /^the books page$/ then
      '/books'
    when /^the support page$/ then
      '/support'
    when /^books/ then
      '/books'
    when /^the contact page$/ then
      '/contact'
    when /^the lineage page$/ then
      '/lineage'
    when /^the songs and articles page&/ then
      '/songsandarticles'
    when /^the (Wisdom Sun )?home\s?page$/ then '/'
    when /^About/ then '/about'
    when /^Downloads/ then '/downloads'
    when /^Bulletin/ then '/bulletin'
    when /^Contact/ then '/contact'
    when /^Events/ then '/events'
    when /^Support/ then '/support'
    when /^Books/ then '/books'
    when /^the admin books? page/ then '/admin/books'
    when /^the admin photos? page/ then '/admin/photos'
    when /^the admin albums? page/ then '/admin/albums'
    when /^the admin categories page/ then '/admin/categories'
    when /^the admin other pages page/ then '/admin/other_pages'
    when /^Around the Web/ then '/aroundtheweb'
    when /the admin (panel|page)/ then admin_dashboard_path

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
