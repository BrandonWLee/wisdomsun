require 'mail'

class ContactController < ApplicationController
  def index
    # default: render 'index' template
  end

  def create
    # make sure all the fields are filled in
    if contactIsNil(params[:contact]) || contactIsEmptyStr(params[:contact])
      flash[:notice] = ("Error, you must fill in the whole form to submit")
      redirect_to '/contact'
      return
    end
    # make sure a valid email address was given
    if /<?\w+@\w+\.\w+>?$/.match(params[:contact][:email]).nil?
      flash[:notice] = ("Error, you must enter a valid email address to submit")
      redirect_to '/contact'
      return
    end

    UserMailer.contact_email(params[:contact][:name], params[:contact][:email], ENV["SMTP_USERNAME"],
      params[:contact][:subject], params[:contact][:text]).deliver

    if params[:receive_email].to_i == 1
      UserMailer.contact_email(params[:contact][:name], ENV["SMTP_USERNAME"], params[:contact][:email], 
        "Copy of '#{params[:contact][:subject]}' email", params[:contact][:text]).deliver
    end

    flash[:notice] = ("Information submitted")
    redirect_to '/contact'
  end

  def contactIsNil(contact)
    contact[:name].nil? || contact[:email].nil? || contact[:subject].nil? || contact[:text].nil? 
  end

  def contactIsEmptyStr(contact)
    contact[:name].strip.empty? || contact[:email].strip.empty? || contact[:subject].strip.empty? || contact[:text].strip.empty?
  end
end
