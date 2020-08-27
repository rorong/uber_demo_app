# README

It is uber_demo_app.It is basically the admin portal for uber_demo and included api that will use to perform the street runs.There are three roles of user.They are:-
Customer
Admin
Driver

Driver must be approved by the admin then only he will be able to drive.

* Ruby version:- 2.6.3
* Rails version:- 6.0.3

* How to run the test suite
-rails generate simple_form:install
-rails  webpacker:install
-yarn add @rails/webpacker@4.3.0
-yarn add bootstrap@4.3.1 jquery popper.js
-rails assets:precompile

How to run:-
-Admin is created when you run seed
-Customer and driver will be created by api
	URL:- http://localhost:3000/api/v1/users/sign_up
	Method:-POST
	{
		"user":{
			"name": "test",
			"email": "test@abv.com",
			"device": "android",
			"device_token": "APA91bHwJ1oioiXq0WNRCLiRvjIzhVVM4TKLljBBc1kJs7rGenR0kPOw3XCKlZ4kUOqwASjomZRYSWjlr2v25rgB7yTPYBImnsAlCJ2L6A0sv",
			"role": "Driver",
			"latitude": "-90.8734",
			"longitude": "164.9812"
		}
	}
-Sign in by using api
	URL:- http://localhost:3000/api/v1/users/sign_in
	Method:-POST
	{
		"user":{
			"email": "test@abv.com",
			"device": "android",
			"device_token": "APA91bHwJ1oioiXq0WNRCLiRvjIzhVVM4TKLljBBc1kJs7rGenR0kPOw3XCKlZ4kUOqwASjomZRYSWjlr2v25rgB7yTPYBImnsAlCJ2L6A0sv",

			"latitude": "-90.8734",
			"longitude": "164.9812"
		}
	}
-Driver cannot perform street run unless it is approved by admin
	To create street run run this api
	URL:-http://localhost:3000/api/v1/street_runs
	Method:-POST
	{
		"user":{
		"user_id": 4,
		"route_locations_attributes" : [
				{
					"latitude" : "-27.7234",
					"longitude" : "174.9512"
				},
				{
					"latitude" : "-27.7234",
					"longitude" : "174.9512"
				},
				{
					"latitude" : "-90.8734",
					"longitude" : "164.9812"
				},
				{
					"latitude" : "-11.8144",
					"longitude" : "124.9240"
				}
			]
		}
	}
