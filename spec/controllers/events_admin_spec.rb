require 'spec_helper'  
require 'factory_girl'

describe Admin::EventsController do
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
    @events = Event.create!( [{:name=> "firstevent", :description=>"event1"}, 
                            {:name=> "secondevent", :description=>"event2"}])
    #user = FactoryGirl.create(:user, :email => "hello@example.com", :password => "password")

#    picture1 = File.new("./app/assets/images/photos/1-1.jpg")
#    @photos[0].picture = picture1
#    picture2 = File.new("./app/assets/images/photos/1-2.jpg")
#    @photos[1].picture = picture2
#    picture1.close
#    picture2.close
  end

  after(:all) do
    @events.each do |event|
      event.destroy
    end
  end

  describe 'admin events index page' do
    it 'should show all of the events' do
      get :index
      @events.each do |event| 
        response.body.should include(event.description)
      end
    end
  end
end
