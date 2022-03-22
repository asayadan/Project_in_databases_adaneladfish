CREATE TABLE Pricing
(
  name VARCHAR(30) NOT NULL,
  price INT NOT NULL,
  pricinId INT NOT NULL,
  PRIMARY KEY (pricinId)
);

CREATE TABLE Costumer
(
  costumerId INT NOT NULL,
  PRIMARY KEY (costumerId)
);

CREATE TABLE Car
(
  carId INT NOT NULL,
  PRIMARY KEY (carId)
);

CREATE TABLE Extras
(
  extrasId INT NOT NULL,
  description VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (extrasId)
);

CREATE TABLE Orders
(
  ordersId INT NOT NULL,
  date DATE NOT NULL,
  costumerId INT NOT NULL,
  carId INT NOT NULL,
  pricinId INT NOT NULL,
  PRIMARY KEY (ordersId),
  FOREIGN KEY (costumerId) REFERENCES Costumer(costumerId),
  FOREIGN KEY (carId) REFERENCES Car(carId),
  FOREIGN KEY (pricinId) REFERENCES Pricing(pricinId)
);

CREATE TABLE Cancellations
(
  cancellationDate DATE NOT NULL,
  cause VARCHAR(100) NOT NULL,
  cancelationId INT NOT NULL,
  ordersId INT,
  PRIMARY KEY (cancelationId),
  FOREIGN KEY (ordersId) REFERENCES Orders(ordersId)
);

CREATE TABLE Payments
(
  paymentsId INT NOT NULL,
  sum INT NOT NULL,
  ordersId INT NOT NULL,
  PRIMARY KEY (paymentsId),
  FOREIGN KEY (ordersId) REFERENCES Orders(ordersId)
);

CREATE TABLE ExtrasForOrders
(
  extrasId INT NOT NULL,
  ordersId INT NOT NULL,
  PRIMARY KEY (extrasId, ordersId),
  FOREIGN KEY (extrasId) REFERENCES Extras(extrasId),
  FOREIGN KEY (ordersId) REFERENCES Orders(ordersId)
);
