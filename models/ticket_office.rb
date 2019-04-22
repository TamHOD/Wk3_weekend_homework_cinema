require_relative('../db/sql_runner')
require_relative('customer')
require_relative('ticket')
require_relative('showing')
require_relative('film')

class TicketOffice

 def initialize(till = 0)
   @till = till
 end

 def sell_ticket(customer, showing)
   sql = "SELECT films.* FROM films
   WHERE films.id = $1"
   values = [showing.film_id]
   price = SqlRunner.run(sql, values).first
   customer.funds -= price['price'].to_i
   ticket = Ticket.new({'customer_id' => customer.id, 'showing_id' => showing.id})
   ticket.save()
 end

end
