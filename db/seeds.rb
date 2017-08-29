# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
exit if !Rails.env.development?

puts "Deleting the data"
Post.delete_all
User.delete_all


puts "Creating User"
user = FactoryGirl.create(:user, email: "12-10769@usb.ve")

puts "Creating Post"
15.times do
  FactoryGirl.create(:post, user: user)
end
