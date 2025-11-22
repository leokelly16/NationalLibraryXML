(: 
   Finds security assignments for a specific team member
   Input: staff member name
:)

(: Member name variable :)
declare variable $security-member external;

(: Loop through all security team assignments :)
for $sec in doc("security.xml")//exhibitionSecurity

(: Filter to find teams containing the specified member :)
where $sec/securityTeam/member = $security-member

(: Return security details for that member's assignment :)
return 
  <getStaffSecurityInfo>
    <exhibitionId>{$sec/exhibitionId/text()}</exhibitionId>
    <securityTeamMember>{$security-member}</securityTeamMember>
    <invalidTickets>{$sec/invalidTicketCount/text()}</invalidTickets>
    <teamSize>{$sec/teamSize/text()}</teamSize>
    <securityMeasures>{$sec/securityMeasures/text()}</securityMeasures>
  </getStaffSecurityInfo>