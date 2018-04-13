require_relative("../db/sql_runner")
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

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.show_all()
    sql = "SELECT * FROM customers;"
    results = SqlRunner.run(sql)
    return results.map{ |result| Customer.new(result) }
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_customers(customer_data)
    return customer_data.map{ |customer_data| Customer.new(customer_data) }
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return Film.map_films(results)
  end
  
end

