_unit = _this select 0;

if (!firstspawn) exitWith {firstspawn = true;};

if (!local _unit) exitWith {};

[player, true] call TFAR_fnc_forceSpectator;
SPECTATOR_LIST = SPECTATOR_LIST + [name player];
publicVariable "SPECTATOR_LIST";

removeAllWeapons player:
removeAllActions player;
// join civilian side, because end trigger relies on side
[_unit] joinSilent (createGroup civilian);
// set position above objective
_unit addAction["<t color='#d18d1f'>Spectator-Cam aufrufen",{["forced"] spawn CSSA3_fnc_createSpectateDialog;}, _Args, 1, false, false, "","_this == _target || _this in _target"];

sleep 0.1;
// start spec cam
//[_unit] execVM "spectator\callSpectator.sqf";
// start spec cam
["forced"] spawn CSSA3_fnc_createSpectateDialog;