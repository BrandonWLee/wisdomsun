# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
events = Event.create([{ name: 'Meditation Circle', date: 'September 4th to November 6th', description: 'Contact:  info@wisdomsun.org

A meditation circle is a place to develop your practice through guidance in meditation and sharing your experience with other participants.


Session Structure: The whole evening is held in mindfulness from when we enter to when we leave. We begin with making tea and meeting each other; followed by guided seated meditation and gentle movement meditation; sharing our personal experience and asking questions about meditation; and receiving instructions on various aspects of meditation, including:

    How to support a regular meditation practice
    Mindful listening and speech in relationship
    Working with the breath, including instruction in Lower Belly Breathing
    Practice of the Tibetan Mind-Body Reboot
    Walking Meditation
    Bringing meditation practice off the cushion and into daily life

If you are completely new to meditation, you are welcome! Please just let us know so we can send you a sheet with the basic points of practice. And if you are able to arrive 10 to 15 minutes early, we can talk together before class starts.

$120 for all 8 sessions, including recordings and materials', location: 'San Francisco', time: 'Wednesdays 2:30-5:00PM'}, { name: 'Wisdom Journey 2013 -- Fall 2013', date: 'December 6th to December 8th', description: 'In this series of our ongoing exploration into the wisdom that is innately present within each of us, we will be looking into the waves of apparent duality and their relationship with the underlying ocean of unity of Mahamudra awareness.

Our experience is full of these dualistic notions: happiness and suffering; good and bad; tension and relaxation; clarity and confusion; confidence and insecurity. How do we work with these feelings? How do they relate to our understanding of reality? What skillful methods can we practice in order to enhance our daily life experience?

We will explore these questions by connecting with our personal wisdom as it relates to our body, to the levels of our awareness, and to other people. Along the way, we will meditate, have dialogue, and deepen our connections with each other.

Out-of-town participation via mp3 is also available, and included with the mp3s is a 30-minute Q&A session with one of us.

Registration cost for the complete series of classes, plus recordings of all sessions: $200 ($20 per session)

Note: This is a more advanced class, so if you have not attended any of our classes before, please contact us before you come.', location: 'Santa Cruz', time: 'TBA'}])



books = [{:title => 'Kill la Kill', :author => 'Trigger', :picture => '1.jpg', :description => "power of nakedness"},
        {:title => 'Original Art', :author => 'Anonymous', :picture => '2.jpg', :description => "moe moe kyun~"},
        {:title => 'Madoka', :author => 'Shaft', :picture => '3.jpg', :description => "Do you want to make a wish?"},
          {:title => "Jojo's Bizarre Adventure", :author => 'Madhouse', :picture => '4.jpg', :description => "WRYYYYYYYYYYYYYY"},
          {:title => 'Aria', :author => 'Amano Kozue', :picture => '5.jpg', :description => "Greatest Manga Ever"}
     ]

books.each do |movie|
  Book.create!(movie)
end
