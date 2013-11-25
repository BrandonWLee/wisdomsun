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
    when /^the home page$/ then
      '/'
    when /^\// then
      '/'
    when /^the books page$/ then
      '/books'
    when /^the support page$/ then
      '/support'
    when /^the bulletin page$/ then
      '/bulletin'
    when /^books/ then
      '/books'
    when /^the albums page.$/ then
      '/albums'
    when /^the contact page$/ then
      '/contact'
    when /^the lineage page$/ then
      '/lineage'
    when /^the songs and articles page&/ then
      '/songsandarticles'
    when /^the (Wisdom Sun )?home\s?page$/ then '/'
    when /the admin around the web page/ then admin_around_the_web_posts_path
    when /^About/ then '/otherPages/1'
    when /^Downloads/ then '/categories/3'
    when /^Bulletin/ then '/bulletin'
    when /^Contact/ then '/contact'
    when /^Events/ then '/events'
    when /^Support/ then '/support'
    when /^Books/ then '/books'
    when /^Albums/ then '/albums'
    when /^Lineage/ then '/albums'
    when /^Articles & Songs/ then '/articles_and_songs'
    when /^the admin books? page/ then '/admin/books'
    when /^the admin photos? page/ then '/admin/photos'
    when /^the admin albums? page/ then '/admin/albums'
    when /^the admin slider? page/ then '/admin/sliders'
    when /^the admin categories page/ then '/admin/categories'
    when /^the admin other pages page/ then '/admin/other_pages'
    when /^the admin quotes page/ then '/admin/quotes'
    when /^the about ari goldfield page/ then '/categories/about/about_ari_goldfield'
    when /^Around the Web/ then '/around_the_web'
    when /the admin (panel|page)/ then admin_dashboard_path
    when /the free downloads page/ then '/otherPages/1'
    when /^the articles, songs and more page$/ then '/otherPages/2'
    when /^the admin articles, songs and more edit page$/ then '/admin/other_pages/2/edit'
    when /^the lineages page$/ then '/otherPages/1'
    when /^the lineages edit page$/ then '/admin/other_pages/1/edit'

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
