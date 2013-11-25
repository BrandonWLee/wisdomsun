require 'spec_helper'  
require 'factory_girl'

describe Admin::AroundTheWebPostsController do
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
    AroundTheWebPost.all.each do |post|
      post.destroy
    end
    @posts = AroundTheWebPost.create!( [{:title=> "first-title", :external_link=>"http://www.google.com", :commentary=>"not bad"},
           {:title=> "second-title", :external_link=>"http://www.yahoo.com"}]  )
  end

  after(:all) do
    @posts.each do |post|
      post.destroy
    end
  end

  describe 'admin atw posts index page' do
    it 'should show all of the posts' do
      get :index
      @posts.each do |post| 
        response.body.should include(post.title)
      end
    end
  end
  describe 'admin atw posts edit page' do 
    it 'should be able render edit page' do
      @post = @posts[0]
      get :edit, {:id => @post.id.to_s}
      response.should be_success
    end
    it 'should redirect if post does not exist' do
      AroundTheWebPost.should_receive(:exists?).with(15.to_s).and_return(false)
      get :edit, {:id => 15.to_s}
      response.should redirect_to('/admin/around_the_web_posts')
    end
  end
  describe 'admin atw posts update' do
    it 'should fail with empty name' do
      @post = @posts[0]
      @id = @post.id.to_s
      post :update, {:id => @id, :around_the_web_post => {:title => '', :external_link => "http://www.reddit.com"}}
      response.body.should include("Title can't be blank")
    end
    it 'should update properly' do
      @post = @posts[0]
      @id = @post.id.to_s
      post :update, {:id => @id, :around_the_web_post => {:title => 'mod-post1', :external_link => "http://www.reddit.com"}}
    end
    it 'should fix external link by adding protocl' do
      @post = @posts[0]
      @id = @post.id.to_s
      post :update, {:id => @id, :around_the_web_post => {:title => 'mod-post2', :external_link => "www.reddit.com"}}
      AroundTheWebPost.find_by_id(@post.id).external_link.should == "http://www.reddit.com"
    end
  end
  describe 'admin atw posts create' do
    it 'should redirect with empty name' do
      post :create, { :around_the_web_post => {:title => '', :external_link => "http://www.reddit.com"}}
      response.body.should include("Title can't be blank")
    end
    it 'should redirect with nil name' do
      post :create, { :around_the_web_post => { :external_link => "http://www.reddit.com"}}
      response.body.should include("Title can't be blank")
    end
    it 'should create properly' do
      post :create, { :around_the_web_post => {:title => 'modd-post3', :external_link => "http://www.reddit.com"}}
    end
    it 'should fix external link by adding protocl' do
      post :create, {:around_the_web_post => {:title => 'mod-post4', :external_link => "www.reddit.com"}}
      AroundTheWebPost.find_by_title("mod-post4").external_link.should == "http://www.reddit.com"
    end
  end
end
