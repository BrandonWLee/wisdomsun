# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
events = Event.create([{ name: 'Meditation Circle', date: 'September 4th to November 6th', description: '<strong>Contact:  info@wisdomsun.org</strong>

A meditation circle is a place to develop your practice through guidance in meditation and sharing your experience with other participants.


Session Structure: The whole evening is held in mindfulness from when we enter to when we leave. We begin with making tea and meeting each other; followed by guided seated meditation and gentle movement meditation; sharing our personal experience and asking questions about meditation; and receiving instructions on various aspects of meditation, including:

    <ul type="circle">
    <li>How to support a regular meditation practice</li>
    <li>Mindful listening and speech in relationship</li>
    <li>Working with the breath, including instruction in Lower Belly Breathing</li>
    <li>Practice of the Tibetan Mind-Body Reboot</li>
    <li>Walking Meditation</li>
    <li>Bringing meditation practice off the cushion and into daily life</li>
    </ul>

If you are completely new to meditation, you are welcome! Please just let us know so we can send you a sheet with the basic points of practice. And if you are able to arrive 10 to 15 minutes early, we can talk together before class starts.

$120 for all 8 sessions, including recordings and materials', location: 'San Francisco', time: 'Wednesdays 2:30-5:00PM'}, { name: 'Wisdom Journey 2013 -- Fall 2013', date: 'December 6th to December 8th', description: 'In this series of our ongoing exploration into the wisdom that is innately present within each of us, we will be looking into the waves of apparent duality and their relationship with the underlying ocean of unity of Mahamudra awareness.

Our experience is full of these dualistic notions: happiness and suffering; good and bad; tension and relaxation; clarity and confusion; confidence and insecurity. How do we work with these feelings? How do they relate to our understanding of reality? What skillful methods can we practice in order to enhance our daily life experience?

We will explore these questions by connecting with our personal wisdom as it relates to our body, to the levels of our awareness, and to other people. Along the way, we will meditate, have dialogue, and deepen our connections with each other.

Out-of-town participation via mp3 is also available, and included with the mp3s is a 30-minute Q&A session with one of us.

Registration cost for the complete series of classes, plus recordings of all sessions: $200 ($20 per session)

Note: This is a more advanced class, so if you have not attended any of our classes before, please contact us before you come.', location: 'Santa Cruz', time: 'TBA'}])

# BOOKS
stars_book = Book.new({:title => 'Stars of Wisdom', :author => 'Khenpo Tsultrim Gyamtso', :description => "Teachings on the Noble Nagarjuna's Fundamental Wisdom of the Middle Way By Khenpo Tsultrim Gyamtso, translated by Ari Goldfield.\n Tibetan Buddhist master Khenpo Tsultrim Gyamtso is known for his joyful songs of realization and his spontaneous and skillful teaching style. In this book he explains how to gain clarity, peace, and wisdom through step-by-step analysis and meditation on the true nature of reality. He also introduces readers to the joy and profundity of yogic song, and reveals the power of aspiration prayers to inspire, transform, and brighten our hearts.", :purchase_url => 'https://www.google.com'})
stars_picture = File.new("./app/assets/images/books/starsofwisdom.jpg")
stars_book.picture = stars_picture
stars_picture.close
stars_book.save!

sun_book = Book.new({:title => 'The Sun of Wisdom', :author => 'Khenpo Tsultrim Gyamtso',  :description => "Teachings on the Noble Nagarjuna's Fundamental Wisdom of the Middle Way By Khenpo Tsultrim Gyamtso, translated by Ari Goldfield.\n The Fundamental Wisdom of the Middle Way was written in the second century and is one of the most important works of Nagarjuna, the pioneering commentator on the Buddha's teachings on the Madhyamika or Middle Way view. The subtle analyses presented in this treatise were closely studied and commented upon by many realized masters from the Indo-Tibetan Buddhist tradition. Using Nagarjuna's root text and the great modern master Ju Mipham's commentary as a framework, Khenpo Tsultrim Gyamtso explains the most important verse from each chapter in the text in a style that illuminates for modern students both the meaning of these profound teachings and how to put them into practice in a way that benefits both oneself and others.", :purchase_url => 'https://www.google.com'})
sun_picture = File.new("./app/assets/images/books/thesunofwisdom.jpg")
sun_book.picture = sun_picture
sun_picture.close
sun_book.save!

freeing_book = Book.new({:title => 'Freeing the Body Freeing the Mind', :author => 'Robert Thurman', :description => "Writings on the Connections between Yoga and Buddhism Edited by Michael Stone Foreword by Robert Thurman. \n In this collection of provocative essays by prominent teachers of Yoga and Buddhism, the common ground of these two ancient traditions becomes clear. Michael Stone has brought together a group of intriguing voices to show how Buddhism and Yoga share the same roots, the same values, and the same spiritual goals. The themes addressed here are rich and varied, yet the essays all weave together the common threads between the traditions that offer guidance toward spiritual freedom and genuine realization. Contributors include Ajahn Amaro Bhikkhu, Shosan Victoria Austin, Frank Jude Boccio, Christopher Key Chapple, Ari Goldfield and Rose Taylor, Chip Hartranft, Roshi Pat Enkyo O'Hara, Sarah Powers, Eido Shimano Roshi, Jill Satterfield, Mu Soeng, Michael Stone, and Robert Thurman.", :purchase_url => 'https://www.google.com'})
freeing_picture = File.new("./app/assets/images/books/freeingthebodyfreeingthemind.jpg")
freeing_book.picture = freeing_picture
freeing_picture.close
freeing_book.save!

# Album
retreat = Album.new(:description => "The first Wisdom Sun retreat was held in Shingle Springs, California. We were incredibly fortunate to have the use of our friends' house that provided the ideal retreat environment-beautiful, spacious, and secluded. Over five days, we studied and practiced together, indoors and outdoors. We had a refuge ceremony for four new Buddhist refugees, which was a truly wonderful and heartfelt ceremony. Together the retreatants practiced yoga, lujong, and meditation; studied and discussed the Dharma teachings; sang and danced; worked and played; and shared stories and experiences both difficult and delightful.")
retreat_id = retreat.id
retreat.name = 'Shingle Springs Retreat' 
retreat_cover = File.new("./app/assets/images/photos/1-4.jpg")
retreat.album_cover = retreat_cover
retreat_cover.close
retreat.save!

holiday = Album.new(:name => 'Holiday, Cornwall, UK 2005', :description => "These photos were taken on a five-day holiday that Khenpo Rinpoche took with Ari, Rose, and Bridget Taylor, between his teachings in the UK and going to Dechen Choling in France. It was a magical time singing and dancing at the ancient sites of Cornwall such as Tintagel (King Arthur's castle ruins on a beautiful and rugged promontory) and hanging out eating pasties in the crowded tourist spots of Newquay. Khenpo Rinpoche particularly enjoyed King Arthur's castle, which he spoke about for many months afterwards, and also Saint Michael's Mount, a castle built on a little island, which Rinpoche praised as the most beautiful seaside garden in the world. He has certainly seen many, so that is a pretty reliable endorsement!")
holiday_id = holiday.id
holiday_cover = File.new("./app/assets/images/photos/2-5.jpg")
holiday_cover.close
holiday.save!

# Photos 

(1...10).each do |num|
  retreat1 = Photo.new(:album_id => 1, :description => "Meep!")
  pic = File.new("./app/assets/images/photos/1-#{num}.jpg")
  retreat1.picture = pic
  retreat1.save!  
end

(1...7).each do |num| 
  holiday1 = Photo.new(:album_id => 2, :description => "Meep!")
  pic = File.new("./app/assets/images/photos/2-#{num}.jpg")
  holiday1.picture = pic
  holiday1.save!  
end

# USERS AND ADMIN
admin = User.create!({:email => 'admin@wisdomsun.org', :password => 'password'})
admin.toggle!(:admin)
user = User.create!({:email => 'user@wisdomsun.org', :password => 'password'})
