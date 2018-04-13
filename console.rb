require_relative("models/tickets.rb")
require_relative("models/films.rb")
require_relative("models/customers.rb")
require_relative("db/sql_runner.rb")


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



binding.pry
nil
