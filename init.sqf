
ENABLE_REPLAY = paramsArray select 0;
IS_STREAMABLE = paramsArray select 1;

enableSaving [false,false];

firstspawn = false;
[arsenal_blufor] execVM "loadouts\virtual_arsenal_init_blufor.sqf";
[arsenal_opfor] execVM "loadouts\virtual_arsenal_init_opfor.sqf";
cameraOldPimped = compile preprocessFile "spectator\cameraOld_rip.sqf";

[] execVM "CSSA3\CSSA3_init.sqf";



[[
  ["rogaintask","Camp Rogain besichtigen","Unser Auftraggeber möchte den Stützpunkt Camp Rogain besichtigen.",blufor],
  ["generaltask","General besuchen","Ein ehemaliger General lebt im Norden der Insel. Die Zielperson möchte Ihn besuchen.",blufor],
  ["docktask","Öffentlich zeigen","Die Zielperson möchte eine Rede in der Hauptstadt der Insel halten.",blufor],
  ["helitask","Prototyp anschauen","Die Zielperson möchte den neuen Transporthubschrauber besichtigen.",blufor],
  ["killviptask","Eliminiert die Zielperson","Unser Auftrag ist die Zielperson auszuschalten.",opfor]
],[
  ["Credits","Mission by Cuel
  <br />SHK_TASKMASTER 2 Made by: Shuko of LDD Kyllikki"]
]] execvm "shk_taskmaster.sqf";


CUL_fn_end = {
	// called with 0 = [[[WEST],"END1","END MESSAGE"],"CUL_fn_end"] spawn	BIS_fnc_MP
	private ["_type","_win"];
	if (!isDedicated) then {
		player addEventHandler ["Fired",{deleteVehicle (_this select 6)}];
		_win = ((side player) in (_this select 0));
		_type = (_this select 1);
		player switchMove "amovpercmstpslowwrfldnon";
		cutText [(_this select 2),"PLAIN DOWN"];
	}else {_win = true; _type = _this select 1};
	 [_type,_win,[true,10]] call BIS_fnc_endMission;
};

waitUntil {isDedicated || !isNull player};

if (!isDedicated) then {
	[] execVM "initplayer.sqf";
};

if (isServer) then {
	[] execVM "initserver.sqf";
};

SYSTEM_LOG_LEVEL = 0;
if (ENABLE_REPLAY == 1) then {
	execVM "export-missiondata.sqf";
};

	// Intro Gruppe Adler

	titleCut ["", "BLACK FADED", 999];
	[] Spawn {

	titleText ["","PLAIN"];
	titleFadeOut 1;
	sleep 2;

	titleCut ["", "BLACK IN", 1];

	waitUntil {time > 3};
		["<img size= '6' shadow='false' image='Pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>GuardTheVip</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
	};



