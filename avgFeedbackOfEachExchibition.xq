let $fbDoc  := doc("feedback.xml")
let $libDoc := doc("exhibition.xml")

for $ex in $libDoc/nationalLibrary/exhibition
let $exId := $ex/@id

(: ratings for this exhibition :)
let $ratings :=
  $fbDoc/feedbacks/feedback
      [exhibition/@id = $exId and gaveFeedback = "true"]
      /rating ! xs:decimal(.)

(: calculate average — if no feedback, avg = 0 :)
let $avg :=
  if (count($ratings) = 0)
  then 0
  else avg($ratings)

return
<exhibitionAverageRating>
  <exhibitionId>{$exId}</exhibitionId>
  <title>{ $ex/title/text() }</title>
  <averageRating>{$avg}</averageRating>
</exhibitionAverageRating>
