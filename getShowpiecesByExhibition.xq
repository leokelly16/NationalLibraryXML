(: 
  Gets all showpieces in a specific exhibition.

  How to use in BaseX:
  - Press CTRL + SHIFT + E
  - Set the variable name to: exhibitionID
  - Set the value to the exhibition ID you want to query
  (Check exhibition.xml for valid exhibition IDs.)
:)

(: External variable that receives the exhibition ID :)
declare variable $exhibitionId external;

(: Find the exhibition with the matching ID :)
for $e in doc("exhibition.xml")//exhibition[@id = $exhibitionId]

  (: Loop through each showpiece listed inside that exhibition :)
  for $s in $e//showpiece

    (: Look up the full showpiece details using its ID :)
    let $info := doc("showpieces.xml")//showpiece[@id = $s/@id]

    (: Return the showpiece information :)
    return
      <showpiece>
        {$info/name, $info/material, $info/dateOfRelevance}
      </showpiece>
