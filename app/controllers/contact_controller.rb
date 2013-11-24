require 'mail'

class ContactController < ApplicationController
  def index
    # default: render 'index' template
  end

  def create
    if params[:contact][:name].nil? || params[:contact][:email].nil? || params[:contact][:subject].nil? || params[:contact][:text].nil?  || params[:contact][:name].empty? || params[:contact][:email].empty? || params[:contact][:subject].empty? || params[:contact][:text].empty?
      flash[:notice] = ("Error, you must fill in the whole form to submit")
      redirect_to '/contact'
      return
    end

    UserMailer.contact_email(params[:contact][:name], params[:contact][:email], params[:contact][:subject], params[:contact][:text]).deliver

    flash[:notice] = ("Information submitted")
    redirect_to '/contact'
  end
end
