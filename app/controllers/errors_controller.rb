class ErrorsController < ApplicationController
  def routing
   render "404", :status => 404
  end
end
