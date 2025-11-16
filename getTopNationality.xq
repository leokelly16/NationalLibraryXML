let $n := doc("visitors.xml")//nationality
return
  let $most := max(
    for $x in distinct-values($n)
    return count($n[. = $x])
  )
  return
    for $x in distinct-values($n)
    where count($n[. = $x]) = $most
    return $x


