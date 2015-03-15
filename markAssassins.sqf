//------------------------------
// Script: markAssassins.sqf
// Writer: Cuel
// Created: 2013-03-10
// Edited: 
//------------------------------


if (isDedicated || ((side player) != opfor)) exitWith {};

private ["_markArr", "_mark","_id", "_markercolor"];
players = [];
if (!isMultiplayer) then {players = switchableUnits} else {
	players = playableUnits;
};
[] spawn {
	_markArr2 = [];
	while {true} do {
		{
		if (side _x == side player) then {
			_id=format["tark_%1",_x];
			_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
			_mark setMarkerShapeLocal "ICON";
			_mark setMarkerTypeLocal "mil_dot";
			if (vehicle _x != _x) then {_mark setMarkerTypeLocal "mil_box"};
			_mark setMarkerColorLocal "ColorRed";
			_mark setMarkerTextLocal format [" %1",name _x];
			sleep 0.02;
			_markArr2 = _markArr2 + [_mark];
		};
		} forEach players;
		sleep 5;
		{
			deleteMarkerLocal _x
		}forEach _markArr2;
	};
};
while {true} do {
	waitUntil {sleep 0.2; alive player};
	_markArr = [];
	{
	if (vehicle _x != _x && alive _x  && side  _x != side player) then {
		if (driver (vehicle _x) == _x) then {
		_id=format["trk_%1",_x];
		_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
		_mark setMarkerShapeLocal "ICON";
		_mark setMarkerTypeLocal "mil_box";
		_mark setMarkerColorLocal "ColorBlue";
		sleep 0.02;
		_markArr = _markArr + [_mark];
		};
	};

	} forEach players;
	sleep 15;
		{
			deleteMarkerLocal _x
		}forEach _markArr;
};
