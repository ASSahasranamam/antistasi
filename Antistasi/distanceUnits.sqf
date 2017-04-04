private ["_distancia","_modo","_result","_referencia","_variable","_cuenta","_exit"];

_distancia = _this select 0;//la distancia requisito, normalmente distanciaSPWN)
_modo = _this select 1;//lo que devuelve la función, 0 un array, un número mayor un boolean cuando la cuenta llegue a ese número.
_referencia = _this select 2; // posición en formato array u objeto
_variable = _this select 3;//"OPFORSpawn" o "BLUFORSpawn" según queramos ver unidades de uno u otro bando
_result = false;

if (_modo == 0) then
	{
	_result = [];
	{
	if (_x getVariable [_variable,false]) then
		{
		if (_x distance _referencia < _distancia) then
			{
			_result pushBack _x;
			};
		};
	} forEach allUnits;
	}
else
	{
	{if ((_x getvariable [_variable,false]) and (_x distance _referencia < _distancia)) exitWith {_result = true}} count allUnits;
	};

_result
