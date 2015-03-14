//------------------------------
// Script: markBlufor.sqf
// Writer: Cuel
// Created: 2013-03-10
// Edited: 
//------------------------------

if (isDedicated ||((side player) != blufor)) exitWith {};

private ["_markArr", "_mark","_vipmark","_id", "_markercolor"];
players = [];
if (!isMultiplayer) then {players = switchableUnits} else {
players = playableUnits;
};

if (toLower (str player) != "vip") then {
	waitUntil {!isNil "vip"};
	_vipmark = createMarkerLocal ["VIPMarker", [(getPosATL VIP select 0),(getPosATL VIP select 1)]];
	_vipmark setMarkerShapeLocal "ICON";
	_vipmark setMarkerTypeLocal "mil_dot";
	_vipmark setMarkerColorLocal "ColorBlue";
	_vipmark setMarkerTextLocal " VIP";
	_vipmark spawn { while {alive VIP} do {
		_this setMarkerPosLocal (getPos VIP);
		sleep 2;
		};
	deleteMarkerLocal "VIPMarker";
	};
};

while {true} do {
waitUntil {sleep 0.2; alive player};
_markArr = [];
{
if ((side _x) == blufor && vehicle _x != _x && alive _x ) then {
	if (driver (vehicle _x) == _x) then {
	_id=format["trk_%1",_x];
	_mark = createMarkerLocal [_id, [(getPosATL _x select 0),(getPosATL _x select 1)]];
	_mark setMarkerShapeLocal "ICON";
	_mark setMarkerTypeLocal "mil_box";
	_mark setMarkerColorLocal "ColorBlue";
	_mark setMarkerTextLocal format [" %1", name _x];
	sleep 0.02;
	_markArr = _markArr + [_mark];
	};
};

} forEach players;
	sleep 8;
	{
		deleteMarkerLocal _x
	}forEach _markArr;
};
