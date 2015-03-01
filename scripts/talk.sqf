//------------------------------
// Script: talk.sqf
// Writer: Cuel
// Created: 2013-03-10
// Edited: 2013-03-14
//------------------------------
//this addAction["<t color='#A1C7A2'>[- Reden -]</t>","scripts\talk.sqf",0, 100, true, true, "","player distance general < 4 && alive general && player == vip"];

(_this select 0) removeAction (_this select 2);

_unit = general;
_exit = false;
hint "Bleiben Sie in der Nähe des Generals";

sleep 3;
cutText ["General: Schön dass Sie es geschafft haben.","PLAIN"];
sleep 2;
_sentarr = [
	"Ich befürchte wir sind bereits Ziele.",
	"Die Situation spitzt sich zu.",
	"Der Koffer ist verschwunden.",
	"Ich verstehe nicht wie das passieren konnte.",
	"Niemand hat eine tiefere Stimme als Sim....*hust*.",
	"Die Gefahr ist aktuell.",
	"Es ist Zeit.",
	"Warum höre ich erst jetzt von Ihnen?",
	"Wohlmöglich ist es schon zu spät.",
	"Sie haben mich lange gefoltert. Ich habe nichts gesagt. ",
	"Diese Soldaten werden Sie nicht schützen können.",
	"Hier ist es deutlich ruhiger als in Takistan, 1986.",
	"Erinnerst du dich an Mogadischu, 1991?",
	"Ich fühle mich beobachtet.",
	"Haben Sie den Koffer dabei?.",
	"Mein Rücken bringt mich noch um.",
	"Ich rate Ihnen sich schnellsten von dieser Insel zu entfernen.",
	"Passen Sie auf sich auf."
	"Mein eigentlicher Name ist Wurstkuchen."
];

for "_i" from 0 to 6 do
{
	if (player distance _unit > 10) exitWith {_exit = true};
	_nr = _sentarr select (floor (random (count _sentarr)));
	cutText [format ["General: %1",_nr],"PLAIN"];
	_sentarr = _sentarr - [_nr];
	sleep 6 + (random 5);
};
if (_exit) exitWith {hint "Bleib in der Nähe des Generals!"; _unit addAction["<t color='#A1C7A2'>[- Reden -]</t>","scripts\talk.sqf",0, 100, true, true, "","player distance general < 4 && alive general && player == vip"]; };

cutText [ "General: Es war schön Sie wiederzusehen!","PLAIN"];

CUL_talked = true; publicVariable "CUL_talked";
