require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :customer_id, :showing_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @showing_id = options['showing_id']
  end

  def save()
    sql = "INSERT INTO tickets
      (
      customer_id, showing_id
      )
      VALUES
      (
      $1, $2
      )
      RETURNING id;"
    values = [@customer_id, @showing_id]
    showing = SqlRunner.run(sql, values).first
    @id = showing['id'].to_i
  end

  def self.count_by_customer(customer_id)
    sql = "SELECT tickets.* FROM tickets WHERE customer_id = $1;"
    values = [customer_id]
    results = SqlRunner.run(sql, values)
    tickets = results.map { |ticket| Ticket.new(ticket)  }
    return tickets.count
  end



  def self.find(id)
    sql = "SELECT tickets.* FROM tickets WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return result
  end

  def self.map_items(ticket_data)
    results = ticket_data.map { |ticket| Ticket.new(ticket) }
    return results
  end

  def self.all()
    sql = "SELECT tickets.* FROM tickets;"
    values = []
    showings = SqlRunner.run(sql, values)
    return self.map_items(tickets)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

end
