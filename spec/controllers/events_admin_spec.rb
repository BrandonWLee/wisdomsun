require 'spec_helper'  
require 'factory_girl'

describe Admin::EventsController do
  render_views
	include Devise::TestHelpers
  before(:each) do
    user = double('user')
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
                            {:name=> "secondevent",:description=>"event2"}])
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
  describe 'admin events edit page' do 
    it 'should be able render edit page' do
      @event = @events[0]
      get :edit, {:id => @event.id.to_s}
      response.should be_success
    end
    it 'should redirect if event does not exist' do
      Event.should_receive(:exists?).with(15.to_s).and_return(false)
      get :edit, {:id => 15.to_s}
      response.should redirect_to('/admin/events')
    end
  end
  describe 'admin events update' do
    it 'should redirect with empty name' do
      @id = '1'
      post :update, {:id => @id, :event => {:name => ''}}
      response.should redirect_to('/admin/events')
    end
    it 'should redirect with nil name' do
      @id = '1'
      post :update, {:id => @id, :event => {}}
      response.should redirect_to('/admin/events')
    end
    it 'should update properly' do
      @event = @events[0]
      @id = @event.id.to_s
      post :update, {:id => @id, :event => {:name => 'eventone'}}
    end
  end
  describe 'admin events create' do
    it 'should redirect with empty name' do
      @id = '1'
      post :create, {:id => @id, :event => {:name => ''}}
      response.should redirect_to('/admin/events')
    end
    it 'should redirect with nil name' do
      @id = '1'
      post :create, {:id => @id, :event => {}}
      response.should redirect_to('/admin/events')
    end
    it 'should create properly' do
      @event = @events[0]
      @id = @event.id.to_s
      post :create, {:id => @id, :event => {:name => 'eventone'}}
    end
  end
end
