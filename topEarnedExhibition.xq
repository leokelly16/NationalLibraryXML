(:----------------------------------------------------------
 : Function: local:earnings
 : Calculates the total earnings for a given exhibition
 : by summing the amountPaid from bookings made by its visitors.
 :----------------------------------------------------------:)
declare function local:earnings(
  $exhibition as element(exhibition),   (: the exhibition element :)
  $bookings   as element(booking)*      (: all bookings :)
) as xs:decimal {

  (: Sum amountPaid for all bookings whose visitor IDs match :)
  sum(
    for $vId in $exhibition/visitors/visitor/@id     (: visitor IDs in the exhibition :)
    for $b in $bookings[visitors/visitor/@id = $vId] (: matching bookings :)
    return xs:decimal($b/billing/amountPaid)         (: convert amountPaid to decimal :)
  )
};


(: Load exhibitions and bookings data :)
let $exhibitions := doc("exhibition.xml")/nationalLibrary/exhibition
let $bookings    := doc("bookings.xml")/bookings/booking

(:----------------------------------------------------------
 : Build a list of exhibitions, each tagged with its earnings.
 : Sort the list by the computed total earnings (ascending).
 :----------------------------------------------------------:)
let $exhWithEarnings :=
  for $e in $exhibitions
  let $total := local:earnings($e, $bookings)   (: compute earnings :)
  order by $total ascending                      (: sort least to most :)
  return
    <exhibition-earnings
        id="{data($e/@id)}"
        title="{data($e/title)}"
        earned="{$total}"/>

(:----------------------------------------------------------
 : Return the final XML result:
 : - The exhibition with the least earnings
 : - The exhibition with the most earnings
 :----------------------------------------------------------:)
return
  <result>
    <least>
      { $exhWithEarnings[1] }         (: first = least earnings :)
    </least>
    <most>
      { $exhWithEarnings[last()] }    (: last = most earnings :)
    </most>
  </result>
