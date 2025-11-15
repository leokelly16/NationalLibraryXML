(: Gets all showpieces in a specific exhibition. To input the exhibitionId variable in BaseX, press CTRL+SHIFT+E and set name to exhibitionID and the value to the matching exhibitionID you want information for (see exhibition.xml for valid id's for exhibitons). :)

declare variable $exhibitionId external;

for $e in doc("exhibition.xml")//exhibition[@id = $exhibitionId]
  for $s in $e//showpiece
    let $info := doc("showpieces.xml")//showpiece[@id = $s/@id]
      return
        <showpiece>
          {$info/name, $info/material, $info/dateOfRelevance}
        </showpiece>