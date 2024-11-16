use EventManagment;

INSERT into Events(EventId,Title,[Date],[Location])
Values(4,'Untold','2024-07-21','Cluj-Napoca');

SELECT * 
from Events;

SELECT * 
from Participants;

Select * 
from Payments;

insert into Participants(ParticipantId,LastName,FirstName,Email,EventId)
Values(4,'Cruceru','Darius','dariuscruceru@gmail.com',4);


insert into Participants(ParticipantId,LastName,FirstName,Email,EventId)
Values(5,'Cruceru','Darius','dariuscruceru@gmail.com',5);

insert into Payments(PaymentId,ParticipantId,Amount,[Date])
VALUES(4,4,200,'2024-07-09')


DELETE FROM Participants
WHERE ParticipantId in(2,3)


insert into Payments(PaymentId,ParticipantId,Amount,[Date])
VALUES(5,5,150,'2024-07-09')


Update Participants
set Email = 'updatedemail@gmail.com'
Where EventId in (1,4)
and LastName is not NULL;

DELETE FROM Payments
WHERE ParticipantId in(2,3)

UPDATE Payments
set Amount = 300
Where Amount BETWEEN 150 and 200

UPDATE Participants
set Email = 'dariuscruceru@gmail.com'
Where LastName LIKE 'C%'












