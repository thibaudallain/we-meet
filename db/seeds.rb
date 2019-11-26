# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(
  date: Date.today,
  start_time: Time.now + 3700,
  deadline: Time.now + 1800,
  )

User.create(
  name: "Jean",
  email: "jean@lewagon.com",
  password: "123456",
  phone_number: "0627801824"
  )

User.create(
  name: "Michel",
  email: "michel@lewagon.com",
  password: "123456",
  phone_number: "0627801825"
  )

User.create(
  name: "Robert",
  email: "robert@lewagon.com",
  password: "123456",
  phone_number: "0627801826"
  )

User.create(
  name: "Daniel",
  email: "daniel@lewagon.com",
  password: "123456",
  phone_number: "0627801827"
  )

User.create(
  name: "Atchoum",
  email: "atchoum@lewagon.com",
  password: "123456",
  phone_number: "0627801828"
  )

Meeting.create(
  event_id: 1,
  user_id: 1,
  attending: true,
  address: "11 rue de l'Orillon, 75011",
  organizer: true
  )

Meeting.create(
  event_id: 1,
  user_id: 2,
  attending: true,
  address: "11 rue de Rivoli, 75001",
  organizer: true
  )

Meeting.create(
  event_id: 1,
  user_id: 3,
  attending: false,
  address: "67 boulevard de la Villette, 75020",
  organizer: false
  )

Meeting.create(
  event_id: 1,
  user_id: 4,
  attending: true,
  address: "210 boulevard voltaire, 75011",
  organizer: false
  )

Meeting.create(
  event_id: 1,
  user_id: 5,
  attending: true,
  address: "1 rue de charonne, 75011",
  organizer: false
  )
