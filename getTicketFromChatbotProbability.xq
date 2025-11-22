(: Count how many visitors bought tickets :)
let $a := count(/chatbot/chatbotSession[boughtTickets = "Yes"])

(: Count total number of chatbot sessions :)
let $b := count(/chatbot/chatbotSession)

(: Extract all session durations :)
let $c := count(/chatbot/chatbotSession/sessionInMinutes)

(: Calculate average session time :)
let $avg := avg($c)

(: Return results in XML format :)
return 
<result>
  <AverageSessionInMinutes>
    {$avg}
  </AverageSessionInMinutes>

  <probabilityBuyingTicket>
    {$a div $b}
  </probabilityBuyingTicket>
</result>
