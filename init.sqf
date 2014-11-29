enableSaving [false,false];

[[
  ["rogaintask","Camp Rogain besichtigen","Unser Auftraggeber möchte den Stützpunkt Camp Rogain besichtigen.",blufor],
  ["generaltask","General besuchen","Ein ehemaliger General lebt im Norden der Insel. Die Zielperson möchte Ihn besuchen.",blufor],
  ["docktask","Öffentlich zeigen","Die Zielperson möchte eine Rede in der Hauptstadt der Insel halten.",blufor],
  ["helitask","Prototyp anschauen","Die Zielperson möchte den neuen Transporthubschrauber besichtigen.",blufor],
  ["killviptask","Eleminiert die Zielperson","Unser Auftrag ist die Zielperson auszuschalten.",opfor]
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

