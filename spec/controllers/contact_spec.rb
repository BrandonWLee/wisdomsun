require 'spec_helper'

describe ContactController do
  describe 'the create controller method' do
    it 'gives a notice for filling in and submitting the form' do
      post :create, :contact => {:name => "Batman", :email => "gothamrules@gmail.com",
:subject => "Joker is back", :text => "Calling Bat family"}
      flash[:notice].should == "Information submitted"
      response.should redirect_to '/contact'
    end
  end
  describe 'the sad path of the create controller method' do
    it 'gives an error notice for not filling in a field' do
      post :create, :contact => {:name => "Batman", :email => "gothamrules@gmail.com", :text => "Calling Bat family"}
      flash[:notice].should == "Error, you must fill in the whole form to submit"
      response.should redirect_to '/contact'
    end
  end
end
