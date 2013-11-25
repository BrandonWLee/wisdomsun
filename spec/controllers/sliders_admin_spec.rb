require 'spec_helper'  
require 'factory_girl'

describe Admin::SlidersController do
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
    @sliders = Slider.create!( [{:name=>"Lineage"}, 
                            {:name=>"Articles and Songs"}])
  end

  after(:all) do
    @sliders.each do |slider|
      slider.destroy
    end
  end

  describe 'admin sliders index page' do
    it 'should show all of the sliders' do
      get :index
      @sliders.each do |slider| 
        response.body.should include(slider.name)
      end
    end
  end
  describe 'admin sliders edit page' do 
    it 'should be able render edit page' do
      @slider = @sliders[0]
      get :edit, {:id => @slider.id.to_s}
      response.should be_success
    end
    it 'should redirect if slider does not exist' do
      Slider.should_receive(:exists?).with(15.to_s).and_return(false)
      get :edit, {:id => 15.to_s}
      response.should redirect_to('/admin/sliders')
    end
  end
  describe 'admin sliders update' do
    it 'should redirect with empty name' do
      @id = '1'
      post :update, {:id => @id, :slider => {:name => ''}}
      response.should redirect_to('/admin/sliders')
    end
    it 'should redirect with nil name' do
      @id = '1'
      post :update, {:id => @id, :slider => {}}
      response.should redirect_to('/admin/sliders')
    end
    it 'should update properly' do
      @slider = @sliders[0]
      @id = @slider.id.to_s
      post :update, {:id => @id, :slider => {:name => 'New Event'}}
    end
  end
  describe 'admin sliders create' do
    it 'should redirect with empty name' do
      @id = '1'
      post :create, {:id => @id, :slider => {:name => ''}}
      response.should redirect_to('/admin/sliders')
    end
    it 'should redirect with nil name' do
      @id = '1'
      post :create, {:id => @id, :slider => {}}
      response.should redirect_to('/admin/sliders')
    end
    it 'should create properly' do
      @slider = @sliders[0]
      @id = @slider.id.to_s
      post :create, {:id => @id, :slider => {:name => 'sliderone'}}
    end
  end
end
