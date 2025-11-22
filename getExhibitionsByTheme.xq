(: 
  Shows all exhibitions that match a user-specified theme.

  How to use in BaseX:
    - Press CTRL + SHIFT + E
    - Set:
         name = "theme"
         value = (any valid exhibition theme)
  
  Check exhibition.xml for valid theme values.
:)

(: External variable for the selected theme :)
declare variable $theme external;

(: Select exhibitions where the theme matches the user's input :)
for $e in doc("exhibition.xml")//exhibition[theme = $theme]

  (: Return all key exhibition details :)
  return
    <exhibition>
      {$e/title, $e/description, $e/price, $e/theme, $e/date}
    </exhibition>
