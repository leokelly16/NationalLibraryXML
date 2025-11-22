(: 
  Shows exhibitions within a user-specified price range.

  How to use in BaseX:
    - Press CTRL + SHIFT + E
    - Set:
        name = "minPrice"   value = (your minimum price)
        name = "maxPrice"   value = (your maximum price)

  The query returns all exhibitions whose price is between
  the two values (inclusive).
:)

(: External variables for the price range :)
declare variable $minPrice external;
declare variable $maxPrice external;

(: Loop through all exhibitions :)
for $e in doc("exhibition.xml")//exhibition

  (: Convert the exhibition price to a decimal :)
  let $price := xs:decimal($e/price)

  (: Keep only exhibitions within the specified range :)
  where $price >= xs:decimal($minPrice)
    and $price <= xs:decimal($maxPrice)

  (: Return exhibition information :)
  return
    <exhibition>
      {$e/title, $e/description, $e/price, $e/theme, $e/date}
    </exhibition>
