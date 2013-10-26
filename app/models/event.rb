class Event < ActiveRecord::Base
  attr_accessible :name, :date, :description, :location, :time
end
