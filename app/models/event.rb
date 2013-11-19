class Event < ActiveRecord::Base
  attr_accessible :name, :date, :description, :location, :time
  validates_presence_of :name
end
