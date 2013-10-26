# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!({:email => 'ari.goldfield@wisdomsun.org', :password => 'password'})
admin.toggle!(:admin)
books = [{:title => 'Stars of Wisdom', :author => 'Khenpo Tsultrim Gyamtso', :picture => 'starsofwisdom.jpg', :description => "Teachings on the Noble Nagarjuna's Fundamental Wisdom of the Middle Way By Khenpo Tsultrim Gyamtso, translated by Ari Goldfield.\n Tibetan Buddhist master Khenpo Tsultrim Gyamtso is known for his joyful songs of realization and his spontaneous and skillful teaching style. In this book he explains how to gain clarity, peace, and wisdom through step-by-step analysis and meditation on the true nature of reality. He also introduces readers to the joy and profundity of yogic song, and reveals the power of aspiration prayers to inspire, transform, and brighten our hearts.", :purchase_url => 'www.google.com'},
        {:title => 'The Sun of Wisdom', :author => 'Khenpo Tsultrim Gyamtso', :picture => 'thesunofwisdom.jpg', :description => "Teachings on the Noble Nagarjuna's Fundamental Wisdom of the Middle Way By Khenpo Tsultrim Gyamtso, translated by Ari Goldfield.\n The Fundamental Wisdom of the Middle Way was written in the second century and is one of the most important works of Nagarjuna, the pioneering commentator on the Buddha's teachings on the Madhyamika or Middle Way view. The subtle analyses presented in this treatise were closely studied and commented upon by many realized masters from the Indo-Tibetan Buddhist tradition. Using Nagarjuna's root text and the great modern master Ju Mipham's commentary as a framework, Khenpo Tsultrim Gyamtso explains the most important verse from each chapter in the text in a style that illuminates for modern students both the meaning of these profound teachings and how to put them into practice in a way that benefits both oneself and others."},
        {:title => 'Freeing the Body Freeing the Mind', :author => 'Robert Thurman', :picture => 'freeingthebodyfreeingthemind.jpg', :description => "Writings on the Connections between Yoga and Buddhism Edited by Michael Stone Foreword by Robert Thurman. \n In this collection of provocative essays by prominent teachers of Yoga and Buddhism, the common ground of these two ancient traditions becomes clear. Michael Stone has brought together a group of intriguing voices to show how Buddhism and Yoga share the same roots, the same values, and the same spiritual goals. The themes addressed here are rich and varied, yet the essays all weave together the common threads between the traditions that offer guidance toward spiritual freedom and genuine realization. Contributors include Ajahn Amaro Bhikkhu, Shosan Victoria Austin, Frank Jude Boccio, Christopher Key Chapple, Ari Goldfield and Rose Taylor, Chip Hartranft, Roshi Pat Enkyo O'Hara, Sarah Powers, Eido Shimano Roshi, Jill Satterfield, Mu Soeng, Michael Stone, and Robert Thurman."}
     ]

books.each do |movie|
  Book.create!(movie)
end
