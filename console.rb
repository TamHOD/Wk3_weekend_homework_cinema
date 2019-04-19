require_relative( 'models/customer' )
require_relative( 'models/showing' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()

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

binding.pry
nil
