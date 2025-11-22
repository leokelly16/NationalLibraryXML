(: Get all nationality values from visitors.xml :)
let $n := doc("visitors.xml")//nationality

return
  (: Find the highest count of any nationality :)
  let $most := max(
    for $x in distinct-values($n)
    return count($n[. = $x])
  )
  return
    (: Return each nationality whose count equals the maximum :)
    for $x in distinct-values($n)
    where count($n[. = $x]) = $most
    return 
      <MostOccurringNationality>
        {$x}
      </MostOccurringNationality>
