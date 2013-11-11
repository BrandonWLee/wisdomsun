require 'mail'

class ContactController < ApplicationController
  def index
    # default: render 'index' template
  end

  def create
    if params[:contact][:name].nil? || params[:contact][:email].nil? || params[:contact][:subject].nil? || params[:contact][:text].nil?
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

    @mail.delivery_method :sendmail
    @mail.deliver
    flash[:notice] = ("Information submitted")
    redirect_to '/contact'
  end
end
