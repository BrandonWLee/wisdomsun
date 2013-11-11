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
    @mail = Mail.new(
      :from => params[:contact][:email],
      :to => 'kdipasupil@berkeley.edu',
      :subject => params[:contact][:subject],
      :body => params[:contact][:text]
    )

    flash[:notice] = ("Information submitted")
    redirect_to '/contact'
  end
end
