require 'spec_helper'
require 'factory_girl'


describe Users::SessionsController do
	include Devise::TestHelpers
	describe "POST create" do
		it "should go to admin dashboard if it is admin" do
			user = double('user')
			user.stub(:to_key).and_return(1)
			user.stub(:authenticatable_salt).and_return(1)
			user.stub(:admin?).and_return(true)
      user.stub(:created_at?).and_return(Time.now)
			request.env["warden"].stub :authenticate! => user
			controller.stub :current_user => user
			@request.env["devise.mapping"] = Devise.mappings[:user]
			post :create
			response.should redirect_to('/admin/dashboard')
		end
		it "shouldn't go to admin dashboard if it is not admin" do
      user = FactoryGirl.build('user')
			user.stub(:to_key).and_return(1)
			user.stub(:authenticatable_salt).and_return(1)
			user.stub(:admin?).and_return(false)
      user.stub(:created_at?).and_return(Time.now)
			request.env["warden"].stub :authenticate! => user
			controller.stub :current_user => user
			@request.env["devise.mapping"] = Devise.mappings[:user]
			post :create
			response.should_not redirect_to('/admin/dashboard')
		end
	end

	it "should do something when it posts new" do
		user = double('user')
		user.stub(:to_key).and_return(1)
		user.stub(:authenticatable_salt).and_return(1)
		user.stub(:admin?).and_return(true)
		request.env["warden"].stub :authenticate! => user
		controller.stub :current_user => user
		@request.env["devise.mapping"] = Devise.mappings[:user]
		post :new
		response.should render_template('devise/sessions/new')
	end

	it "should redirect to '/' after post destroy" do
		user = double('user')
		user.stub(:to_key).and_return(1)
		user.stub(:authenticatable_salt).and_return(1)
		user.stub(:admin?).and_return(true)
		request.env["warden"].stub :authenticate! => user
		controller.stub :current_user => user
		@request.env["devise.mapping"] = Devise.mappings[:user]
		post :destroy
		response.should redirect_to('/')
	end
end
