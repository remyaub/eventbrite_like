# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendence.destroy_all



8.times do
    user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
    description: Faker::FamilyGuy.quote, email: Faker::Internet.free_email, 
    password: Faker::Internet.password)
end


10.times do
    event = Event.create!(start_date: Faker::Date.forward(23), title: Faker::ProgrammingLanguage.name, description: Faker::Hobbit.quote,
    duration: Faker::Number.number(3), price: Faker::Number.number(2), location: Faker::Hobbit.location, admin: User.all.sample)
end


5.times do
    attendence = Attendence.create!(stripe_customer_id: Faker::Number.number(10), attendee: User.all.sample, event: Event.all.sample)
end