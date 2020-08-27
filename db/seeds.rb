# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.new(name: "Uber Admin", email: "admin@uber.com", address: "876-lexington-ave", device: "android", device_token: "c968jE-fr8U:APA91bHwJ1oioiXq0WNRCLiRvjIzhVVM4TKLljBBc1kJs7rGenR0kPOw3XCKlZ4kUOqwASjomZRYSWjlr2v25rgB7yTPYBImnsAlCJ2L6A0sv-mqn9zQ0CO5aLCge7mvY2gw9Qe1kIZg", role: "Admin", latitude: "-37.8136", longitude: "144.9631")
admin.save