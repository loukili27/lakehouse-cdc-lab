CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULL CHECK (gender IN ('M','F','Other')),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL REFERENCES customers(id),
  amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO customers(name, gender) VALUES
('Alice','F'), ('Bob','M'), ('Sam','Other');

INSERT INTO orders(customer_id, amount) VALUES
(1, 120.50), (2, 55.00), (1, 10.00);
