require("pg")
require_relative("tickets.rb")
require_relative("films.rb")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def intialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @funds = options["funds"].to_i()
  end

  
end
