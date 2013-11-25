require 'spec_helper'

describe ApplicationController do
	include Devise::TestHelpers

	controller do
		def index
			authenticate_admin_user!
		end
	end

	it "Application Controller authenticate_admin_user! should redirect to root_path if not admin" do
		user = double('user')
		user.stub(:to_key).and_return(1)
		user.stub(:authenticatable_salt).and_return(1)
		user.stub(:admin?).and_return(false)
		request.env["warden"].stub :authenticate! => user
		controller.stub :current_user => user
		@request.env["devise.mapping"] = Devise.mappings[:user]
		get :index
		response.should redirect_to(root_path)
	end

	it "Application Controller authenticate_admin_user! should do default action and not redirect (and implicitely return nil)" do
		user = double('user')
		user.stub(:to_key).and_return(1)
		user.stub(:authenticatable_salt).and_return(1)
		user.stub(:admin?).and_return(true)
		request.env["warden"].stub :authenticate! => user
		controller.stub :current_user => user
		@request.env["devise.mapping"] = Devise.mappings[:user]
		controller.authenticate_admin_user!.should == nil
	end

	it "Application Controller current_admin_user should return nil if not admin" do
		user = double('user')
		user.stub(:to_key).and_return(1)
		user.stub(:authenticatable_salt).and_return(1)
		user.stub(:admin?).and_return(false)
		request.env["warden"].stub :authenticate! => user
		controller.stub :current_user => user
		@request.env["devise.mapping"] = Devise.mappings[:user]
		controller.current_admin_user.should == nil
	end

	it "Application Controller current_admin_user should return admin if logged in and user is admin" do
		user = double('user')
		user.stub(:to_key).and_return(1)
		user.stub(:authenticatable_salt).and_return(1)
		user.stub(:admin?).and_return(true)
		request.env["warden"].stub :authenticate! => user
		controller.stub :current_user => user
		@request.env["devise.mapping"] = Devise.mappings[:user]
		controller.current_admin_user.should == user
	end
end
