CREATE TABLE Events(
EventId int NOT NULL,
Title varchar(50) NOT NULL,
Date date,
Location varchar(50),
PRIMARY KEY (EventId));


CREATE TABLE Participants(
ParticipantId int NOT NULL,
LastName varchar(50) NOT NULL,
FirstName VARCHAR(50) Not NULL,
Email varchar(50),
PRIMARY KEY (ParticipantId));


CREATE TABLE Registrations(
EventId int NOT NULL,
ParticipantId int NOT NULL,
RegistrationDate DATE NOT NULL,
PRIMARY KEY(EventId,ParticipantId)
);

CREATE TABLE Venues(
VenueId int NOT NULL,
Title VARCHAR(50) NOT NULL,
Capacity int Not NULL,
PRIMARY KEY (VenueId)
);

CREATE TABLE EventVenues(
EventId int not null,
VenueId int not null,
PRIMARY KEY(EventId, VenueId)
);

CREATE table Sponsors(
SponsorId int not null,
Titel VARCHAR(50) not null,
ContributionAmount int not null
PRIMARY KEY(SponsorId)
);

Create TABLE EventSponsors(
EventId int not null,
SponsorId int not null,
PRIMARY KEY(EventId,SponsorId)
);

CREATE TABLE Organizers(
OrganizerId VARCHAR(50),
LastName VARCHAR(50),
FirstName VARCHAR(50),
PhoneNumber VARCHAR(50),
PRIMARY KEY(OrganizerId)
);

DROP TABLE Organizers;

CREATE TABLE Organizers(
OrganizerId VARCHAR(50) not null,
LastName VARCHAR(50) not null,
FirstName VARCHAR(50) not null,
PhoneNumber VARCHAR(50) not null,
PRIMARY KEY(OrganizerId)
);

CREATE table EventOrganizers(
EventId int not null,
OrganizerId int not NULL,
PRIMARY KEY(EventId,OrganizerId)
);

Create TABLE Payments(
PaymentId int not null,
ParticipantId int not null,
Amount int not null,
Date date not null,
PRIMARY KEY(PaymentId)
);

ALTER TABLE Registrations
add CONSTRAINT FK_Event
FOREIGN key(EventId) REFERENCES Events(EventId);

ALTER TABLE Registrations
add CONSTRAINT FK_Participant
FOREIGN KEY(ParticipantId) REFERENCES Participants(ParticipantId);

alter TABLE EventVenues
add CONSTRAINT FK_Event_Venues
FOREIGN KEY(EventId) REFERENCES Events(EventId);

alter table EventVenues
add CONSTRAINT FK_Venues
FOREIGN KEY(VenueId) REFERENCES Venues(VenueId);

alter table EventSponsors
add CONSTRAINT FK_Event_Sponsor
FOREIGN KEY(EventId) REFERENCES Events(EventId);

ALTER TABLE EventSponsors
add CONSTRAINT FK_Sponsor_For_Event
FOREIGN KEY(SponsorId) REFERENCES Sponsors(SponsorId);

alter TABLE EventOrganizers
add CONSTRAINT FK_Event_Organizer
FOREIGN KEY(EventId) REFERENCES Events(EventId);

alter TABLE EventOrganizers
add CONSTRAINT FK_Organizer_For_Event
FOREIGN KEY(OrganizerId) REFERENCES Organizers(OrganizerId);

alter table Participants
add CONSTRAINT FK_Participant_At_Event
FOREIGN KEY(EventId) REFERENCES Events(EventId);