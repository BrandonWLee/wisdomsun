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
   
    when /^the books page$/ then
      '/books'
    when /^the (Wisdom Sun )?home\s?page$/ then '/'
    when /^the movies page$/ then '/movies'
    when /^the edit page for "(.*)"$/
      movie = Movie.find_by_title($1)
      edit_movie_path(movie)
    when /^the details page for "(.*)"$/
      movie = Movie.find_by_title($1)
      movie_path(movie)
    when /^the Similar Movies page for "(.*)"$/
      movie = Movie.find_by_title($1)
      movie_findbydirector_path(movie)
    when /^About/ then '/about'
    when /^Downloads/ then '/downloads'
    when /^Bulletin/ then '/bulletin'
    when /^Contact/ then '/contact'
    when /^Events/ then '/events'
    when /^Books/ then '/books'
    when /^Around the Web/ then '/aroundtheweb'

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
