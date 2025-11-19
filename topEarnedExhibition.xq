declare function local:earnings(
  $exhibition as element(exhibition),
  $bookings   as element(booking)*
) as xs:decimal {

  sum(
    for $vId in $exhibition/visitors/visitor/@id
    for $b in $bookings[visitors/visitor/@id = $vId]
    return xs:decimal($b/billing/amountPaid)
  )
};


let $exhibitions := doc("exhibition.xml")/nationalLibrary/exhibition
let $bookings    := doc("bookings.xml")/bookings/booking

(: Build list of exhibitions with calculated earnings :)
let $exhWithEarnings :=
  for $e in $exhibitions
  let $total := local:earnings($e, $bookings)
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
