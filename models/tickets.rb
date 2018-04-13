require_relative("../db/sql_runner")

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options["id"].to_i if options ["id"]
    @customer_id = options["customer_id"].to_i
    @film_id = options["film_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    visit = SqlRunner.run(sql, values).first
    @id = visit['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3;"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.show_all()
    sql = "SELECT * FROM tickets;"
    results = SqlRunner.run(sql)
    return results.map{ |result| Ticket.new(result) }
  end
  
  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer_hash = SqlRunner.run(sql, values).first()
    return Customer.new(customer_hash)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.map_tickets(ticket_data)
    return ticket_data.map{ |ticket_data| Ticket.new(ticket_data) }
  end

  
  
end
