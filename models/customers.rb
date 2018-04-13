require_relative("tickets.rb")
require_relative("films.rb")
require('pry-byebug')


class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
    @funds = options["funds"].to_i()
  end


  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  
end

