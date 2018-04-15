require_relative("models/tickets.rb")
require_relative("models/films.rb")
require_relative("models/customers.rb")
require_relative("db/sql_runner.rb")

require("pry-byebug")

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({"name" => "Scott",
"funds" => 5000})
customer1.save()

customer2 = Customer.new({"name" => "Diana", "funds" => 1000})
customer2.save()

customer3 = Customer.new({"name" => "Elina", "funds" => 4000})
customer3.save()

customer4 = Customer.new({"name" => "Kieran", "funds" => 6000})
customer4.save()

film1 = Film.new({"title" => "The Matrix", "price" => 10})
film1.save()

film2 = Film.new({"title" => "Equilibrium", "price" => 8})
film2.save()

film3 = Film.new({"title" => "Kung Fury", "price" => 4})
film3.save()

film4 = Film.new({"title" => "Old Boy", "price" => 12})
film4.save()

film5 = Film.new({"title" => "Schinedler's List", "price" => 11})
film5.save()

film6 = Film.new({"title" => "Wargames", "price" => 8})
film6.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save()

ticket2 = Ticket.new({"customer_id" => customer2.id,"film_id" => film1.id})
ticket2.save()

ticket3 = Ticket.new({"customer_id" => customer3.id,"film_id" => film3.id})
ticket3.save()

ticket4 = Ticket.new({"customer_id" => customer1.id, "film_id" => film3.id})
ticket3.save()

ticket4 = Ticket.new({"customer_id" => customer4.id, "film_id" => film4.id})
ticket4.save()

ticket5 = Ticket.new({"customer_id" => customer1.id, "film_id" => film5.id})
ticket5.save()

ticket6 = Ticket.new({"customer_id" => customer2.id, "film_id" => film5.id})
ticket6.save()


binding.pry
nil
