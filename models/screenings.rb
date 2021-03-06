require("pg")
require_relative("../db/sql_runner")

class Screening
  attr_reader :id
  attr_accessor :film_id, :show_time

  def initialize(options)
    @id = options["id"]
    @film_id = options["film_id"].to_i
    @show_time = options["show_time"]
  end

  def save()
    sql = "INSERT INTO screenings (film_id, show_time) VALUES ($1, $2) RETURNING id"
    values = [@film_id, show_time]
    visit = SqlRunner.run(sql, values).first
    @id = visit['id'].to_i
  end

  def update()
    sql = "UPDATE screenings SET (film_id, show_time) = ($1, $2) WHERE id = $3;"
    values = [@film_id, @show_time, @id]
    SqlRunner.run(sql, values)
  end

  def self.show_all()
    sql = "SELECT * FROM screenings;"
    results = SqlRunner.run(sql)
    return results.map{ |result| Screening.new(result) }
  end

  def self.playing()
    sql = "SELECT films.*, screenings.* FROM films INNER JOIN screenings ON screenings.film_id = films.id;"
    results = SqlRunner.run(sql)
    return results.map{ |result| Screening.new(result) }
  end

  def self.customer_bookings()
    sql = "SELECT films.title, customers.name FROM films, customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE films.id = tickets.film_id;"
    SqlRunner.run(sql)
    
  end

  
end
