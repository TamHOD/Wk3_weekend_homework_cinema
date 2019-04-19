DROP TABLE tickets;
DROP TABLE showings;
DROP TABLE films;
DROP TABLE customers;

  CREATE TABLE customers
  (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    funds INT2
  );

  CREATE TABLE films
  (
    id SERIAL4 PRIMARY KEY,
    title VARCHAR(255),
    price INT2
  );

  CREATE TABLE showings
  (
    id SERIAL4 PRIMARY KEY,
    film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
    fee INT4,
    time VARCHAR(255)

  );

  CREATE TABLE tickets
  (
    id SERIAL4 PRIMARY KEY,
    customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
    showing_id INT4 REFERENCES showings(id) ON DELETE CASCADE,
    fee INT4
  );
