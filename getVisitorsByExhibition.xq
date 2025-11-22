(: 
  Gets all visitors who attended a specific exhibition.

  To input the exhibitionId variable in BaseX:
  - Press CTRL + SHIFT + E
  - Set the variable name to: exhibitionID
  - Set the value to the exhibition ID you want to query
  (See exhibition.xml for valid exhibition IDs.)
:)

(: External variable for the chosen exhibition ID :)
declare variable $exhibitionId external;

(: Loop through the exhibition with the matching ID :)
for $e in doc("exhibition.xml")//exhibition[@id = $exhibitionId]

  (: Find each visitor listed inside that exhibition :)
  for $v in $e//visitor

    (: Retrieve full visitor info based on visitor ID :)
    let $info := doc("visitors.xml")//visitor[@id = $v/@id]

    (: Return visitor name + email :)
    return
      <visitor>
        {$info/name, $info/email}
      </visitor>
