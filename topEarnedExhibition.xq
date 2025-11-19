

let $exhibitions := doc("exhibition.xml")/nationalLibrary/exhibition
let $bookings    := doc("bookings.xml")/bookings/booking

(:build a list of exhibitions with their total earnings:)  
let $exhWithEarnings :=
  for $e in $exhibitions
  let $total :=
    sum(
      for $vId in $e/visitors/visitor/@id
      for $b in $bookings[visitors/visitor/@id = $vId]
      return xs:decimal($b/billing/amountPaid)
    )
  order by $total ascending
  return
    <exhibition-earnings
        id="{data($e/@id)}"
        title="{data($e/title)}"
        earned="{$total}"/>

return
  <result>
    <least>
      { $exhWithEarnings[1] }
    </least>
    <most>
      { $exhWithEarnings[last()] }
    </most>
  </result>
