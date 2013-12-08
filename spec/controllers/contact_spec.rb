require 'spec_helper'

describe ContactController do
  before :each do
    ActionMailer::Base.deliveries.clear
  end

  describe 'the create controller method' do
    it 'gives a notice for filling in and submitting the form' do
      post :create, :contact => {:name => "Batman", :email => "gothamrules@gmail.com",
:subject => "Joker is back", :text => "Calling Bat family"}
      flash[:notice].should == "Information submitted"
      response.should redirect_to '/contact'
      last_email.from.should == ["gothamrules@gmail.com"]
      last_email.subject.should == "'Joker is back' from Batman"
      last_email.body.should == 'Calling Bat family'
    end
    it 'sends a copy email to the user when selecting the checkbox' do
      post :create, :contact => {:name => "Batman", :email => "gothamrules@gmail.com",
:subject => "Joker is back", :text => "Calling Bat family"}, :receive_email => "1"
      flash[:notice].should == "Information submitted"
      response.should redirect_to '/contact'
      last_email.from.should == [ENV["SMTP_USERNAME"]]
      last_email.subject.should == "'Copy of 'Joker is back' email' from Batman"
      last_email.body.should == 'Calling Bat family'
    end
  end

  describe 'the sad paths of the create controller method' do
    it 'gives an error notice for not filling in a field' do
      post :create, :contact => {:name => "Batman", :email => "gothamrules@gmail.com", :text => "Calling Bat family"}
      flash[:notice].should == "Error, you must fill in the whole form to submit"
      response.should redirect_to '/contact'
      last_email.should be_nil
    end
    it 'gives an error notice for not giving a valid email address' do
      post :create, :contact => {:name => "Batman", :email => "AlfredPennyworth", :subject => "Master Damien is gone", :text => "Calling Bat family"}
      flash[:notice].should == "Error, you must enter a valid email address to submit"
      response.should redirect_to '/contact'
      last_email.should be_nil
    end
  end
end
