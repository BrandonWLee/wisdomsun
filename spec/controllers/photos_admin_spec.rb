require 'spec_helper'  

describe Admin::PhotosController do
render_views

  before(:all) do
    User.all.each do |user|
      user.destroy
    end
    @admin = User.create!({:email => "test@example.com", :password => "password"})
    @admin.toggle!(:admin)
    @photos = Photo.create!( [{:description=>"photo1"}, 
                            {:description=>"photo2"}])
#    picture1 = File.new("./app/assets/images/photos/1-1.jpg")
#    @photos[0].picture = picture1
#    picture2 = File.new("./app/assets/images/photos/1-2.jpg")
#    @photos[1].picture = picture2
#    picture1.close
#    picture2.close
  end

  after(:all) do
    @admin.destroy
    @photos.each do |photo|
      photo.destroy
    end
  end

  describe 'admin photos index page' do
    it 'should show all of the photos' do
      get :index
      @photos.each do |photo| 
        response.should include(photo.description)
      end
    end
  end
end
