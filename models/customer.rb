require_relative('../db/sql_runner')
require_relative( 'ticket' )
class Customer

  attr_reader :name, :id
  attr_accessor :funds

  def initialize(options)
    @id = options['id'].to_i if ['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers
      (
      name, funds
      )
      VALUES
      (
      $1, $2
      )
      RETURNING id;"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers
    SET (
      name, funds
      ) =
      (
      $1, $2
      ) WHERE id = $3"
      values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN showings
    ON showings.film_id = films.id
    INNER JOIN tickets
    ON tickets.showing_id = showings.id
    WHERE tickets.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    films_list = results.map { |film| Film.new(film) }
    return films_list
  end



  def self.find(id)
    sql = "SELECT customers.* FROM customers WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return result
  end

  def self.map_items(customer_data)
    results = customer_data.map { |customer| Customer.new(customer) }
    return results
  end

  def self.all()
    sql = "SELECT customers.* FROM customers;"
    values = []
    customers = SqlRunner.run(sql, values)
    return self.map_items(customers)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

end
