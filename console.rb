require_relative( 'models/customer' )
require_relative( 'models/showing' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )
require_relative( 'models/ticket_office' )

require( 'pry-byebug' )

Ticket.delete_all()
Showing.delete_all()
Customer.delete_all()
Film.delete_all()

ticket_office = TicketOffice.new(100)

film1 = Film.new({'title' => 'The Prestige', 'price' => 10})
film2 = Film.new({'title' => 'Inception', 'price' => 6})
film3 = Film.new({'title' => 'Interstellar', 'price' => 7})
film4 = Film.new({'title' => 'Batman Begins', 'price' => 10})

film1.save()
film2.save()
film3.save()
film4.save()

customer1 = Customer.new({'name' => 'Joe', 'funds' => 50})
customer2 = Customer.new({'name' => 'Jay', 'funds' => 40})
customer3 = Customer.new({'name' => 'Jo', 'funds' => 55})
customer4 = Customer.new({'name' => 'Jim', 'funds' => 60})
customer5 = Customer.new({'name' => 'Jill', 'funds' => 30})
customer6 = Customer.new({'name' => 'Jazz', 'funds' => 40})
customer7 = Customer.new({'name' => 'Jip', 'funds' => 32})
customer8 = Customer.new({'name' => 'Jerry', 'funds' => 10})

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()
customer7.save()
customer8.save()

showing1 = Showing.new({'film_id' => film1.id, 'time' => '20:30', 'screen' => '2'})
showing2 = Showing.new({'film_id' => film3.id, 'time' => '21:00', 'screen' => '1'})
showing3 = Showing.new({'film_id' => film4.id, 'time' => '12:50', 'screen' => '4'})
showing4 = Showing.new({'film_id' => film2.id, 'time' => '17:00', 'screen' => '3'})
showing5 = Showing.new({'film_id' => film1.id, 'time' => '15:15', 'screen' => '1'})
showing6 = Showing.new({'film_id' => film1.id, 'time' => '18:00', 'screen' => '2'})
showing7 = Showing.new({'film_id' => film3.id, 'time' => '17:15', 'screen' => '4'})
showing8 = Showing.new({'film_id' => film4.id, 'time' => '14:00', 'screen' => '2'})
showing9 = Showing.new({'film_id' => film2.id, 'time' => '18:50', 'screen' => '3'})

showing1.save()
showing2.save()
showing3.save()
showing4.save()
showing5.save()
showing6.save()
showing7.save()
showing8.save()
showing9.save()



ticket_office.sell_ticket(customer1, showing1)
ticket_office.sell_ticket(customer1, showing2)
ticket_office.sell_ticket(customer2, showing2)
ticket_office.sell_ticket(customer3, showing2)
ticket_office.sell_ticket(customer4, showing2)
customer1.update()

binding.pry
nil
