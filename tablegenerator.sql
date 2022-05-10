CREATE TABLE Pricing
(
  name VARCHAR(20) NOT NULL,
  price INT NOT NULL,
  pricing_id INT NOT NULL,
  PRIMARY KEY (pricing_id)
);

CREATE TABLE Costumer
(
  costumer_id INT NOT NULL,
  PRIMARY KEY (costumer_id)
);

CREATE TABLE Car
(
  car_id INT NOT NULL,
  PRIMARY KEY (car_id)
);

CREATE TABLE Extras
(
  extra_id INT NOT NULL,
  description VARCHAR(80) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (extra_id)
);

CREATE TABLE Orders
(
  order_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  costumer_id INT NOT NULL,
  car_id INT NOT NULL,
  pricing_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (costumer_id) REFERENCES Costumer(costumer_id),
  FOREIGN KEY (car_id) REFERENCES Car(car_id),
  FOREIGN KEY (pricing_id) REFERENCES Pricing(pricing_id)
);

CREATE TABLE Cancellations
(
  cancellation_date DATE NOT NULL,
  cause VARCHAR(80) NOT NULL,
  cancelation_id INT NOT NULL,
  ordersId INT,
  PRIMARY KEY (cancelation_id),
  FOREIGN KEY (ordersId) REFERENCES Orders(order_id)
);

CREATE TABLE Payments
(
  payment_id INT NOT NULL,
  sum INT NOT NULL,
  ordersId INT NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (ordersId) REFERENCES Orders(order_id)
);

CREATE TABLE ExtrasForOrders
(
  extra_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (extra_id, order_id),
  FOREIGN KEY (extra_id) REFERENCES Extras(extra_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
