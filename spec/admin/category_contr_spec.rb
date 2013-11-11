require 'spec_helper'
require 'factory_girl'

FactoryGirl.define do
	factory :user do
		admin false
	end
end

describe Admin::CategoriesController do
	
	it "should redirect to '/' after post destroy" do

		get :new
		
	end
end