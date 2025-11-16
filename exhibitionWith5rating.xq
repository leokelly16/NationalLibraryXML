let $fbDoc  := doc("feedbacks.xml")
let $libDoc := doc("nationalLibrary.xml")

for $exId in distinct-values(
               $fbDoc/feedbacks/feedback[gaveFeedback = "true"]/exhibition/@id
             )
let $ratings :=
  $fbDoc/feedbacks/feedback
    [gaveFeedback = "true" and exhibition/@id = $exId]
    /rating ! xs:decimal(.)
let $avg := avg($ratings)

(: filter for exhibitions with avg = 5 :)
where $avg = 5

let $exNode :=
  $libDoc/nationalLibrary/exhibition[@id = $exId]

return
<exhibitionWithRating5>
  { $exNode/@id }
  { $exNode/title }
  { $exNode/description }
  { $exNode/price }
  { $exNode/theme }
  <averageRating>{$avg}</averageRating>
</exhibitionWithRating5>
