#encoding: utf-8

#seeds the test database with seeds.tb
When /the test database has been seeded for lineages test/ do
  load "#{Rails.root}/db/lineages_seeding.rb"
end