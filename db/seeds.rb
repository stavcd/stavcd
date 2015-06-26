# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Message.delete_all
Message.create(body: "привет", sender_id: 3, recipient_id: 1)
Message.create(body: "пока", sender_id: 1, recipient_id: 3)
10.times do |n|
  User.create(email: "#{n+1}@#{n+1}.ru",
              password: '12345678', password_confirmation: '12345678')
end
