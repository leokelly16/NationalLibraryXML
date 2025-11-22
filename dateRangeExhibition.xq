(: Load the exhibition XML document from the database :)
let $doc := db:get("exhibition.xml")

(: Iterate through each exhibition :)
for $ex in $doc/nationalLibrary/exhibition

  (: Extract the date as plain text, e.g. "02/11/2025" :)
  let $dateRaw := string($ex/date)

  (: Remove all slashes or non-digit characters.
     Example: "02/11/2025" → "02112025" :)
  let $date := replace($dateRaw, "[^0-9]", "")

  (: Extract day, month, and year from cleaned string :)
  let $day   := xs:integer(substring($date, 1, 2))
  let $month := xs:integer(substring($date, 3, 2))
  let $year  := xs:integer(substring($date, 5, 4))

  (: Filter: select only exhibitions from November 2025 :)
  where $month = 11 and $year = 2025

  (: Build the result element :)
  return
    <novemberExhibition>
      { $ex/@id }
      { $ex/title }
      { $ex/description }
      { $ex/price }
      { $ex/theme }
      { $ex/date }
    </novemberExhibition>
