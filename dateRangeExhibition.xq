let $doc := db:get("exhibition.xml")

for $ex in $doc/nationalLibrary/exhibition
let $dateRaw := string($ex/date)

(: remove slashes or any non-digits :)
let $date := replace($dateRaw, "[^0-9]", "")

(: now $date = "02112025" :)
let $day   := xs:integer(substring($date, 1, 2))
let $month := xs:integer(substring($date, 3, 2))
let $year  := xs:integer(substring($date, 5, 4))

(: select November 2025 :)
where $month = 11 and $year = 2025

return
  <novemberExhibition>
    { $ex/@id }
    { $ex/title }
    { $ex/description }
    { $ex/price }
    { $ex/theme }
    { $ex/date }
  </novemberExhibition>
