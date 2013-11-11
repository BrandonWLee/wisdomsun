require 'mail'

class ContactController < ApplicationController
  def index
    # default: render 'index' template
  end

  def create
    if params[:contact][:name].empty? || params[:contact][:email].empty? || params[:contact][:subject].empty? || params[:contact][:text].empty?
      flash[:notice] = ("Error, one or more fields are empty")
      redirect_to '/contact'
      return
    end
    @mail = Mail.new do
      from    params[:contact][:email]
      to      'kdipasupil@berkeley.edu'
      subject params[:contact][:subject]
      body    params[:contact][:text]
    end

    @mail.delivery_method :sendmail
    @mail.deliver
    redirect_to '/contact'
  end
end
