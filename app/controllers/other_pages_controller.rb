class OtherPagesController < ApplicationController
  def show
    page = OtherPage.where(:id => params[:id]).first
    @title = page.title
    @htmlbody = page.body
  end
end
