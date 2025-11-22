(: Load the feedback and exhibition XML documents :)
let $fbDoc  := doc("feedback.xml")
let $libDoc := doc("exhibition.xml")

(: Loop through each exhibition :)
for $ex in $libDoc/nationalLibrary/exhibition
let $exId := $ex/@id     (: store exhibition ID :)

  (:---------------------------------------------------------
     Select all ratings for this exhibition:
     - Match feedback entries whose exhibition/@id matches $exId
     - Only include those where gaveFeedback = "true"
     - Extract <rating> values and convert them to decimals
   ---------------------------------------------------------:)
  let $ratings :=
    $fbDoc/feedbacks/feedback
      [exhibition/@id = $exId and gaveFeedback = "true"]
      /rating ! xs:decimal(.)
      
  (:---------------------------------------------------------
     Calculate average rating:
     - If no ratings exist, return 0
     - Otherwise compute avg() of all rating values
   ---------------------------------------------------------:)
  let $avg :=
    if (count($ratings) = 0)
    then 0
    else avg($ratings)

  (: Return the exhibition rating information :)
  return
    <exhibitionAverageRating>
      <exhibitionId>{$exId}</exhibitionId>
      <title>{ $ex/title/text() }</title>
      <averageRating>{$avg}</averageRating>
    </exhibitionAverageRating>
