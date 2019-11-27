# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
User.destroy_all
Meeting.destroy_all

event = Event.create(
  date: Date.today,
  start_time: Time.now + 3700,
  deadline: Time.now + 1800,
  )

thibaud = User.create(
  name: "Thibaud",
  phone_number: "0627801824"
  )

michel = User.create(
  name: "Michel",
  phone_number: "0627801825"
  )

robert = User.create(
  name: "Robert",
  email: "robert@lewagon.com",
  password: "123456",
  phone_number: "0627801826"
  )

daniel = User.create(
  name: "Daniel",
  phone_number: "0627801827"
  )

atchoum = User.create(
  name: "Atchoum",
  phone_number: "0627801828"
  )

Meeting.create(
  event_id: event,
  user_id: thibaud,
  attending: true,
  address: "11 rue de l'Orillon, 75011",
  organizer: true
  )

Meeting.create(
  event_id: event,
  user_id: michel,
  attending: true,
  address: "11 rue de Rivoli, 75001",
  organizer: true
  )

Meeting.create(
  event_id: event,
  user_id: robert,
  attending: false,
  address: "67 boulevard de la Villette, 75020",
  organizer: false
  )

Meeting.create(
  event_id: event,
  user_id: daniel,
  attending: true,
  address: "210 boulevard voltaire, 75011",
  organizer: false
  )

Meeting.create(
  event_id: event,
  user_id: atchoum,
  attending: true,
  address: "1 rue de charonne, 75011",
  organizer: false
  )
