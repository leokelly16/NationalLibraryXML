(: 
  Retrieves resolved and unresolved conflicts, 
  along with the total number of conflicts 
  recorded across all exhibitions.
:)

(: All conflicts marked as resolved :)
let $resolved := doc("security.xml")//securityTeamConflict[conflictResolved = "Yes"]

(: All conflicts marked as unresolved :)
let $notResolved := doc("security.xml")//securityTeamConflict[conflictResolved = "No"]

let $c := count($resolved)

(: Sum of all numberOfConflicts fields :)
let $total := sum(doc("security.xml")//numberOfConflicts)

let $successInResolving := $c div $total

return
<results>

  <!-- List of all members who resolved conflicts -->
  <ResolvedConflicts>
  {
    for $r in $resolved
    return <securityMember>{ $r/@conflictMember }</securityMember>
  }
  </ResolvedConflicts>

  <!-- List of all members with unresolved conflicts -->
  <NotResolvedConflicts>
  {
    for $nr in $notResolved
    return <securityMember>{ $nr/@conflictMember }</securityMember>
  }
  </NotResolvedConflicts>

  <!-- Number of total conflicts across exhibitions -->
  <TotalConflicts>{ $total }</TotalConflicts>

  <ResolveSuccess>
  {$successInResolving}
  </ResolveSuccess>

</results>
