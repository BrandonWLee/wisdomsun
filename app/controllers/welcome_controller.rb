class WelcomeController < ApplicationController
  def index
    @sliders = Slider.all
    @events = Event.mostRecent(5)
    @quote = Quote.last
    @around_the_web_posts = AroundTheWebPost.last(5).reverse
  end
end
