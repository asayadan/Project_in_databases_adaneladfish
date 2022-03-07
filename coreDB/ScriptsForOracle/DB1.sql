

create table area(areaId number(3) primary key,
                  areaName varchar(20));
                  
create table city(cityName  varchar(20) primary key,
                  areaId    number(3) references  area);

create table agent(agentID    number(9) primary key,   
                   agentName  varchar(20), 
				   areaID     number(3) references  area, 
				   Rating     number(2), 
				   HireYear   number(4), 
				   bossID     number(9), 
				   salary     float);

create table client(clientID    number(9) primary key, 
                    clientName  varchar(20), 
					          agentID     number(9) references  agent, 
					          phoneNr     varchar(10), 
					          Address     varchar(25), 
					          cityName    varchar(20) references city);

create table schedule(agentId  number(9),
                      clientId number(9),
                      meetingTime date,
					            primary key (agentId, clientId, meetingTime),
					            foreign key (agentId) references  agent,
					            foreign key (clientId) references client);
					  
