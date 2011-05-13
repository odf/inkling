require 'machinist/active_record'
require 'sham'
require 'faker'

# a machinist config for quick data generation
Sham.created_at { (0..60).to_a.rand.days.ago }
Sham.body       { Faker::Lorem.sentence }
Sham.reason     { Faker::Lorem.sentence }
Sham.name       { Faker::Lorem.sentence }
Sham.email      { Faker::Internet.email }
Sham.title      { Faker::Lorem.words(2).to_s }
Sham.word       { Faker::Lorem.words(1).to_s }
Sham.description  { Faker::Lorem.sentence }
Sham.body       { Faker::Lorem.paragraph }
Sham.url        { "http://" + Faker::Internet.domain_name.to_s  }
Sham.display_from { (0..60).to_a.rand.days.ago }
Sham.display_to   { (0..60).to_a.rand.days.since }
Sham.keywords   { Faker::Lorem.sentence }

User.blueprint do 
end

Inkling::Role.blueprint do
  name Sham.name
end

Inkling::Role.blueprint(:admin) do
  name "administrator"
end

Inkling::RoleMembership.blueprint do 
  role
  user
end

#for Feed a Format which has a method "generate" is required, see below
Inkling::Feed.blueprint do
  user
  title Sham.title
  source Sham.word
  criteria Sham.reason  
end

def make_user(role_name)
  role_name = role_name.to_s if role_name.is_a? Symbol
  user = Inkling::User.make
  role = Inkling::Role.make(:name => role_name)
  role_membership = Inkling::RoleMembership.create(:role => role, :user => user)
  user
end



