class AroundTheWebPost < ActiveRecord::Base
   attr_accessible :title, :external_link, :commentary
   validates_presence_of :title
   validates_presence_of :external_link
end
