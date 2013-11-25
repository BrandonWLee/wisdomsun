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
  describe 'the empty form sad path of the create controller method' do
    it 'gives an error notice for not filling in a field' do
      post :create, :contact => {:name => "Batman", :email => "gothamrules@gmail.com", :text => "Calling Bat family"}
      flash[:notice].should == "Error, you must fill in the whole form to submit"
      response.should redirect_to '/contact'
    end
  end
  describe 'the invalid email sad path of the create controller method' do
    it 'gives an error notice for not giving a valid email address' do
      post :create, :contact => {:name => "Batman", :email => "AlfredPennyworth", :subject => "Master Damien is gone", :text => "Calling Bat family"}
      flash[:notice].should == "Error, you must enter a valid email address to submit"
      response.should redirect_to '/contact'
    end
  end
end
