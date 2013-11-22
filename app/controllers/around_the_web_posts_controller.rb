class AroundTheWebPostsController < ApplicationController
  def index
    @posts = AroundTheWebPost.all
  end
end
