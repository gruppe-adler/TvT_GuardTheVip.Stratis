CUL_fn_Equip = {
	removeHeadGear player;
	removeVest player;
	removeUniform player;
	player unassignItem "NVGoggles";
	player removeItem "NVGoggles";
	removeAllWeapons player;
	if (backpack player != "") then {removeBackPack player};
	switch (side player) do {
		case blufor: {
			"respawn_east" setmarkeralphalocal 0;
			if (str player != "vip") then {
				(group player) setGroupID  ["Team Shield"];
				cul_mags = [["30Rnd_65x39_caseless_mag",8],["SmokeShellGreen",1]];
				cul_wep = ["arifle_MX_F"];
				if ((str player) in ["s1","s2","s3","s4","s5","s6"]) then {
					player additem "itemGPS";
					player assignItem "itemGPS";
					player addUniform "ARC_GER_Flecktarn_Uniform";
					player addHeadGear "ARC_Partners_Cap_TM";
					player addVest "ARC_GER_Flecktarn_Plate_Carrier";
					player addMagazine "HandGrenade";
				}else{
					player addUniform "ARC_GER_Flecktarn_Uniform";
					player addHeadGear "ARC_GER_Flecktarn_Helmet_Light"; 
					player addVest "ARC_GER_Flecktarn_Plate_Carrier";
				};
			}else{
					player additem "itemGPS";
					player assignItem "itemGPS";
					player addUniform "U_Marshal";
					player addHeadGear "H_Cap_police";
					player addVest "V_TacVest_blk_POLICE";
					player addGoggles "G_Squares_Tinted";
					[] spawn {
					while {alive player} do {
							waitUntil {uniform player != "U_Marshal" || headGear player != "H_Cap_police" || vest player != "V_TacVest_blk_POLICE"};
							{deleteVehicle _x} forEach (nearestObjects[player,["WeaponHolder"],3]);
							removeHeadGear player;
							removeVest player;
							removeUniform player;
							player addUniform "U_Marshal";
							player addHeadGear "H_Cap_police";
							player addVest "V_TacVest_blk_POLICE";
							player addGoggles "G_Squares_Tinted";
						};
					};
			};
		};
		case opfor: {
			//"respawn_west" setmarkeralphalocal 0;
			{_x setMarkerColorLocal "ColorRed"; _x setMarkerTextLocal " VIP eliminieren"}forEach ["helimark","rogainmark","generalmark","dockmark"];
			{_x setMarkerTextLocal " VIP eliminieren (Blufor-Gebiet)"}forEach ["helimark","rogainmark"];
			player addUniform "U_CAF_AG_EEUR_FATIGUES_03";
			player addHeadGear "H_Shemag_olive_hs";
			player addVest "V_TacVest_oli";
			
		};
		default {cul_mags = []; cul_wep = [];};
	};
	{player addMagazines [_x select 0,_x select 1]}forEach cul_mags;
	{player addWeapon _x} forEach cul_wep;
	player addItem "FirstAidKit";
};
[] call CUL_fn_Equip;

player addEventHandler ["Respawn",{
	(_this select 1) spawn {
		sleep 3; 
		hidebody _this;
		sleep 5;
		deleteVehicle _this;
	};
	[] spawn CUL_fn_Equip;
}];

waitUntil {time > 0};
player switchMove "amovpercmstpslowwrfldnon";

[] execVM "markAssassins.sqf";
[] execVM "markBlufor.sqf";