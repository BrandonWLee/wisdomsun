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
admin = User.new({:email => 'admin@wisdomsun.org', :password => 'password'})
admin.first_name = "Admin"
admin.last_name = "Admin"
admin.admin = true
admin.forem_admin = true
admin.confirmed_at = Time.now
admin.save!

user =  User.new({:email => 'user@wisdomsun.org', :password => 'password'})
admin.first_name = "Fake"
admin.last_name  = "User"
user.confirmed_at = Time.now
user.save!

puts "Seeding Lineage category and pages"
lineage_category = Category.create!({:position => 1, :name => 'Lineage', :refactored_name => 'lineage'})
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
linear_p2 = OtherPage.create!({:category_id => 2, :title => "Lineage Pg2", :refactored_title => "lineage_pg2", :body => "Random filler text for now."})
linear_p3 = OtherPage.create!({:category_id => 2, :title => "Lineage Pg3", :refactored_title => "lineage_pg3", :body => "Random filler text for now."})
