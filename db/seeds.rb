# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "deleting DB ..."
Attendance.destroy_all
User.destroy_all
Event.destroy_all
puts "... DB deleted"

puts 'USERS -----------------------'
20.times {
  u = User.create!(
    email: 'thp-grenoble-s8@yopmail.com',
    encrypted_password: 'password',
    description: 'Je suis un grec arménien, ...',
    name: Faker::Games::Pokemon.name
  )
  puts "new user #{u.name}"
}

puts 'EVENTS ----------------------'
30.times {
  e = Event.create!(
    start_date: Time.now + rand(1..200).days,
    duration: rand(1..100)*5,
    title: Faker::Book.title,
    description: Faker::Lorem.sentence(30),
    price: rand(1..1000),
    location: Faker::Games::Pokemon.location,
    administrator: User.all.sample
  )
  puts "event created #{e.title} at #{e.location} by #{e.administrator.name}"
}

puts 'ATTENDANCES ------------------'
Event.all.each { |ev|
  rand(0..10).times {
    us = User.all.sample
    if !ev.attendees.include?(us)
      a = Attendance.create!(
        attendee: us,
        event: ev
        #stripe_customer_id
      )
      puts "#{a.attendee.name} goes to #{a.event.title}"
    end
  }
}
