let $doc := doc("nationalLibrary.xml")

for $ex in $doc/nationalLibrary/exhibition
let $date := $ex/date/string()

<!-- extract month and year from DD/MM/YYYY -->
let $day   := xs:integer(substring($date, 1, 2))
let $month := xs:integer(substring($date, 4, 2))
let $year  := xs:integer(substring($date, 7, 4))

<!-- select November exhibitions -->
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
