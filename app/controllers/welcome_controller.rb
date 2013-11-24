class WelcomeController < ApplicationController
  def index
    @events = Event.all
    #@quote = Quote.last
    #@around_the_web_posts = AroundTheWebPost.last(5).reverse
  end
end
