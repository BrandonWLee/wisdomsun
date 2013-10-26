# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
events = Event.create({ name: 'Meditation Circle', date: 'September', description: 'Meet weekly for engaging meditating sessions', location: 'San Francisco'})



books = [{:title => 'Kill la Kill', :author => 'Trigger', :picture => '1.jpg', :description => "power of nakedness"},
    	  {:title => 'Original Art', :author => 'Anonymous', :picture => '2.jpg', :description => "moe moe kyun~"},
    	  {:title => 'Madoka', :author => 'Shaft', :picture => '3.jpg', :description => "Do you want to make a wish?"},
      	  {:title => "Jojo's Bizarre Adventure", :author => 'Madhouse', :picture => '4.jpg', :description => "WRYYYYYYYYYYYYYY"},
      	  {:title => 'Aria', :author => 'Amano Kozue', :picture => '5.jpg', :description => "Greatest Manga Ever"}
  	 ]

books.each do |movie|
  Book.create!(movie)
end
