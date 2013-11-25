#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

# USERS AND ADMIN
puts "Seeding Users and Admins"
admin = User.create!({:email => 'admin@wisdomsun.org', :password => 'password'})
admin.toggle!(:admin)
admin.toggle!(:forem_admin)
User.create!({:email => 'user@wisdomsun.org', :password => 'password'})

# EVENTS
puts "Seeding Events"
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


# FORUM
admin = Forem.user_class.first
user = Forem.user_class.all[1]
puts admin
puts "Seeding Forem::Category"
forum_category = Forem::Category.create! name: "General"
print forum_category 

puts "Seeding Forem::Forum (Admin)"
forum = Forem::Forum.new  description: "About Wisdom Sun", category_id: forum_category.id, name: "Wisdom Sun"


puts "Seeding Forem::Post (Admin)"
post = Forem::Post.new  text: "Admin Post"
post.user = admin

puts "Seeding Forem::Topic (Admin)"
topic = Forem::Topic.new subject: "Admin Topic"
topic.forum = forum
topic.user = admin
topic.posts = [post]
topic.save!

puts user
puts "Seeding Forem::Post (User)"
post = Forem::Post.new  text: "User Post"
post.user = user

puts "Seeding Forem::Topic (User)"
topic = Forem::Topic.new subject: "User Topic"
topic.forum = forum
topic.user = user
topic.posts = [post]
topic.save!
# BOOKS
puts "Seeding Books"
puts "..Stars of Wisdom.."
stars_book = Book.new({:title => 'Stars of Wisdom', :author => 'Khenpo Tsultrim Gyamtso', :description => "Teachings on the Noble Nagarjuna's Fundamental Wisdom of the Middle Way By Khenpo Tsultrim Gyamtso, translated by Ari Goldfield.\n Tibetan Buddhist master Khenpo Tsultrim Gyamtso is known for his joyful songs of realization and his spontaneous and skillful teaching style. In this book he explains how to gain clarity, peace, and wisdom through step-by-step analysis and meditation on the true nature of reality. He also introduces readers to the joy and profundity of yogic song, and reveals the power of aspiration prayers to inspire, transform, and brighten our hearts.", :purchase_url => 'https://www.google.com'})
stars_picture = File.new("./app/assets/images/books/starsofwisdom.jpg")
stars_book.picture = stars_picture
stars_book.save!
stars_picture.close

puts "..The Sun of Wisdom.."
sun_book = Book.new({:title => 'The Sun of Wisdom', :author => 'Khenpo Tsultrim Gyamtso',  :description => "Teachings on the Noble Nagarjuna's Fundamental Wisdom of the Middle Way By Khenpo Tsultrim Gyamtso, translated by Ari Goldfield.\n The Fundamental Wisdom of the Middle Way was written in the second century and is one of the most important works of Nagarjuna, the pioneering commentator on the Buddha's teachings on the Madhyamika or Middle Way view. The subtle analyses presented in this treatise were closely studied and commented upon by many realized masters from the Indo-Tibetan Buddhist tradition. Using Nagarjuna's root text and the great modern master Ju Mipham's commentary as a framework, Khenpo Tsultrim Gyamtso explains the most important verse from each chapter in the text in a style that illuminates for modern students both the meaning of these profound teachings and how to put them into practice in a way that benefits both oneself and others.", :purchase_url => 'https://www.google.com'})
sun_picture = File.new("./app/assets/images/books/thesunofwisdom.jpg")
sun_book.picture = sun_picture
sun_book.save!
sun_picture.close

puts "..Freeing the Body Freeing the Mind.."
freeing_book = Book.new({:title => 'Freeing the Body Freeing the Mind', :author => 'Robert Thurman', :description => "Writings on the Connections between Yoga and Buddhism Edited by Michael Stone Foreword by Robert Thurman. \n In this collection of provocative essays by prominent teachers of Yoga and Buddhism, the common ground of these two ancient traditions becomes clear. Michael Stone has brought together a group of intriguing voices to show how Buddhism and Yoga share the same roots, the same values, and the same spiritual goals. The themes addressed here are rich and varied, yet the essays all weave together the common threads between the traditions that offer guidance toward spiritual freedom and genuine realization. Contributors include Ajahn Amaro Bhikkhu, Shosan Victoria Austin, Frank Jude Boccio, Christopher Key Chapple, Ari Goldfield and Rose Taylor, Chip Hartranft, Roshi Pat Enkyo O'Hara, Sarah Powers, Eido Shimano Roshi, Jill Satterfield, Mu Soeng, Michael Stone, and Robert Thurman.", :purchase_url => 'https://www.google.com'})
freeing_picture = File.new("./app/assets/images/books/freeingthebodyfreeingthemind.jpg")
freeing_book.picture = freeing_picture
freeing_book.save!
freeing_picture.close

# Album
puts "Seeding Albums"
retreat = Album.new(:description => "The first Wisdom Sun retreat was held in Shingle Springs, California. We were incredibly fortunate to have the use of our friends' house that provided the ideal retreat environment-beautiful, spacious, and secluded. Over five days, we studied and practiced together, indoors and outdoors. We had a refuge ceremony for four new Buddhist refugees, which was a truly wonderful and heartfelt ceremony. Together the retreatants practiced yoga, lujong, and meditation; studied and discussed the Dharma teachings; sang and danced; worked and played; and shared stories and experiences both difficult and delightful.")
retreat_id = retreat.id
retreat.name = 'Shingle Springs Retreat' 
retreat_cover = File.new("./app/assets/images/photos/1-4.jpg")
retreat.album_cover = retreat_cover
retreat.save!
retreat_cover.close

holiday = Album.new(:name => 'Holiday, Cornwall, UK 2005', :description => "These photos were taken on a five-day holiday that Khenpo Rinpoche took with Ari, Rose, and Bridget Taylor, between his teachings in the UK and going to Dechen Choling in France. It was a magical time singing and dancing at the ancient sites of Cornwall such as Tintagel (King Arthur's castle ruins on a beautiful and rugged promontory) and hanging out eating pasties in the crowded tourist spots of Newquay. Khenpo Rinpoche particularly enjoyed King Arthur's castle, which he spoke about for many months afterwards, and also Saint Michael's Mount, a castle built on a little island, which Rinpoche praised as the most beautiful seaside garden in the world. He has certainly seen many, so that is a pretty reliable endorsement!")
holiday_id = holiday.id
holiday_cover = File.new("./app/assets/images/photos/2-5.jpg")
holiday.album_cover = holiday_cover
holiday.save!
holiday_cover.close


# Photos 
puts "Seeding Photos"
(1...10).each do |num|
  puts "..retreat #{num}"
  retreat1 = Photo.new(:album_id => 1, :description => "Meep!")
  pic = File.new("./app/assets/images/photos/1-#{num}.jpg")
  retreat1.picture = pic
  retreat1.save! 
  pic.close 
end

# Slider Images
puts "Seeding slider"
slider1 = Slider.new(:name => "Lineage", :link => "categories/2")
slider1_pic = File.new("./app/assets/images/sliders/1.jpg")
slider1.picture = slider1_pic
slider1.save!
slider1_pic.close

slider2 = Slider.new(:name => "Articles & Songs", :link => "otherPages/8")
slider2_pic = File.new("./app/assets/images/sliders/2.jpg")
slider2.picture = slider2_pic
slider2.save!
slider2_pic.close

slider3 = Slider.new(:name => "Albums", :link => "albums")
slider3_pic = File.new("./app/assets/images/sliders/2.jpg")
slider3.picture = slider3_pic
slider3.save!
slider3_pic.close

(1...2).each do |num| 
  puts "..holiday #{num}"
  holiday1 = Photo.new(:album_id => 2, :description => "Meep!")
  pic = File.new("./app/assets/images/photos/2-#{num}.jpg")
  holiday1.picture = pic
  holiday1.save!  
  pic.close
end

# QUOTES
puts "Seeding Quotes"
Quote.create!({:quote => "There is a sense of joy in being part of this knowledge and that sense of joy, which triggers the transition from knowledge to wisdom, is compassion, or unconditional love.", :source => "Chogyam Trungpa Rinpoche"})

# AROUND THE WEB
puts "Seeding Around the Web Posts"
AroundTheWebPost.create!({:title => "Wisdom Sun's Facebook page", :external_link => "http://www.facebook.com/widomsunsf"})
AroundTheWebPost.create!({:title => "Let Loose; Conversations with and about Contemporary Teachers", :external_link => "http://www.chronicleproject.com/chroniclesradio_letloose/ll_2011_05_08.html"})

# ABOUT CATEGORY AND PAGES
puts "Seeding About category and pages"
about_category = Category.create({ :position => 0, :name => 'About', :refactored_name => 'about'})
about_ari = OtherPage.create({ :category_id => 1, :title => 'About Ari Goldfield' , :refactored_title => 'about_ari_goldfield', :body => %Q{<p> Ari Goldfield is a Buddhist teacher. He had the unique experience of being continuously in the training and service of his own teacher, Khenpo Tsultrim Gyamtso Rinpoche, for eleven years. From 1998-2009, Ari served as Khenpo Rinpoche's translator and secretary, accompanying Rinpoche on seven round-the-world teaching tours. Ari received extensive instruction from Rinpoche in Buddhist philosophy, meditation, and teaching methods, and meditated under Rinpoche's guidance in numerous retreats. In 2006, Khenpo Rinpoche sent Ari on his own tour to teach philosophy, meditation, and yogic exercise in Europe, North America, and Asia. In 2007, Ari moved with Rinpoche to Seattle, where he served and helped care for him until Rinpoche moved back to Nepal in 2009. Ari now teaches in Rinpoche's Karma Kagyu lineage, with the blessings of the head of the lineage, H.H. the 17th Gyalwang Karmapa, and of Khenpo Rinpoche. </p> <p> Ari is also a published translator and author of books, articles, and numerous songs of realization and texts on Buddhist philosophy and meditation. These include Khenpo Rinpoche's books Stars of Wisdom, The Sun of Wisdom, and Rinpoche's Song of the Eight Flashing Lances teaching, which appeared in The Best Buddhist Writing 2007. He is a contributing author of Freeing the Body, Freeing the Mind: Writings on the Connections Between Yoga and Buddhism. </p> <p> Ari studied Buddhist texts in Tibetan and Sanskrit at Buddhist monasteries in Nepal and India, and at the Central Institute for Higher Tibetan Studies in India. In addition to translating for Khenpo Rinpoche, he has also served as translator for H.H. Karmapa, Tenga Rinpoche, and many other Tibetan teachers. From 2007-11, Ari served as president of the Marpa Foundation, a nonprofit organization initiated by Khenpo Rinpoche that supports Buddhist translation, nunneries in Bhutan and Nepal, and other Buddhist activities. Ari holds a BA from Harvard College and a JD from Harvard Law School, both with honors. </p> <p> Ari married Rose Taylor Goldfield in 2008 while on semi-retreat with Khenpo Rinpoche. They currently teach internationally from their home base in San Francisco under the auspices of Wisdom Sun, the practice and study community they established together in 2011. </p>}})
about_rose = OtherPage.create({ :category_id => 1, :title => 'About Rose Taylor Goldfield' , :refactored_title => 'about_rose_goldfield', :body => %Q{<p>Rose Taylor Goldfield is a second-generation Buddhist teacher in the Karma Kagyu lineage, with the blessing of His Holiness the 17th Gyalwang Karmapa and her teacher Khenpo Tsultrim Gyamtso Rinpoche. She teaches Buddhist meditation, philosophy, yogic exercise and dance, and classical Tibetan language. </p> <p> Rose has written and translated books, articles, and numerous songs of realization, including Khenpo Rinpoche's book Stars of Wisdom and a chapter in Freeing the Body, Freeing the Mind: Writings on the Connection Between Yoga and Buddhism. She holds an MA in Indo-Tibetan Buddhist studies from Naropa University. Rose grew up in a Buddhist household, her mother first practiced in the Theravadin tradition and lived in Thailand for many years and later became a Tibetan Buddhist practitioner after meeting Chogyam Trungpa Rinpoche in 1968. </p> <p> Having studied and practiced extensively in the Shambhala lineage, Rose began training under Khenpo Rinpoche's close guidance in 2002. He sent her on numerous extensive practice and study retreats. In 2005, he appointed her teacher to his nuns in Bhutan and Nepal. She taught the nuns Tibetan Buddhist philosophical texts and meditation, and was a teacher at the ten-week program for international students at Jamgon Kongtrul Rinpoche's monastery in Nepal. From 2007-9, Rose attended Khenpo Rinpoche daily while living with him in semi-retreat in Seattle. In 2007, Khenpo Rinpoche appointed her to a full-time position with Marpa Foundation, where she served as vice-president and secretary until 2011. </p> <p> Rose married Ari Goldfield in 2008 while on semi-retreat with Khenpo Rinpoche. They currently teach internationally from their home base in San Francisco under the auspices of Wisdom Sun, the practice and study community they established together in 2011. </p>}})
about_about = OtherPage.create({ :category_id => 1, :title => 'About' , :refactored_title => 'about', :body => %Q{<p> Wisdom Sun is about bringing Buddhist meditation teachings home: Home to our own culture and locale; home to our daily life; home to our mind, body, and heart. </p> <p> Bringing meditation home, we learn to live fully and fearlessly, with joy, humor, and love. We begin to genuinely connect with who we are as individuals, and strengthen and enrich our relationships with others. We develop a clarity and depth of awareness-wisdom-imbued with warmth-like the light of the sun. </p> <p> <strong>Inquiry and Transformative Discovery</strong> </p> <p> One of the extraordinary qualities we possess as human beings is that of self-reflection. "Who am I, really?" "What am I actually doing here?" "What is life really all about?" are timeless human questions. The motives for asking them can include experiences of pain and confusion; a desire to search for more meaning in life; or simply a sense of curiosity about what is true beneath the surface of things as they appear to us. </p> <p> These questions are the starting point of Buddhism's "wisdom teachings," which explain how to make this kind of inner inquiry become a path of transformative discovery. </p> <p> To be genuinely transformative, this path needs to be much more than just dry philosophy or abstract speculation. When we open all of our mind, body, and heart to our inquiry and meditative experience, we begin to discover something profound and amazing. </p> <p> The quality of this discovery is difficult to describe, yet it is directly felt. It is spacious and transcendent, yet immediate and personal. It is at the heart of what Buddhism's yogic tradition has been passing down from teacher to disciple for generations. Experiencing it makes it so much easier to feel true happiness, to be at peace, to relate to others-to live in a way that feels like we fit well in our life. We begin to feel an innate sense of self-worth, and to see that our daily worries, struggles, preoccupations, and fears do not define us. This gives us an anchor in this uncertain, changing world-a genuine sense of confidence that whatever happens in life, we are going to be just fine. </p> <p> This is not about ecstasy or feeling superhuman-it is calm, deep, genuine, and joyful. It is open; it is bright and alive; and it naturally emanates warmth and love. This is the Wisdom Sun. </p> <p> The best thing of all is that the Wisdom Sun is already fully present within us-it is our authentic nature. So we do not need to struggle to acquire or achieve it. We simply need to learn how to open to its natural presence in our body, mind, and heart. </p> <p> <strong>A Common Path Practiced by Individual People</strong> </p> <p> As an organization, Wisdom Sun is about a path of Buddhist meditation practice focusing on the wisdom teachings, and about a community of individuals who share the longing to learn, practice, and develop along this path. The path and the community are equally important-Wisdom Sun honors and respects both the universality of the teachings and the individuality of the people practicing them. </p> <p> <strong>The Path: Teachers and Teachings</strong> </p> <p> Wisdom Sun's path of Buddhist practice is grounded in the extensive teachings given to us over the course of many years, often in a personal one-on-one context, by our spiritual guide, the Tibetan master Khenpo Tsultrim Gyamtso Rinpoche. During his teaching career, Khenpo Rinpoche was renowned for his highly original, profound, and engaging presentation of the wisdom teachings. He was particularly revered for his teachings on the "view" of the true nature of reality. Khenpo Rinpoche presented this view in a series of progressive stages, providing a sound foundation for our understanding and meditative experience to gradually develop and mature. </p> <p> These stages begin with the question "Who am I, really?" and an exploration of the true nature of the individual. They move on to examine the nature of the phenomenal world in which the individual lives, as described in the different levels of teachings on emptiness and prajna-paramita (transcendent wisdom). They culminate in the highest teachings on the true nature of the psycho-physical continuum, found in the Mahamudra (Great Seal), Dzogchen (Great Completeness), and Vajrayana (Adamantine Vehicle) traditions. </p> <p> Wisdom Sun's path of practice also owes a great deal to the teachings of Chogyam Trungpa Rinpoche, whose brilliant, rich, and eloquent expositions are an inconceivable treasure. Trungpa Rinpoche and Khenpo Rinpoche held each other in the highest esteem. </p> <p> <strong>A Spirit of Innovation</strong> </p> <p> These two masters, trained in the ancient Tibetan style yet teaching in the modern West, were fantastic innovators. Their primary loyalty was not to tradition for tradition's sake, but rather, to helping their students connect with their tradition's heart. Their openness and willingness to engage with their students in a deeply intimate way produced a transmission of Buddhist teachings that was both original and true to its roots. </p> <p> We feel that this spirit of innovation is part of the tradition our teachers have passed down to us. We seek not to simply repeat the teachings we have heard, but to continually consider how we can make the teachings fresh, accessible, and meaningful for people. And we are open to the wisdom and beauty of Western and Eastern traditions of the arts, sciences, and humanities for insights to help us do this. </p> <p> <strong>A Buddhist Path for Mind, Body, and Heart</strong> </p> <p> In this day and age, we often live and work in a way that our intellect is highly active and constantly stimulated, but not necessarily in a way that feels very balanced or connected with our body and heart. Meditative practice helps restore this balance and connection, and the resulting experiences of grounding and opening are wonderful. Rather than just speaking or thinking of wisdom, we come to actually embody it. </p> <p> This is why Wisdom Sun's path of practice encourages body-based meditation, including lujong (Tibetan Buddhist Yoga), singing yogic songs of realization, and Buddhist dance. These practices are profound, enjoyable, and easy to learn for people of all ages and levels of physical ability. </p> <p> <strong>Reconnecting with Tradition: Meditation Practices for a Community of Individuals</strong> </p> <p> Another key feature of this modern environment is that the community of Buddhist practitioners is a group of individuals. We aspire to have shared goals and purpose that fosters a strong community, but without asking people to sacrifice themselves for "higher purposes." Having a healthy balance between community and individuality is positive and inspiring. </p> <p> One way to achieve this balance is for people to have the opportunity to receive regular individual practice guidance. With this, we can insure that the clarity and warmth of the practices meet each of us where we need it most. This makes the path feel genuine and authentic, so we do not feel we are just practicing by rote, in isolation, or mindlessly following the herd. It allows for us to manifest the qualities of enlightenment in our own personal way. </p> <p> A relationship of regular personal contact between teacher and student is in harmony with how Buddhism was traditionally practiced. And Buddhism's high esteem for individuality appears in the teachings on the different enlightened qualities of the five Buddha families, which are born from the different psycho-physical make-up of each individual. These qualities become endangered, however, when Buddhist practice gets too uniform and monolithic; when people feel that they are forced to fit themselves into a cookie-cutter style of meditation where "one size fits all", rather than getting the help they need to figure out what the meditation teachings truly mean for them. That is why in-depth, individual practice guidance can be so beneficial. </p> <p> <strong>Wisdom Sun's Offering</strong> </p> <p> Wisdom Sun offers an invitation to individuals to be able to participate in its community, and by participating, to grow into who we actually are. In our world there is so much hesitation, uncertainty, and tension that there is not always much chance for us to do this. But it is possible to celebrate individuality without ego-clinging; and to allow our individual nature to manifest and have its own ground that is stable, open, and filled with love. </p> <p> With this emphasis, Wisdom Sun becomes a community that is fulfilling. It becomes something that we can take with us wherever we go. We learn to shine our light of wisdom and warmth, in ourselves and in our world. </p>}})    

puts "Seeding Lineage category and pages"
lineage_category = Category.create!({:position => 1, :name => 'Lineage', :refactored_name => 'lineage'})
linear_p1 = OtherPage.create!({:category_id => 2, :title => "Lineage Pg1", :refactored_title => "lineage_pg1", :body => "Random filler text for now."})
linear_p2 = OtherPage.create!({:category_id => 2, :title => "Lineage Pg2", :refactored_title => "lineage_pg2", :body => "Random filler text for now."})
linear_p3 = OtherPage.create!({:category_id => 2, :title => "Lineage Pg3", :refactored_title => "lineage_pg3", :body => "Random filler text for now."})

puts "Seeding Downloads category and pages"
downloads_category = Category.create!({:position => 2, :name => 'Downloads', :refactored_name => 'downloads'})
d_p1 = OtherPage.create!({:category_id => 3, :title => "Free Downloads", :refactored_title => "free_downloads", :body => "<h4 style=\"font-size: 1.3077em; line-height: 1.3em; font-weight: normal; color: #971500; font-style: italic; margin-top: 0.909em; margin-bottom: 0.909em;\">Audio Dharma Teachings</h4>
<ul>
<li><a href=\"http://www.wisdomsun.org/images/audio/20110710-Ari_Goldfield-IMC-guided_earth_grounding_meditation.mp3\" style=\"color: #d55e34;\">Guided Earth Grounding Meditation - Ari Goldfield</a> (mp3)</li>
<li><a href=\"http://www.wisdomsun.org/images/audio/20110710-Ari_Goldfield-IMC-the_true_nature_of_mind.mp3\" style=\"color: #d55e34;\">The Nature of Mind - Ari Goldfield</a> (mp3)</li>
</ul>
<h4 style=\"font-size: 1.3077em; line-height: 1.3em; font-weight: normal; color: #971500; font-style: italic; margin-top: 0.909em; margin-bottom: 0.909em;\">Stars of Wisdom Teachings</h4>
<p>Given in Halifax, Canada, May 28-30, 2010</p>
<ul>
<li><a href=\"http://www.wisdomsun.org/images/audio/StarsOfWisdom1-PurePerceptionAndNaturalConfidence--AriGoldfield.mp3\" style=\"color: #d55e34;\">Pure Perception and Natural Confidence—Ari Goldfield</a> (mp3)</li>
<li><a href=\"http://www.wisdomsun.org/images/audio/StarsOfWisdom2-SelflessnessViewAndMeditation--RoseTaylor.mp3\" style=\"color: #d55e34;\">Selflessness View and Meditation—Rose Taylor</a> (mp3)</li>
<li><a href=\"http://www.wisdomsun.org/images/audio/StarOfWisdom3-MilarepaLifeStoryAndSongs--AriGoldfield.mp3\" style=\"color: #d55e34;\">Transforming Suffering into Enlightenment: The Story and Songs of Milarepa—Ari Goldfield</a> (mp3)</li>
<li><a href=\"http://www.wisdomsun.org/images/audio/StarsOfWisdom4-Mind-OnlyViewAndMeditation--RoseTaylor.mp3\" style=\"color: #d55e34;\">Mind-Only View and Meditation—Rose Taylor</a> (mp3)</li>
<li><a href=\"http://www.wisdomsun.org/images/audio/StarsOfWisdom5-WisdomCompassionAndAspirationPrayers--AriGoldfieldRoseTaylor.mp3\" style=\"color: #d55e34;\">Wisdom, Compassion, and Aspiration Prayers—Ari Goldfield &amp; Rose Taylor</a> (mp3)</li>
</ul>
<p> </p>
"})

d_p2 = OtherPage.create!({:category_id => 3, :title => "Articles, Songs and More", :refactored_title => "articles,_songs_and_more", :body => "<p>Click on the links below to hear songs in English and read Tibetan texts:</p>
<p> </p>
<h4 style=\"font-size: 1.3077em; line-height: 1.3em; font-weight: normal; color: #971500; font-style: italic; margin-top: 0.909em; margin-bottom: 0.909em;\">Songs</h4>
<ul>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/audio/Seven%20Ways%20Things%20Shine%20Inside%20and%20Out.mp3\" style=\"color: #d55e34;\">Seven Ways Things Shine Inside And Out</a> (mp3)</li>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/audio/05%20Eighteen%20Kinds%20Of%20Yogic%20Joy.mp3\" style=\"color: #d55e34;\">Eighteen Kinds Of Yogic Joy</a> (mp3)</li>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/audio/08%20Auspiciousness%20That%20Lights%20Up%20The%20Universe.mp3\" style=\"color: #d55e34;\">Auspiciousness That Lights Up The Universe</a> (mp3)</li>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/audio/Cornwall%20Offering%20Song.mp3\" style=\"color: #d55e34;\">Cornwall Offering Song</a> (mp3)</li>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/pdf/cornwall-offering-song.pdf\" style=\"color: #d55e34;\">Cornwall Offering Song</a> (pdf)</li>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/audio/A%20Prayer%20that%20these%20True%20Words%20be%20Swiftly%20Fulfilled.mp3\" style=\"color: #d55e34;\">A Prayer that these True Words be Swiftly Fulfilled</a> (mp3)</li>
<li style=\"padding: 0px; margin: 8px 0;\"><a href=\"http://www.wisdomsun.org/images/pdf/a-prayer-that-these-true-words-be-swiftly-fulfilled-te.pdf\" style=\"color: #d55e34;\">A Prayer that these True Words be Swiftly Fulfilled</a> (pdf)</li>
</ul>
<ul>
</ul>
<h4 style=\"font-size: 1.3077em; line-height: 1.3em; font-weight: normal; color: #971500; font-style: italic; margin-top: 0.909em; margin-bottom: 0.909em;\">Articles</h4>
<ul>
<li><a href=\"http://www.wisdomsun.org/images/pdf/stages-of-view-at-the-heart-of-definitive-meaning-root-verses-english.pdf\" style=\"color: #d55e34;\">Stages of View at the Heart of Definitive Meaning - Root Verses - English</a></li>
<li><a href=\"http://www.wisdomsun.org/images/pdf/stages-of-view-at-the-heart-of-definitive-meaning-root-verses-tibetan.pdf\" style=\"color: #d55e34;\">Stages of View at the Heart of Definitive Meaning - Root Verses - Tibetan</a></li>
<li><a href=\"http://www.wisdomsun.org/images/pdf/bd-bookreview-by-ari-goldfield-life-of-milarepa-book.pdf\" style=\"color: #d55e34;\">Buddhadharma: <em>The Life of Milarepa</em> Reviewed by Ari Goldfield</a></li>
<li><a href=\"http://www.wisdomsun.org/images/pdf/bd-love-me-hate-me-by-rose-taylor.pdf\" style=\"color: #d55e34;\">Buddhadharma: <em>Love Me, Hate Me</em> by Rose Taylor</a></li>
</ul>
<p> </p>
"})

d_p3 = OtherPage.create!({:category_id => 3, :title => "Downloads Pg3", :refactored_title => "d_pg3", :body => "Random filler text for now."})

