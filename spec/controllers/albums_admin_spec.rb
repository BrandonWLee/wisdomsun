require 'spec_helper'  
require 'factory_girl'

describe Admin::AlbumsController do
  render_views
	include Devise::TestHelpers
  before(:each) do
    user = mock('user')
    user.stub(:email).and_return("hello@example.com")
    user.stub(:password).and_return("password")
    user.stub(:to_key).and_return(1)
    user.stub(:authenticatable_salt).and_return(1)
    user.stub(:admin?).and_return(true)
    request.env["warden"].stub :authenticate! => user
    controller.stub :current_user => user
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
  before(:all) do
    User.all.each do |user|
      user.destroy
    end
    @albums = Album.create!( [{:name=>"album1", :description=>"album1desc"}, 
                            {:name=>"album2", :description=>"album2desc"}])
  end

  after(:all) do
    @albums.each do |album|
      album.destroy
    end
  end

  describe 'admin albums index page' do
    it 'should show all of the albums' do
      get :index
      @albums.each do |album| 
        response.body.should include(album.description)
        response.body.should include(album.name)
      end
    end
  end
end
