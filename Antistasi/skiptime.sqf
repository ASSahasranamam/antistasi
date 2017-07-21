private _enemies_around = false;

if ("AtaqueAAF" in misiones) exitWith {hint "You cannot rest while AAF or CSAT is counterattacking"};
if ("DEF_HQ" in misiones) exitWith {hint "You cannot rest while your HQ is under attack"};

{
	if (((side _x == side_green) or (side _x == side_red)) and
	    {[500,1,_x,"BLUFORSpawn"] call distanceUnits > 0}) exitWith {_enemies_around = true};
} forEach allUnits;
if (_enemies_around) exitWith {hint "You cannot rest with enemies near our units"};

private _all_around = false;
private _posHQ = getMarkerPos "FIA_HQ";
{
	if (_x distance _posHQ > 200) exitWith {_all_around = true};
} forEach (allPlayers - hcArray);

if _all_around exitWith {hint "All players must be around the HQ to rest"};

[[], "resourcecheckSkipTime"] call BIS_fnc_MP;
