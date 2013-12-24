#encoding: utf-8

# USERS AND ADMIN
puts "Seeding Users and Admins"
admin = User.create!({:email => 'admin@wisdomsun.org', :password => 'password'})
admin.first_name = "Admin"
admin.last_name = "Admin"
admin.toggle!(:admin)
admin.toggle!(:forem_admin)
admin.confirmed_at = Time.now
admin.save!
user =  User.create!({:email => 'user@wisdomsun.org', :password => 'password'})
admin.first_name = "Fake"
admin.last_name  = "User"
user.confirmed_at = Time.now
user.save!

# EVENTS
puts "Seeding Events"
event = Event.create({ name: 'Meditation Circle', date: 'September 4th to November 6th', description: '<strong>Contact:  info@wisdomsun.org</strong>
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
$120 for all 8 sessions, including recordings and materials', location: 'San Francisco', time: 'Wednesdays 2:30-5:00PM'}
)
event_picture = File.new("./app/assets/images/events/palmtrees.jpg")
event.picture = event_picture
event.save!
event_picture.close
event2 = Event.create({ name: 'Wisdom Journey 2013 -- Fall 2013', date: 'December 6th to December 8th', description: 'In this series of our ongoing exploration into the wisdom that is innately present within each of us, we will be looking into the waves of apparent duality and their relationship with the underlying ocean of unity of Mahamudra awareness.
Our experience is full of these dualistic notions: happiness and suffering; good and bad; tension and relaxation; clarity and confusion; confidence and insecurity. How do we work with these feelings? How do they relate to our understanding of reality? What skillful methods can we practice in order to enhance our daily life experience?
We will explore these questions by connecting with our personal wisdom as it relates to our body, to the levels of our awareness, and to other people. Along the way, we will meditate, have dialogue, and deepen our connections with each other.
Out-of-town participation via mp3 is also available, and included with the mp3s is a 30-minute Q&A session with one of us.
Registration cost for the complete series of classes, plus recordings of all sessions: $200 ($20 per session)
Note: This is a more advanced class, so if you have not attended any of our classes before, please contact us before you come.', location: 'Santa Cruz', time: 'TBA'})
event2_picture = File.new("./app/assets/images/events/retreat.jpg")
event2.picture = event2_picture
event2.save!
event2_picture.close

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
stars_book = Book.new({:title => 'Stars of Wisdom', :author => 'Khenpo Tsultrim Gyamtso', :purchase_url => 'http://www.shambhala.com/html/catalog/items/isbn/978-1-59030-775-5.cfm'})
stars_book.description = "Analytical Meditation, Songs of Yogic Joy, and Prayers of Aspiration By Khenpo Tsultrim Gyamtso, Translated by Ari Goldfield and Rose Taylor Foreword by H. H. the Dalai Lama, The XVII Karmapa

Tibetan Buddhist master Khenpo Tsültrim Gyamtso is known for his joyful songs of realization and his spontaneous and skillful teaching style. In this book he explains how to gain clarity, peace, and wisdom through step-by-step analysis and meditation on the true nature of reality. He also introduces readers to the joy and profundity of yogic song, and reveals the power of aspiration prayers to inspire, transform, and brighten our hearts."
stars_picture = File.new("./app/assets/images/books/starsofwisdom.jpg")
stars_book.picture = stars_picture
stars_book.save!
stars_picture.close

puts "..The Sun of Wisdom.."
sun_book = Book.new({:title => 'The Sun of Wisdom', :author => 'Khenpo Tsultrim Gyamtso',  :purchase_url => 'http://www.shambhala.com/html/catalog/items/isbn/978-1-57062-999-0.cfm'})
sun_book.description = "Teachings on the Noble Nagarjuna’s Fundamental Wisdom of the Middle Way By Khenpo Tsültrim Gyamtso, translated by Ari Goldfield

The Fundamental Wisdom of the Middle Way was written in the second century and is one of the most important works of Nagarjuna, the pioneering commentator on the Buddha's teachings on the Madhyamika or Middle Way view. The subtle analyses presented in this treatise were closely studied and commented upon by many realized masters from the Indo-Tibetan Buddhist tradition.

Using Nagarjuna's root text and the great modern master Ju Mipham's commentary as a framework, Khenpo Tsültrim Gyamtso explains the most important verse from each chapter in the text in a style that illuminates for modern students both the meaning of these profound teachings and how to put them into practice in a way that benefits both oneself and others."
sun_picture = File.new("./app/assets/images/books/thesunofwisdom.jpg")
sun_book.picture = sun_picture
sun_book.save!
sun_picture.close

puts "..Freeing the Body Freeing the Mind.."
freeing_book = Book.new({:title => 'Freeing the Body Freeing the Mind', :author => 'Robert Thurman',  :purchase_url => 'http://www.shambhala.com/html/catalog/items/isbn/978-1-59030-801-1.cfm'})
freeing_book.description = "Writings on the Connections between Yoga and Buddhism Edited by Michael Stone Foreword by Robert Thurman

In this collection of provocative essays by prominent teachers of Yoga and Buddhism, the common ground of these two ancient traditions becomes clear. Michael Stone has brought together a group of intriguing voices to show how Buddhism and Yoga share the same roots, the same values, and the same spiritual goals. The themes addressed here are rich and varied, yet the essays all weave together the common threads between the traditions that offer guidance toward spiritual freedom and genuine realization.

Contributors include Ajahn Amaro Bhikkhu, Shosan Victoria Austin, Frank Jude Boccio, Christopher Key Chapple, Ari Goldfield and Rose Taylor, Chip Hartranft, Roshi Pat Enkyo O’Hara, Sarah Powers, Eido Shimano Roshi, Jill Satterfield, Mu Soeng, Michael Stone, and Robert Thurman."
freeing_picture = File.new("./app/assets/images/books/freeingthebodyfreeingthemind.jpg")
freeing_book.picture = freeing_picture
freeing_book.save!
freeing_picture.close

puts "..Training the Wisdom Body.."
training_book = Book.new({:title => 'Training the Wisdom Body', :author => 'Rose Taylor Goldfield',  :purchase_url => 'http://www.shambhala.com/training-the-wisdom-body.html'})
training_book.description = "Sitting still in meditation may be the common image that comes to mind when one thinks of Buddhist practice—but just as important is cultivation of awareness through movement. The traditional Tibetan practice of yogic exercises known as lujong helps us connect with and explore the natural wisdom inherent in our living, breathing, feeling bodies. Lujong is an exercise that engages our whole being—body, mind, and subtle body—from the coarse aspects to the subtler and more profound. This book provides a thorough foundation for those new to the practice, and it helps people already engaged in any form of yogic exercise to deepen the potent fusion of meditation and physical movement. Included is an overview of the unique tradition of Buddhist yoga, along with instructions on how to work with the body and mind in seated meditation; tips for furthering our practice by working with adversities such as fear, procrastination, and anxiety; and guidance on bringing practice mind into daily life. The author also offers exercise instructions and a complete explanation of the movement practices, with photos to illustrate."
training_picture = File.new("./app/assets/images/books/training.png")
training_book.picture = training_picture
training_book.save!
training_picture.close

# Albums
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
(1...29).each do |num|
  puts "..retreat #{num}"
  retreat1 = Photo.new(:album_id => 1)
  pic = File.new("./app/assets/images/photos/1-#{num}.jpg")
  retreat1.picture = pic
  retreat1.save! 
  pic.close 
end

(1...12).each do |num| 
  puts "..holiday #{num}"
  holiday1 = Photo.new(:album_id => 2)
  pic = File.new("./app/assets/images/photos/2-#{num}.jpg")
  holiday1.picture = pic
  holiday1.save!  
  pic.close
end

# Slider Images
puts "Seeding slider"
slider1 = Slider.new(:name => "Lineage", :link => "otherPages/4")
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

# QUOTES
puts "Seeding Quotes"
Quote.create!({:quote => "There is a sense of joy in being part of this knowledge and that sense of joy, which triggers the transition from knowledge to wisdom, is compassion, or unconditional love.", :source => "Chogyam Trungpa Rinpoche"})

# AROUND THE WEB
puts "Seeding Around the Web Posts"
atw_1 = AroundTheWebPost.new({:title => "Wisdom Sun's Facebook page", :external_link => "http://www.facebook.com/widomsunsf"})
atw_1.commentary = %Q{<p> Seen around the web? Wisdom Sun's <a href="http://www.facebook.com/widomsunsf?ref=ts&amp;fref=ts">Facebook page</a>. </p>}
atw_1.save!
atw_2 = AroundTheWebPost.new({:title => "Let Loose; Conversations with and about Contemporary Teachers", :external_link => "http://www.chronicleproject.com/chroniclesradio_letloose/ll_2011_05_08.html"})
atw_2.commentary = %Q{<p> Seen around the web? David Sable interviews Ari on Chronicles Radio: '<a href="http://www.chronicleproject.com/chroniclesradio_letloose/ll_2011_05_08.html" title="Let Loose ~ An Interview on Chronicle Radio">Let Loose; Conversations with and about Contemporary Teachers'</a>. </p>}
atw_2.save!
atw_3 = AroundTheWebPost.new({:title => "Let Loose; Conversations with and about Contemporary Teachers", :external_link => "http://www.chronicleproject.com/chroniclesradio_letloose/ll_2011_05_08.html"})
atw_3.commentary = %Q{<p> <a href="http://www.elephantjournal.com/2011/08/buddhist-yoga-joining-with-naturalness-ari-goldfield-and-rose-taylor-goldfield/" title="Joining with Naturalness">Click here to view Part 1</a> of this article on the key points of practicing yoga from a Buddhist perspective. This was originally published in the book <em><a href="http://www.shambhala.com/html/catalog/items/isbn/978-1-59030-801-1.cfm" title="Freeing the Body">Freeing the Body, Freeing the Mind: Writings on the Connections between Yoga and Buddhism</a>.</em> </p>}
atw_3.save!
atw_4 = AroundTheWebPost.new({:title => "Let Loose; Conversations with and about Contemporary Teachers", :external_link => "http://www.chronicleproject.com/chroniclesradio_letloose/ll_2011_05_08.html"})
atw_4.commentary = %Q{<p> Seen around the web? Wisdom Sunlights Newsletter #5: <a href="http://campaign.r20.constantcontact.com/render?llr=odmka8eab&amp;v=001YzRvM3yRJwQRoa4vA_JlY1mMvLmf485Zy1qJkude5RQFw1RdYCSbS-ifiY1hXGKP-EvmKDHs0MwAEo5PcAwqZ8N3C9Y1OOm1364EJSpfheCckZceiM2xSf40UG4uTriBirFC7efDCjQINXoW9nTxkc9FFsKTGoYv" target="_blank" title="Sunlights Newsletter, Issue 5">Sunlights Newsletter</a> </p>}
atw_4.save!
atw_5 = AroundTheWebPost.create!({:title => "Let Loose; Conversations with and about Contemporary Teachers", :external_link => "http://www.chronicleproject.com/chroniclesradio_letloose/ll_2011_05_08.html"})
atw_5.commentary = %Q{<p> Seen around the web? Rose's Book on Yogic Exercise: <a href="http://campaign.r20.constantcontact.com/render?llr=odmka8eab&amp;v=001Ef42ZQFAkFDDqxTtTnNRh70saq02J6GBN6zjRcg6mlFwKnvFjmcAAl-If4NVOxNmiRfkeCNAC1W5gbNSlnFZTZ_TdY5fM_w0-k8DAJhcowUBootNRAW-oAUEI1ch_0Ih" title="Training the Wisdom Body">Training the Wisdom Body</a> </p>}
atw_5.save!

# ABOUT CATEGORY AND PAGES
puts "Seeding About category and pages"
about_category = Category.create({ :position => 0, :name => 'About Wisdom Sun', :refactored_name => 'about', :show_in_menu => false})
about_ari = OtherPage.create({ :category_id => 1, :title => 'Ari Goldfield' , :refactored_title => 'ari_goldfield', :body => %Q{<p> <img src="http://wisdom-sun.herokuapp.com/assets/welcome/ari.jpg" border="0" title="Ari Goldfield" hspace="5" align="left" /> Ari Goldfield is a Buddhist teacher. He had the unique experience of being continuously in the training and service of his own teacher, Khenpo Tsultrim Gyamtso Rinpoche, for eleven years. From 1998-2009, Ari served as Khenpo Rinpoche's translator and secretary, accompanying Rinpoche on seven round-the-world teaching tours. Ari received extensive instruction from Rinpoche in Buddhist philosophy, meditation, and teaching methods, and meditated under Rinpoche's guidance in numerous retreats. In 2006, Khenpo Rinpoche sent Ari on his own tour to teach philosophy, meditation, and yogic exercise in Europe, North America, and Asia. In 2007, Ari moved with Rinpoche to Seattle, where he served and helped care for him until Rinpoche moved back to Nepal in 2009. Ari now teaches in Rinpoche's Karma Kagyu lineage, with the blessings of the head of the lineage, H.H. the 17th Gyalwang Karmapa, and of Khenpo Rinpoche. </p> <p> Ari is also a published translator and author of books, articles, and numerous songs of realization and texts on Buddhist philosophy and meditation. These include Khenpo Rinpoche's books Stars of Wisdom, The Sun of Wisdom, and Rinpoche's Song of the Eight Flashing Lances teaching, which appeared in The Best Buddhist Writing 2007. He is a contributing author of Freeing the Body, Freeing the Mind: Writings on the Connections Between Yoga and Buddhism. </p> <p> Ari studied Buddhist texts in Tibetan and Sanskrit at Buddhist monasteries in Nepal and India, and at the Central Institute for Higher Tibetan Studies in India. In addition to translating for Khenpo Rinpoche, he has also served as translator for H.H. Karmapa, Tenga Rinpoche, and many other Tibetan teachers. From 2007-11, Ari served as president of the Marpa Foundation, a nonprofit organization initiated by Khenpo Rinpoche that supports Buddhist translation, nunneries in Bhutan and Nepal, and other Buddhist activities. Ari holds a BA from Harvard College and a JD from Harvard Law School, both with honors. </p> <p> Ari married Rose Taylor Goldfield in 2008 while on semi-retreat with Khenpo Rinpoche. They currently teach internationally from their home base in San Francisco under the auspices of Wisdom Sun, the practice and study community they established together in 2011. </p>}})
about_rose = OtherPage.create({ :category_id => 1, :title => 'Rose Taylor Goldfield' , :refactored_title => 'rose_goldfield', :body => %Q{<p> <img src="http://wisdom-sun.herokuapp.com/assets/welcome/rose.jpg" border="0" hspace="5" align="left" /> Rose Taylor Goldfield is a second-generation Buddhist teacher in the Karma Kagyu lineage, with the blessing of His Holiness the 17th Gyalwang Karmapa and her teacher Khenpo Tsultrim Gyamtso Rinpoche. She teaches Buddhist meditation, philosophy, yogic exercise and dance, and classical Tibetan language. </p> <p> Rose has written and translated books, articles, and numerous songs of realization, including Khenpo Rinpoche's book Stars of Wisdom and a chapter in Freeing the Body, Freeing the Mind: Writings on the Connection Between Yoga and Buddhism. She holds an MA in Indo-Tibetan Buddhist studies from Naropa University. Rose grew up in a Buddhist household, her mother first practiced in the Theravadin tradition and lived in Thailand for many years and later became a Tibetan Buddhist practitioner after meeting Chogyam Trungpa Rinpoche in 1968. </p> <p> Having studied and practiced extensively in the Shambhala lineage, Rose began training under Khenpo Rinpoche's close guidance in 2002. He sent her on numerous extensive practice and study retreats. In 2005, he appointed her teacher to his nuns in Bhutan and Nepal. She taught the nuns Tibetan Buddhist philosophical texts and meditation, and was a teacher at the ten-week program for international students at Jamgon Kongtrul Rinpoche's monastery in Nepal. From 2007-9, Rose attended Khenpo Rinpoche daily while living with him in semi-retreat in Seattle. In 2007, Khenpo Rinpoche appointed her to a full-time position with Marpa Foundation, where she served as vice-president and secretary until 2011. </p> <p> Rose married Ari Goldfield in 2008 while on semi-retreat with Khenpo Rinpoche. They currently teach internationally from their home base in San Francisco under the auspices of Wisdom Sun, the practice and study community they established together in 2011. </p>}})
about_about = OtherPage.create({ :category_id => 1, :title => 'About' , :refactored_title => 'about', :body => %Q{<p> Wisdom Sun is about bringing Buddhist meditation teachings home: Home to our own culture and locale; home to our daily life; home to our mind, body, and heart. </p> 
<p> Bringing meditation home, we learn to live fully and fearlessly, with joy, humor, and love. We begin to genuinely connect with who we are as individuals, and strengthen and enrich our relationships with others. We develop a clarity and depth of awareness-wisdom-imbued with warmth-like the light of the sun. </p> 
<p> <strong>Inquiry and Transformative Discovery</strong> </p> 
<p> One of the extraordinary qualities we possess as human beings is that of self-reflection. "Who am I, really?" "What am I actually doing here?" "What is life really all about?" are timeless human questions. The motives for asking them can include experiences of pain and confusion; a desire to search for more meaning in life; or simply a sense of curiosity about what is true beneath the surface of things as they appear to us. </p> 
<p> These questions are the starting point of Buddhism's "wisdom teachings," which explain how to make this kind of inner inquiry become a path of transformative discovery. </p> 
<p> To be genuinely transformative, this path needs to be much more than just dry philosophy or abstract speculation. When we open all of our mind, body, and heart to our inquiry and meditative experience, we begin to discover something profound and amazing. </p>
<p> The quality of this discovery is difficult to describe, yet it is directly felt. It is spacious and transcendent, yet immediate and personal. It is at the heart of what Buddhism's yogic tradition has been passing down from teacher to disciple for generations. Experiencing it makes it so much easier to feel true happiness, to be at peace, to relate to others-to live in a way that feels like we fit well in our life. We begin to feel an innate sense of self-worth, and to see that our daily worries, struggles, preoccupations, and fears do not define us. This gives us an anchor in this uncertain, changing world-a genuine sense of confidence that whatever happens in life, we are going to be just fine. </p> 
<p> This is not about ecstasy or feeling superhuman-it is calm, deep, genuine, and joyful. It is open; it is bright and alive; and it naturally emanates warmth and love. This is the Wisdom Sun. </p> 
<p> The best thing of all is that the Wisdom Sun is already fully present within us-it is our authentic nature. So we do not need to struggle to acquire or achieve it. We simply need to learn how to open to its natural presence in our body, mind, and heart. </p> 
<p> <strong>A Common Path Practiced by Individual People</strong> </p>
<p> As an organization, Wisdom Sun is about a path of Buddhist meditation practice focusing on the wisdom teachings, and about a community of individuals who share the longing to learn, practice, and develop along this path. The path and the community are equally important-Wisdom Sun honors and respects both the universality of the teachings and the individuality of the people practicing them. </p> 
<p> <strong>The Path: Teachers and Teachings</strong> </p> 
<p> Wisdom Sun's path of Buddhist practice is grounded in the extensive teachings given to us over the course of many years, often in a personal one-on-one context, by our spiritual guide, the Tibetan master Khenpo Tsultrim Gyamtso Rinpoche. During his teaching career, Khenpo Rinpoche was renowned for his highly original, profound, and engaging presentation of the wisdom teachings. He was particularly revered for his teachings on the "view" of the true nature of reality. Khenpo Rinpoche presented this view in a series of progressive stages, providing a sound foundation for our understanding and meditative experience to gradually develop and mature. </p> 
<p> These stages begin with the question "Who am I, really?" and an exploration of the true nature of the individual. They move on to examine the nature of the phenomenal world in which the individual lives, as described in the different levels of teachings on emptiness and prajna-paramita (transcendent wisdom). They culminate in the highest teachings on the true nature of the psycho-physical continuum, found in the Mahamudra (Great Seal), Dzogchen (Great Completeness), and Vajrayana (Adamantine Vehicle) traditions. </p> 
<p> Wisdom Sun's path of practice also owes a great deal to the teachings of Chogyam Trungpa Rinpoche, whose brilliant, rich, and eloquent expositions are an inconceivable treasure. Trungpa Rinpoche and Khenpo Rinpoche held each other in the highest esteem. </p> <p> <strong>A Spirit of Innovation</strong> </p> <p> These two masters, trained in the ancient Tibetan style yet teaching in the modern West, were fantastic innovators. Their primary loyalty was not to tradition for tradition's sake, but rather, to helping their students connect with their tradition's heart. Their openness and willingness to engage with their students in a deeply intimate way produced a transmission of Buddhist teachings that was both original and true to its roots. </p> <p> We feel that this spirit of innovation is part of the tradition our teachers have passed down to us. We seek not to simply repeat the teachings we have heard, but to continually consider how we can make the teachings fresh, accessible, and meaningful for people. And we are open to the wisdom and beauty of Western and Eastern traditions of the arts, sciences, and humanities for insights to help us do this. </p> <p> <strong>A Buddhist Path for Mind, Body, and Heart</strong> </p> <p> In this day and age, we often live and work in a way that our intellect is highly active and constantly stimulated, but not necessarily in a way that feels very balanced or connected with our body and heart. Meditative practice helps restore this balance and connection, and the resulting experiences of grounding and opening are wonderful. Rather than just speaking or thinking of wisdom, we come to actually embody it. </p> <p> This is why Wisdom Sun's path of practice encourages body-based meditation, including lujong (Tibetan Buddhist Yoga), singing yogic songs of realization, and Buddhist dance. These practices are profound, enjoyable, and easy to learn for people of all ages and levels of physical ability. </p> 
<p> <strong>Reconnecting with Tradition: Meditation Practices for a Community of Individuals</strong> </p> 
<p> Another key feature of this modern environment is that the community of Buddhist practitioners is a group of individuals. We aspire to have shared goals and purpose that fosters a strong community, but without asking people to sacrifice themselves for "higher purposes." Having a healthy balance between community and individuality is positive and inspiring. </p> 
<p> One way to achieve this balance is for people to have the opportunity to receive regular individual practice guidance. With this, we can insure that the clarity and warmth of the practices meet each of us where we need it most. This makes the path feel genuine and authentic, so we do not feel we are just practicing by rote, in isolation, or mindlessly following the herd. It allows for us to manifest the qualities of enlightenment in our own personal way. </p> 
<p> A relationship of regular personal contact between teacher and student is in harmony with how Buddhism was traditionally practiced. And Buddhism's high esteem for individuality appears in the teachings on the different enlightened qualities of the five Buddha families, which are born from the different psycho-physical make-up of each individual. These qualities become endangered, however, when Buddhist practice gets too uniform and monolithic; when people feel that they are forced to fit themselves into a cookie-cutter style of meditation where "one size fits all", rather than getting the help they need to figure out what the meditation teachings truly mean for them. That is why in-depth, individual practice guidance can be so beneficial. </p> 
<p> <strong>Wisdom Sun's Offering</strong> </p> 
<p> Wisdom Sun offers an invitation to individuals to be able to participate in its community, and by participating, to grow into who we actually are. In our world there is so much hesitation, uncertainty, and tension that there is not always much chance for us to do this. But it is possible to celebrate individuality without ego-clinging; and to allow our individual nature to manifest and have its own ground that is stable, open, and filled with love. </p> 
<p> With this emphasis, Wisdom Sun becomes a community that is fulfilling. It becomes something that we can take with us wherever we go. We learn to shine our light of wisdom and warmth, in ourselves and in our world. </p>}})    

puts "Seeding Lineage category and pages"
lineage_category = Category.create!({:position => 1, :name => 'Lineage', :refactored_name => 'lineage', :show_in_menu => false})
linear_p1 = OtherPage.create!({:category_id => 2, :title => "Lineage", :refactored_title => "lineage", :body => "<p><strong>Lineage: An Introduction</strong></p>
<p>One of the outstanding features of Buddhist meditation teachings is that they have been taught, learned, and practiced over the course of more than 2,500 years.  From culture to culture and era to era, people have examined these teachings, tested them in their own personal experience, and used them to their benefit.</p>
<p>This long history of human interaction with the teachings gives them a special authenticity and strength.  They are able to open portals to the timeless, essential, and universal human truths that transcend differences of ethnicity, gender, and age.  What has made this possible is a continuous link of transmission of the teachings, from teacher to student, generation to generation.  This is called “lineage.”</p>
<p>Yet lineage is as much about the present as it is the past. It is not to be found in a passive inheritance of the edicts, traditions, or even teachings of the ancients. Lineage is <em>alive</em>, and each generation of students embarks on the path of figuring out what it means to make the lineage’s teachings live for them. This is what allows us to fully connect with the teachings’ heart. Lineage is embodied in this journey—of receiving our teachers’ guidance over a course of time; of interacting with the teachers and the teachings in the process of making the teachings our own; and of transmitting what we have personally realized to others when the time is right.</p>
<p> </p>
<p><strong>Our Lineage of Teachers</strong></p>
<p><em><strong>Khenpo Tsültrim Gyamtso Rinpoche</strong></em></p>
<p><img src=\"http://www.wisdomsun.org/images/stories/khenpo2.jpg\" border=\"0\" /></p>
<p>The Buddhist master Khenpo Tsültrim Gyamtso Rinpoche is renowned for possessing the intellect and knowledge of a scholar and the realization, humor, and creativity of a yogi. When he was teaching, he could parse through the complexity of long philosophical texts and marvelously extract their essential meaning for his students. And he loved to intersperse his formal teaching sessions with songs and dances of yogic realization. When traveling the world on one of his many teaching tours, in a single day he would enjoy sightseeing in crowded tourist spots, swimming in lakes, pools, or oceans, and meditating in the peaceful solitude of his chambers. He is the teacher of H. H. the Seventeenth Gyalwang Karmapa and other high-ranking lamas of the Kagyu lineage. Yet people all over the world appreciate him for his willingness to share the most profound teachings of Buddhism with lamas and laypeople, women and men, and practitioners old and new alike.</p>
<p>Khenpo Rinpoche was born in 1934 to a nomad family in Eastern Tibet. When he was two years old, his father died suddenly. Thereafter, his mother devoted herself full-time to Dharma practice. As her youngest child, Rinpoche accompanied her on pilgrimages and to Dharma teachings, even staying by her side when she undertook extended retreats. By nature and nurture drawn to spiritual practice, Rinpoche left home at an early age to train with yogis who lived and practiced in the remote monasteries and caves of Eastern and Central Tibet.</p>
<p>After completing this early training, Rinpoche embraced the life of a yogi-ascetic. For years he wandered throughout Eastern and Central Tibet, undertaking solitary retreats in caves and charnel grounds to realize directly the teachings he had received. While in such a retreat in 1959, a group of twenty-one nuns asked Rinpoche for protection from the Communist Chinese invaders.</p>
<p>When the nuns told him that H. H. the Fourteenth Dalai Lama and H. H. the Sixteenth Gyalwang Karmapa had already left Tibet, Rinpoche replied, “Then we are going, too!” He led the nuns and other refugees over the Himalayas to safety in Bhutan. He spent the next nine years at a scholastic monastery for Tibetan refugees on the grounds of an old prison yard in Buxa Duar, India. There he studied intensively, mastering the teachings of all four schools of Tibetan Buddhism. He became renowned as a teacher of texts and meditation, and received a Geshe Lharampa degree from H. H. the Fourteenth Dalai Lama. He lived, practiced, and taught in Bhutan from 1968 until 1977.</p>
<p>At the request of H. H. the Sixteenth Gyalwang Karmapa, in 1977 Rinpoche began teaching Dharma and classical Tibetan Dharma language abroad. For thirty years, Rinpoche traveled and taught extensively in Europe, North America, South America, Asia, Africa, and Australia. Rinpoche was a pioneer in giving careful, long-term training to Buddhist translators. During this time, Rinpoche also spent several months a year training a new generation of Kagyu khenpos at the Karmapa’s Nalanda Institute in Sikkim, India.</p>
<p>Rinpoche is committed to providing nuns with the same opportunities for study and practice that monks traditionally have. To that end, he established one nunnery in Nepal and one in Bhutan. The women at these nunneries study and practice the profound view and meditation, and sing and dance to the profound songs of realization.</p>
<p>For the years Rinpoche spent teaching worldwide, when asked, “Where do you live?” he usually replied, “On the planet Earth.” At this time in his life, however, Rinpoche has retired from traveling and teaching publicly, and resides at his nunnery in Nepal.</p>
<p> </p>
<p><em><strong>Chögyam Trungpa Rinpoche </strong></em></p>
<p><strong><img src=\"http://www.wisdomsun.org/images/stories/chogyam1.jpg\" border=\"0\" /><img src=\"http://www.wisdomsun.org/images/stories/chogyam2.jpg\" border=\"0\" /><br /></strong></p>
<p>Trungpa Rinpoche is widely regarded as a seminal progenitor of Western Buddhadharma. He was a highly engaging, original, and influential figure whose teaching time in the West was cut short by his death in 1987 at the age of 47, yet whose impact reverberates powerfully to this day in the world of Buddhism and beyond.</p>
<p>An important aspect of Trungpa Rinpoche’s ability to transmit the Dharma to his students around the globe was his deep appreciation for their culture. He could leap wholeheartedly into it with them, fully experience it, and harness its innate wisdom in order to draw out the Buddhadharma from within rather than impose it from without. He developed a style of teaching that was firmly rooted in Buddhism’s ancient wisdom and yet was completely fresh, vibrant, and relevant.</p>
<p>Trungpa Rinpoche was fearless in his efforts to establish Buddhism in the West using whatever means were most efficacious. He felt it important not to hold onto cultural trappings that blocked direct communication. He gave up his monastic robes and later married an English woman. He found great peers with whom he developed close relationships and whom he collaborated with on many projects without any sense of territoriality. These friendships included not just Tibetan Buddhist teachers but Zen masters, Christian adepts, and also many artists, writers, and poets. The arts were very important to Trungpa Rinpoche and he developed many contemplative programs around dance, calligraphy, photography, flower arranging, and theatrical work.</p>
<p>One of the hallmarks of Trungpa Rinpoche’s teachings was his innovative use of the English language, even more remarkable for someone who learned it as a second language. He was one of the first Tibetan Buddhist teachers to speak directly to his students without the use of a translator. His poetic and sensory use of the English language was highly engaging and evocative. He initiated and oversaw the translation of many Tibetan practice texts and materials that marked a giant leap forward in the translation of Tibetan writings into English.</p>
<p>In 1974 Trungpa Rinpoche founded what is now Naropa University, the first Buddhist‑inspired university in North America. Throughout his life he published many books, and the work to publish his oral teachings continues to this day. When we look at all his accomplishments, Trungpa Rinpoche’s life was clearly a remarkable one. However it is the mind and heart of the man that have had the biggest impact. Even though one might never have met him in person, what he left us—everything from written and audio teachings, to the styling of his Dharma centers, and the practice forms—so strongly transmit his mind and heart that his presence remains fully available for those who wish to receive it to this very day.</p>
<p> </p>
<p><em><strong>The Seventeenth Gyalwang Karmapa, Ogyen Trinley Dorje</strong></em></p>
<p><img src=\"http://www.wisdomsun.org/images/stories/karmapa-2.jpg\" border=\"0\" width=\"200\" /><img src=\"http://www.wisdomsun.org/images/stories/karmapa-1.jpg\" border=\"0\" /></p>
<p>Born in 1985, His Holiness the Seventeenth Karmapa is the head of the Karma Kagyu lineage.  To be in his presence is to experience an amazing combination of power and humility; humor and depth; clarity, love, and joy.</p>
<p>The Karmapa lived in Tibet until he was fifteen. The Beijing government gave him its official support, and he could have lived a comfortable life under its patronage. However, he was allowed neither freedom to travel nor to meet with his chosen teachers, and was made to attend endless official functions when he preferred to be studying or meditating in his monastery. Not content to be a puppet of the regime, when he was only fifteen years old he chose to make a daring escape to exile in India.</p>
<p>This natural courage, individuality, and commitment to Dharma characterize the Karmapa. He balances a fervent wish to innovate, improve, and modernize with being the head of a thousand-year-old tradition, hundreds of monasteries and nunneries, and tens of thousands of followers worldwide. He often finds himself placed at the center of geopolitical struggles between Tibet, China, and India. None of this is at all easy, which he readily admits. Yet as he advises his students to “let your suffering be an ornament that beautifies your charisma and enhances your dignity,” he himself strives to live by these words, to the deep admiration of those who meet him.</p>
<p> </p>
<p><em><strong>Tibetan Founders of the Karma Kagyu Lineage</strong></em></p>
<p><img src=\"http://www.wisdomsun.org/images/stories/lineage.jpg\" border=\"0\" /></p>
<p>Marpa, Milarepa, Gampopa, Karmapa Dusum Khyenpa: As we clearly see from their depictions in these statues, conformity for fear of individuality is not to be found in this lineage! These four teachers freely distinguished themselves: Marpa was a farmer with a family; Milarepa a wandering yogi; Gampopa and Dusum Khyenpa were monks. Yet they all embodied and transmitted the living blessing of the lineage. This blessing resides not in a person’s outer appearance or lifestyle, but rather in their struggles and epiphanies, and in their transformation of adversity into a realization of the full potential of their humanity, manifesting in wisdom, courage, and deep universal love. It is a blessing that we are all invited to partake of and enjoy.</p>
<p> </p>

"})

puts "Seeding Downloads category and pages"
downloads_category = Category.create!({:position => 2, :name => 'Downloads', :refactored_name => 'downloads', :show_in_menu => false})
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
d_p3 = OtherPage.create!({:category_id => 3, :title => "Teaching Series for Purchase", :refactored_title => "teaching_series_for_purchase", :body => %Q{
<p> All the teaching series we have given in San Francisco so far have been recorded and are available for purchase. They are sent as mp3 audio files to download over the internet. Each is a four-part series and includes a 30-minute individual q&amp;a session with Ari or Rose (in-person, on the phone, or via Skype). </p> 
<p> Please contact <a href="mailto:info@wisdomsun.org">info@wisdomsun.org</a> if you would like to order any of these recordings or if you have any questions. </p> 
<p> <strong>The Progressive Stages of Meditation on Genuine Reality: Stage 1, The Nature of the Individual</strong><br> The “progressive stages” form the step-by-step meditative path of connecting with our own true nature and the true nature of our world. Doing this brings a more vivid, harmonious, and enjoyable experience of life. </p> 
<p> In this course, Ari and Rose lead in-depth study and meditation of the first stage, which reveals our true nature as individuals. The course is based on Khenpo Tsültrim Gyamtso’s <em>Stars of Wisdom</em>, and emphasizes the experiential, meditative quality of these teachings. </p> 
<p> <strong>The Progressive Stages of Meditation on Genuine Reality, Stage 2: The View and Meditation of Mind-Only—How our mind’s habitual patterns create our world, and what we can do about it.</strong><br> Buddha taught that the most powerful thing in the world is our own mind. Mind creates the way we perceive things and how we react to those perceptions. The Mind-Only School explains where our habitual patterns originate and how they control our happiness and suffering. Exploring this school’s view and meditation gives us the key to mastering our mind and unlocking its full potential. </p> 
<p> <strong>The Progressive Stages of Meditation on Genuine Reality, Stage 3: Embodying The Wisdom of Emptiness</strong><em><br> Form is empty, emptiness is form.<br> Emptiness is not other than form; form is not other than emptiness.</em> </p> 
<p> This teaching of the <em>Heart Sutra</em> is one of the most famous in all of Buddhism. But what does it actually mean? And how can we fully integrate it into our lives? How can we come to fully embody the wisdom of emptiness? This course explores these questions, using body-based meditation techniques to clarify and enhance the experience of meditating on emptiness. </p> 
<p> <strong>Natural Wisdom, Natural Compassion, Stage 4: the Buddha’s Teachings on the Enlightened Essence of Mind</strong><br> In this four-session course, Ari and Rose explore the key points of the teachings on Buddha Nature and how, as modern practitioners, we can put them into practice to enable us to fully manifest the wisdom, compassion, confidence, and joy that are our own mind's inherent qualities </p> 
<p> <strong>Grounded Spaciousness</strong><br> During these classes, we will learn meditation techniques that help us: </p> <ul> <li> synchronize body and mind</li> <li> ground our awareness in our bodies and in the world</li> <li> bring spacious relaxation into our lives</li> <li> develop love and acceptance for ourselves and others</li> <li> connect with our own innate guiding wisdom </li> </ul> 
<p> <strong>Embarking on the Wisdom Journey I</strong><br> We are delighted to invite you to begin exploring this wisdom together with us. We will study the classic textual sources, meditate, and most importantly, learn how to integrate wisdom into our life. </p> 
<p> <strong>Embarking on the Wisdom Journey II</strong><br> We are delighted to invite you to continue this exploration of Buddhist wisdom together with us. We study the classic textual sources, meditate, have dialogue, and most importantly, learn how to find wisdom in our very own mind, body, and heart. </p> 
<p> <strong>Meditations on the 5 Elements and 5 Wisdoms</strong><br> The universe without and our bodies within are constituted by five elements—earth, water, fire, wind, and space. When they are out of balance, there are upheavals in the world and we are susceptible to sickness and mental disturbances. By becoming familiar with the elements and meditating on them, we can bring them into external and internal balance. </p> 
<p> The enlightened nature of these elements is the five wisdoms—the wisdom of equality, mirror-like wisdom, discriminating wisdom, all-accomplishing wisdom, and all-accommodating wisdom. Through developing our understanding and awareness of these wisdom energies, we learn to more fully manifest the wisdoms that naturally abide in each of us. This increases our sense of natural confidence and groundedness; clarity and flexibility; creativity and passion; energy and fulfillment, and the ability to hold all that arises in our minds and in our lives. </p> 
<p> <strong>Milarepa Summer Songfest</strong><em><br> What are meditation's nails to drive home?<br> All thoughts are free in being Dharmakaya,<br> It's awareness, clarity and bliss,<br> So to meditate, rest uncontrived.</em><br> - Milarepa's "Song of the Three Nails" </p> 
<p> The songs of realization of the great yogis and yoginis are fantastic aids for our practice of meditation. They teach us the essential points of Dharma in a clear way that is easy to understand and powerful to put into practice. </p>
}})


