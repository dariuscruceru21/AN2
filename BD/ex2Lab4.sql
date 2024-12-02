DECLARE @TargetEventId INT = 1; -- Replace with the desired event ID
DECLARE @TopSponsorsCount INT = 3; -- Number of top sponsors to retrieve

SELECT 
    eps.EventTitle,
    eps.ParticipantCount,
    eps.TotalPayments,
    eps.YearlyRank AS PopularityRankThisYear,
    STRING_AGG(CONCAT(ts.SponsorName, ' ($', ts.ContributionAmount, ')'), ', ') AS TopSponsors,
    v.Title AS VenueTitle,
    v.Capacity AS VenueCapacity,
    CASE 
        WHEN eps.ParticipantCount > v.Capacity THEN 'Over Capacity'
        WHEN eps.ParticipantCount = v.Capacity THEN 'Full Capacity'
        ELSE CONCAT(CAST(ROUND((CAST(eps.ParticipantCount AS FLOAT) / v.Capacity) * 100, 2) AS VARCHAR), '% Full')
    END AS CapacityStatus
FROM 
    EventParticipationSummary eps
    CROSS APPLY dbo.GetTopSponsors(eps.EventId, @TopSponsorsCount) ts
    JOIN EventVenues ev ON eps.EventId = ev.EventId
    JOIN Venues v ON ev.VenueId = v.VenueId
WHERE 
    eps.EventId = @TargetEventId
GROUP BY 
    eps.EventId, eps.EventTitle, eps.ParticipantCount, eps.TotalPayments, eps.YearlyRank, v.Title, v.Capacity;


