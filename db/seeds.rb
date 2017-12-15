# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed users



1..100.times do |i|
  username = Faker::Name.unique.name.parameterize.underscore
  email = Faker::Internet.unique.email
  user_attributes = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: email,
    username: username,
    password: 'password',
    password_confirmation: 'password'
  }
  User.create_with(user_attributes).find_or_create_by(email: email, username: username)
end

1..1000.times do |i|
  article_attributes = {
    title: Faker::Lorem.words(rand(2..10)).join(' '),
    body: Faker::Lorem.paragraphs(rand(2..8)).join('\n'),
    user: User.order("random()").first
  }
  Article.create(article_attributes)
end

p "*********************Total User: #{User.count}********************"
p "*********************Total Article: #{Article.count}**************"