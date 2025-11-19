(: Shows the exhibitions for a specific theme. To input the theme variable in BaseX, press CTRL+SHIFT+E and set name to "theme" and the value to any valid exhibition theme (see exhibition.xml for valid themes). :)

declare variable $theme external;

for $e in doc("exhibition.xml")//exhibition[theme = $theme]
  return
    <exhibition>
      {$e/title, $e/description, $e/price, $e/theme, $e/date}
    </exhibition>
