[] spawn {
	waitUntil {time > 3};
	CUL_talked = false;
	waitUntil {sleep 3; (("rogaintask" call SHK_Taskmaster_isCompleted) && ("helitask" call SHK_Taskmaster_isCompleted) && ("docktask" call SHK_Taskmaster_isCompleted) && CUL_talked)};
	sleep 3;
	if (alive vip) then {
		CUL_VIP_win = true; publicVariable "CUL_VIP_win";
	};
};
