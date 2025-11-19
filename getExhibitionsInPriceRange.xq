(: Shows exhibitions in a user specified price range.To input the minPrice and maxPrice variables in BaseX, press CTRL+SHIFT+E and set:
     name = "minPrice"  value = (user minimum price)
     name = "maxPrice"  value = (user maximum price)
:)

declare variable $minPrice external;
declare variable $maxPrice external;

for $e in doc("exhibition.xml")//exhibition
  let $price := xs:decimal($e/price)
  where $price >= xs:decimal($minPrice)
    and $price <= xs:decimal($maxPrice)
  return
    <exhibition>
      {$e/title, $e/description, $e/price, $e/theme, $e/date}
    </exhibition>
