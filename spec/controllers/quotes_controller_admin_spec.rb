require 'spec_helper'  
require 'factory_girl'

describe Admin::QuotesController do
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
    Quote.all.each do |quote|
      quote.destroy
    end
    @quotes = Quote.create!( [{:quote=> "first-quote", :source=>"http://www.google.com"},
           {:quote=> "second-quote", :source=>"http://www.yahoo.com"}]  )
  end

  after(:all) do
    @quotes.each do |quote|
      quote.destroy
    end
  end

  describe 'admin atw quotes index page' do
    it 'should show all of the quotes' do
      get :index
      @quotes.each do |quote| 
        response.body.should include(quote.quote)
      end
    end
  end
  describe 'admin atw quotes edit page' do 
    it 'should be able render edit page' do
      @quote = @quotes[0]
      get :edit, {:id => @quote.id.to_s}
      response.should be_success
    end
    it 'should redirect if quote does not exist' do
      Quote.should_receive(:exists?).with(15.to_s).and_return(false)
      get :edit, {:id => 15.to_s}
      response.should redirect_to('/admin/quotes')
    end
  end
  describe 'admin atw quotes update' do
    it 'should fail with empty name' do
      @quote = @quotes[0]
      @id = @quote.id.to_s
      post :update, {:id => @id, :quote => {:quote => '', :source => "http://www.reddit.com"}}
      response.body.should include("Quote can't be blank")
    end
    it 'should update properly' do
      @quote = @quotes[0]
      @id = @quote.id.to_s
      post :update, {:id => @id, :quote => {:quote => 'mod-quote', :source => "http://www.reddit.com"}}
    end
  end
  describe 'admin atw quotes create' do
    it 'should redirect with empty name' do
      post :create, { :quote => {:quote => '', :source => "http://www.reddit.com"}}
      response.body.should include("Quote can't be blank")
    end
    it 'should redirect with nil name' do
      post :create, { :quote => { :source => "http://www.reddit.com"}}
      response.body.should include("Quote can't be blank")
    end
    it 'should create properly' do
      post :create, { :quote => {:quote => 'modd-quote', :source => "http://www.reddit.com"}}
    end
  end
end

