declare function local:proportion(
  $total as xs:integer,
  $gave  as xs:integer
) as xs:decimal {

  if ($total = 0)
  then 0
  else $gave div $total
};


let $totalVisitors := count(doc("feedbacks.xml")/feedbacks/feedback)
let $gaveFeedback  := count(doc("feedbacks.xml")/feedbacks/feedback[gaveFeedback = "true"])

(: call the function :)
let $proportion := local:proportion($totalVisitors, $gaveFeedback)

return
<proportionOfVisitorsWhoGaveFeedback>
  <totalVisitors>{$totalVisitors}</totalVisitors>
  <visitorsWhoGaveFeedback>{$gaveFeedback}</visitorsWhoGaveFeedback>
  <proportion>{$proportion}</proportion>
</proportionOfVisitorsWhoGaveFeedback>
