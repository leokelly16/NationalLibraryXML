(: Function to calculate the proportion of visitors who gave feedback :)
declare function local:proportion(
  $total as xs:integer,     (: total number of visitors :)
  $gave  as xs:integer      (: number of visitors who gave feedback :)
) as xs:decimal {

  (: Avoid division by zero :)
  if ($total = 0)
  then 0
  else $gave div $total      (: Calculate proportion :)
};


(: Count total feedback entries :)
let $totalVisitors := count(doc("feedback.xml")/feedbacks/feedback)

(: Count only feedback entries where gaveFeedback = "true" :)
let $gaveFeedback  := count(doc("feedback.xml")/feedbacks/feedback[gaveFeedback = "true"])

(: Call the proportion function :)
let $proportion := local:proportion($totalVisitors, $gaveFeedback)

(: Return result as XML :)
return
<proportionOfVisitorsWhoGaveFeedback>
  <totalVisitors>{$totalVisitors}</totalVisitors>
  <visitorsWhoGaveFeedback>{$gaveFeedback}</visitorsWhoGaveFeedback>
  <proportion>{$proportion}</proportion>
</proportionOfVisitorsWhoGaveFeedback>
