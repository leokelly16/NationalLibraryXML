(: 
  Shows security info containing invalidTicketCount in range
  min-ticket to max-ticket
  Input: lower bound, upper bound
:)

(: Set default lower bound to 0:)
declare variable $min-tickets external := 0;    
(: Set default upper bound to 1000 (should cover full range of securityInfo) :)
declare variable $max-tickets external := 1000; 

(: Loop through all security entries :)
for $sec in doc("security.xml")//exhibitionSecurity

(: Filter where ticket count falls within specified range :)
where $sec/invalidTicketCount >= $min-tickets 
  and $sec/invalidTicketCount <= $max-tickets

(: Return matching security team details :)
return 
  <securityResults>
    <exhibitionId>{$sec/exhibitionId/text()}</exhibitionId>
    <invalidTickets>{$sec/invalidTicketCount/text()}</invalidTickets>
    <teamSize>{$sec/teamSize/text()}</teamSize>
    <securityTeam>{$sec/securityTeam/text()}</securityTeam>
    <securityMeasures>{$sec/securityMeasures/text()}</securityMeasures>
  </securityResults> 