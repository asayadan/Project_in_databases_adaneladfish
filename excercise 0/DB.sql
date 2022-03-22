Generate SQL

CREATE TABLE area
(
  areaId NUMERIC(3) NOT NULL,
  areaName VARCHAR(20),
  PRIMARY KEY (areaId)
);

CREATE TABLE agent
(
  agentID NUMERIC(9) NOT NULL,
  agentName VARCHAR(20),
  Rating NUMERIC(2),
  HireYear NUMERIC(4),
  bossID NUMERIC(9),
  salary FLOAT,
  areaId NUMERIC(3) NOT NULL,
  PRIMARY KEY (agentID),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE city
(
  cityName VARCHAR(20) NOT NULL,
  areaId NUMERIC(3) NOT NULL,
  PRIMARY KEY (cityName),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE client
(
  clientID NUMERIC(9) NOT NULL,
  ClientName VARCHAR(20),
  phoneNr NUMERIC(10),
  Adress VARCHAR(25),
  cityName VARCHAR(20) NOT NULL,
  PRIMARY KEY (clientID),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE schedual
(
  meetingTime_ DATE NOT NULL,
  agentID NUMERIC(9) NOT NULL,
  clientID NUMERIC(9) NOT NULL,
  PRIMARY KEY (meetingTime_, agentID, clientID),
  FOREIGN KEY (agentID) REFERENCES agent(agentID),
  FOREIGN KEY (clientID) REFERENCES client(clientID)
);

