# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name:  "Mohamed",
#              email: "admin@admin.com",
#              password:              "adminadmin",
#              password_confirmation: "adminadmin",
#              admin: true,
#              activated: true,
#              activated_at: Time.zone.now)

# 1.times do |n|
#   name  = "Mohamed"
#   email = "admin@admin.com"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end

# Following relationships
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..10]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
