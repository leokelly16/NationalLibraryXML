(: Gets all visitors who attended a specific exhibition. To input the exhibitionId variable in BaseX, press CTRL+SHIFT+E and set name to exhibitionID and the value to the matching exhibitionID you want information for (see exhibition.xml for valid id's for exhibitons). :)

declare variable $exhibitionId external;

for $e in doc("exhibition.xml")//exhibition[@id = $exhibitionId]
  for $v in $e//visitor
    let $info := doc("visitors.xml")//visitor[@id = $v/@id]
      return
        <visitor>
          {$info/name, $info/email}
        </visitor>
