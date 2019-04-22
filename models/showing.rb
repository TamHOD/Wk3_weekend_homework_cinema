require_relative('../db/sql_runner')

class Showing

  attr_reader :id, :film_id
  attr_accessor :time, :screen

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @time = options['time']
    @screen = options['screen']
  end

  def save()
    sql = "INSERT INTO showings
      (
      film_id, time, screen
      )
      VALUES
      (
      $1, $2, $3
      )
      RETURNING id;"
    values = [@film_id, @time, @screen]
    showing = SqlRunner.run(sql, values).first
    @id = showing['id'].to_i
  end

  def update()
    sql = "UPDATE showings
    SET (
      film_id, time, screen
      ) =
      (
      $1, $2, $3
      ) WHERE id = $4"
      values = [@film_id, @time, @screen, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT showings.* FROM showings WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return result
  end

  def self.map_items(showing_data)
    results = showing_data.map { |showing| Showing.new(showing) }
    return results
  end

  def self.all()
    sql = "SELECT showings.* FROM showings;"
    values = []
    showings = SqlRunner.run(sql, values)
    return self.map_items(showings)
  end

  def self.delete_all()
    sql = "DELETE FROM showings;"
    SqlRunner.run(sql)
  end

end
