require_relative("models/tickets.rb")
require_relative("models/films.rb")
require_relative("models/customers.rb")
require_relative("db/sql_runner.rb")

require("pry-byebug")

customer1 = Customer.new(
  {
    "name" => "Scott",
    "funds" => 5000    
  }
)

customer1.save()

customer2 = Customer.new(
  {
    "name" => "Diana",
    "funds" => 1000    
  }
)

customer2.save()

film1 = Film.new(
  {
    "title" => "The Matrix",
    "price" => 10
  }
)

film1.save()

ticket1 = Ticket.new({
                     "customer_id" => customer1.id,
                     "film_id" => film1.id
                     })
                     
ticket1.save()

binding.pry
nil
