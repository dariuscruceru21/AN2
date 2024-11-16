



--1
--Querry participants at specific Venue 1 ordered by Registration Date aici de pus mai bine numele 
SELECT p.FirstName, p.LastName, r.RegistrationDate
FROM Participants p
JOIN Registrations r ON p.ParticipantId = r.ParticipantId
JOIN EventVenues ev ON r.EventId = ev.EventId
WHERE ev.VenueId = 1
ORDER BY r.RegistrationDate;

--2
--Count the number of participants registered for each Event
SELECT e.EventId, e.Title, COUNT(r.ParticipantId) AS ParticipantCount
FROM Events e
JOIN Registrations r ON e.EventId = r.EventId
JOIN Participants p ON r.ParticipantId = p.ParticipantId
GROUP BY e.EventId, e.Title;

--3
--lists the total sposnsorship amount for each event. Left outer joins ensures that the ones with no sponsores also appear
SELECT e.EventId, e.Title, COALESCE(SUM(s.ContributionAmount), 0) AS TotalSponsorship
FROM Events e
LEFT OUTER JOIN EventSponsors es ON e.EventId = es.EventId
LEFT OUTER JOIN Sponsors s ON es.SponsorId = s.SponsorId
GROUP BY e.EventId, e.Title;


--4
--find all events where there are more participants that at Venue 3 ceva cu capacity
SELECT e.EventId, e.Title
FROM Events e
WHERE (SELECT COUNT(*) FROM Registrations r WHERE r.EventId = e.EventId) > ALL (
    SELECT COUNT(*) FROM Registrations r
    JOIN EventVenues ev ON r.EventId = ev.EventId
    WHERE ev.VenueId = 3
);


--5
--Participants registered for an event with a venue with a capacity more than 500
SELECT p.FirstName, p.LastName
FROM Participants p
WHERE p.ParticipantId = ANY (
    SELECT r.ParticipantId
    FROM Registrations r
    JOIN EventVenues ev ON r.EventId = ev.EventId
    JOIN Venues v ON ev.VenueId = v.VenueId
    WHERE v.Capacity > 500
);


--6
--selects venues hosting more than 5 events and gives the number of total participants
SELECT v.VenueId, v.Title, COUNT(r.ParticipantId) AS TotalParticipants
FROM Venues v
JOIN EventVenues ev ON v.VenueId = ev.VenueId
JOIN Registrations r ON ev.EventId = r.EventId
GROUP BY v.VenueId, v.Title
HAVING COUNT(r.ParticipantId) > 5;


--7
--list participants that have made a payment or registered for an event nu face sens 
SELECT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
JOIN Payments pay ON p.ParticipantId = pay.ParticipantId
UNION
SELECT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
JOIN Registrations r ON p.ParticipantId = r.ParticipantId;

--8
--lists participants that have made a payment or registered for an event using or la fel schimbat ca mai sus
SELECT DISTINCT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
LEFT JOIN Payments pay ON p.ParticipantId = pay.ParticipantId
LEFT JOIN Registrations r ON p.ParticipantId = r.ParticipantId
WHERE pay.ParticipantId IS NOT NULL OR r.ParticipantId IS NOT NULL;


--9
--list participants who registered for an event and made a payment
SELECT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
JOIN Registrations r ON p.ParticipantId = r.ParticipantId
INTERSECT
SELECT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
JOIN Payments pay ON p.ParticipantId = pay.ParticipantId;



--10
--all events where the contribution amount is greater than 10000
SELECT e.EventId, e.Title, e.Date, e.Location
FROM Events e
WHERE e.EventId IN (
    SELECT es.EventId
    FROM EventSponsors es
    JOIN Sponsors s ON es.SponsorId = s.SponsorId
    WHERE s.ContributionAmount > 10000
);


--11
--find participants who registered for an event but made a payment greater than 500
SELECT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
JOIN Registrations r ON p.ParticipantId = r.ParticipantId
EXCEPT
SELECT p.ParticipantId, p.FirstName, p.LastName
FROM Participants p
JOIN Payments pay ON p.ParticipantId = pay.ParticipantId
WHERE pay.Amount < 500;


--12
--selects the top five participants that made a payment more than 600
SELECT DISTINCT TOP 5 
    p.ParticipantId, 
    p.FirstName, 
    p.LastName, 
    SUM(pay.Amount) AS TotalAmount
FROM Participants p
JOIN Payments pay ON p.ParticipantId = pay.ParticipantId
WHERE p.ParticipantId NOT IN (
    SELECT pay.ParticipantId
    FROM Payments pay
    WHERE pay.Amount < 600  -- Exclude participants with any payment less than 500
)
GROUP BY p.ParticipantId, p.FirstName, p.LastName
ORDER BY TotalAmount DESC;
















