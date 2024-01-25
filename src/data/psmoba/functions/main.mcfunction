
append function_tag load:load {"values":["psmoba:load"]}
function ./load:
    scoreboard objectives add psmoba dummy
    scoreboard objectives add psmoba.mainhand dummy
    scoreboard objectives add psmoba.offhand dummy
    scoreboard objectives add psmoba.head dummy
    scoreboard objectives add psmoba.chest dummy
    scoreboard objectives add psmoba.legs dummy
    scoreboard objectives add psmoba.feet dummy

    function ./tick

function ./tick:
    schedule function ~/ 1t replace
