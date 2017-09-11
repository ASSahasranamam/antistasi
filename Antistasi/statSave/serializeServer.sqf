#include "../macros.hpp"
AS_SERVER_ONLY("statSave/serializeServer.sqf");

diag_log "[AS] Server: serializing game...";

private _dict = call DICT_fnc_create;

diag_log "[AS] Server: serializing AAF arsenal...";
[_dict, "AS_aaf_arsenal", call AS_AAFarsenal_fnc_toDict] call DICT_fnc_set;

diag_log "[AS] Server: serializing locations...";
[_dict, "AS_location", call AS_fnc_location_toDict] call DICT_fnc_set;

diag_log "[AS] Server: serializing fia_hq...";
[_dict, "AS_fia_hq", call AS_hq_fnc_toDict] call DICT_fnc_set;

diag_log "[AS] Server: serializing FIA arsenal...";
[_dict, "AS_fia_arsenal", call AS_FIAarsenal_fnc_toDict] call DICT_fnc_set;

diag_log "[AS] Server: serializing persistents...";
[_dict, "AS_persistent", call AS_persistents_fnc_toDict] call DICT_fnc_set;

diag_log "[AS] Server: serializing missions...";
[_dict, "AS_mission", call AS_fnc_mission_toDict] call DICT_fnc_set;

diag_log "[AS] Server: serializing players...";
[_dict, "AS_player", call AS_players_fnc_toDict] call DICT_fnc_set;

private _string = _dict call DICT_fnc_serialize;
diag_log "[AS] Server: serialization completed.";
_string