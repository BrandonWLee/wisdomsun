class Event < ActiveRecord::Base
  attr_accessible :name, :date, :description, :location, :time, :created_at
  validates_presence_of :name

  def self.mostRecent(x)
  	return Event.order("created_at").reverse[0,5]
  end

end
