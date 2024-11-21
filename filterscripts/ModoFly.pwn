// =======================================================================================
// Creador: Norck
// Editado: Edinson_Walker
// =======================================================================================
#include <a_samp>

static bool:OnFly[MAX_PLAYERS];
forward InitFly(playerid);
forward bool:StartFly(playerid);
forward Fly(playerid);
forward bool:StopFly(playerid);
forward static SetPlayerLookAt(playerid,Float:x,Float:y);

public OnPlayerConnect(playerid)
{
	InitFly(playerid);
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[256],idx;
    cmd = strtok(cmdtext, idx);
	if(strcmp(cmd, "/fly", true) == 0)
	{
	    StartFly(playerid);
	    return 1;
	}
	if(strcmp(cmd, "/pararfly", true) == 0)
	{
	    StopFly(playerid);
	    return 1;
	}
	return 0;
}

InitFly(playerid)
{
	OnFly[playerid] = false;
	return;
}

bool:StartFly(playerid)
{
	if(OnFly[playerid])
        return false;
    OnFly[playerid] = true;
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,x,y,z);
	SetPlayerPos(playerid,x,y,z+5.0);
	ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",6.1,1,1,1,1,0,1);
	Fly(playerid);
	GameTextForPlayer(playerid,"~y~Modo Vuelo~n~~r~Clic Izq ~w~- Subes~n~~r~Clic Derecho ~w~- Bajas~n~ ~r~Espacio ~w~- Rapido~n~~r~Alt Izq ~w~- Lento",10000,3);
	return true;
}
strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
public Fly(playerid) {
	if(!IsPlayerConnected(playerid)) return 1; new k, ud,lr; GetPlayerKeys(playerid,k,ud,lr);
	new Float:v_x,Float:v_y,Float:v_z, Float:x,Float:y,Float:z; if(ud < 0) { GetPlayerCameraFrontVector(playerid,x,y,z); v_x = x+0.1; v_y = y+0.1; }
	if(k & 128) v_z = -0.2; else if(k & KEY_FIRE) v_z = 0.2; if(k & KEY_WALK) { v_x /=5.0; v_y /=5.0; v_z /=5.0; }
	if(k & KEY_SPRINT) { v_x *=4.0; v_y *=4.0; v_z *=4.0; }
	if(v_z == 0.0) v_z = 0.025; SetPlayerVelocity(playerid,v_x,v_y,v_z);
	if(v_x == 0 && v_y == 0) { if(GetPlayerAnimationIndex(playerid) == 959) ApplyAnimation(playerid,"PARACHUTE","PARA_steerR",6.1,1,1,1,1,0,1); } else { GetPlayerCameraFrontVector(playerid,v_x,v_y,v_z); GetPlayerCameraPos(playerid,x,y,z); SetPlayerLookAt(playerid,v_x*500.0+x,v_y*500.0+y); if(GetPlayerAnimationIndex(playerid) != 959) ApplyAnimation(playerid,"PARACHUTE","FALL_SkyDive_Accel",6.1,1,1,1,1,0,1); }
	if(OnFly[playerid]) SetTimerEx("Fly",100,0,"i",playerid); return 1; }
bool:StopFly(playerid) { if(!OnFly[playerid]) return false; new Float:x,Float:y,Float:z; GetPlayerPos(playerid,x,y,z); SetPlayerPos(playerid,x,y,z); OnFly[playerid] = false; return true; }
static SetPlayerLookAt(playerid,Float:x,Float:y) { new Float:Px, Float:Py, Float: Pa; GetPlayerPos(playerid, Px, Py, Pa); Pa = floatabs(atan((y-Py)/(x-Px))); if (x <= Px && y >= Py) 		Pa = floatsub(180.0, Pa); else if (x < Px && y < Py) 		Pa = floatadd(Pa, 180.0); else if (x >= Px && y <= Py)	Pa = floatsub(360.0, Pa); Pa = floatsub(Pa, 90.0); if (Pa >= 360.0) Pa = floatsub(Pa, 360.0); SetPlayerFacingAngle(playerid, Pa); return; }
