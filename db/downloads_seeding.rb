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