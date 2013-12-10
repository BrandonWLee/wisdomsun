class WelcomeController < ApplicationController
  def index
    @sliders = Slider.all
    @events = Event.mostRecent(5)
    @quote = Quote.order("created_at DESC").limit(1).first
    @around_the_web_posts = AroundTheWebPost.order("created_at DESC").limit(5)
  end
end
