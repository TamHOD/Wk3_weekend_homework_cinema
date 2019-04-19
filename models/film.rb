require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films
    (
      title, price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films
    SET (
      title, price
      ) =
      (
      $1, $2
      ) WHERE id = $3"
      values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT films.* FROM films WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return result
  end

  def self.map_items(film_data)
    results = film_data.map { |film| Film.new(film) }
    return results
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    return self.map_items(films)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
