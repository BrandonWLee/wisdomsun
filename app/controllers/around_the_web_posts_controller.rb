class AroundTheWebPostsController < ApplicationController
  def index
    @posts = AroundTheWebPost.order("created_at DESC")
  end
end
