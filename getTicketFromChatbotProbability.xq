let $a := count(/chatbot/chatbotSession[boughtTickets = "Yes"])
let $b := count(//chatbotSession)
let $c := (/chatbot/chatbotSession/sessionInMinutes)
let $avg := avg($c)

return 

<AverageSessionInMinutes>
{$avg}
</AverageSessionInMinutes>
<probabilityBuyingTicket>
{$a div $b}
</probabilityBuyingTicket>