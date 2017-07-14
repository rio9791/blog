# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.with_role(:admin).blank?
  admin = User.create!({email: 'admin@blog.com', password: 'password', password_confirmation: 'password', name: 'Admin'})
  admin.add_role(:admin)
  puts 'Admin created'
end

if User.with_role(:user).blank?
  15.times do
    name = Faker::FamilyGuy.character
    password = Faker::Internet.password(8)
    user = User.create!({name: name, email: Faker::Internet.email("#{name}"), password: password, password_confirmation: password})
    user.add_role(:user)
    user.confirm
    puts "Creating users"
  end
end

unless Post.any?
  user_ids = User.pluck(:id)
  30.times do
    puts "Creating posts.."
    user_id = user_ids.sample
    post = Post.create!({title: Faker::Book.title, content: Faker::Lorem.paragraph(2, true), visible: true, remote_cover_url: Faker::Avatar.image("#{Faker::Book.title.gsub(' ', '-')}"), user_id: user_id})
  end
end
