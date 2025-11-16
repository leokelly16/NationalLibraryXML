let $totalVisitors := count(doc("feedbacks.xml")/feedbacks/feedback)
let $gaveFeedback := count(doc("feedbacks.xml")/feedbacks/feedback[gaveFeedback = "true"])

let $proportion :=
    if ($totalVisitors = 0)
    then 0
    else $gaveFeedback div $totalVisitors

return
<proportionOfVisitorsWhoGaveFeedback>
  <totalVisitors>{$totalVisitors}</totalVisitors>
  <visitorsWhoGaveFeedback>{$gaveFeedback}</visitorsWhoGaveFeedback>
  <proportion>{$proportion}</proportion>
</proportionOfVisitorsWhoGaveFeedback>

