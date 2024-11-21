
#include <a_samp>

public OnFilterScriptInit()
{
        //print("---------------------------------------");
        print("[NS:RP] Interior al Shamal cargado correctamente.");
        print("Actualización 2.0. (20/06/2016)");
        //print("---------------------------------------");
        return 1;
}

new sExplode[MAX_VEHICLES];
new tCount[MAX_VEHICLES];

#define S_EXPLODE_X 2.4015
#define S_EXPLODE_Y 29.2775
#define S_EXPLODE_Z 1199.593
#define S_EXPLODE_RANGE 13.4

forward ExplodeShamal(vehicleid);

GetPlayerShamalID(playerid)
{
        return GetPlayerVirtualWorld(playerid) > cellmax-MAX_VEHICLES ? cellmax-GetPlayerVirtualWorld(playerid) : 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
        if (ispassenger != 0 && GetVehicleModel(vehicleid) == 519)
        {
                SetPlayerVirtualWorld(playerid, cellmax-vehicleid);
                SetPlayerInterior(playerid, 1);
                SetPlayerPos(playerid, 3.839, 22.977, 1199.601);
                SetPlayerFacingAngle(playerid, 90.0);
                SetCameraBehindPlayer(playerid);
        }
        return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
        new vehicleid = GetPlayerShamalID(playerid);
        if (newkeys == 16 && vehicleid != 0)
        {
                new Float:x, Float:y, Float:z, Float:a;
                GetVehiclePos(vehicleid, x, y, z);
                GetVehicleZAngle(vehicleid, a);
                x += (5.0*floatsin(-(a-45.0), degrees));
                y += (5.0*floatcos(-(a-45.0), degrees));
                SetPlayerVirtualWorld(playerid, GetVehicleVirtualWorld(vehicleid));
                SetPlayerInterior(playerid, 0);
                SetPlayerPos(playerid, x, y, z-0.94);
                SetPlayerFacingAngle(playerid, a);
        }
        return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
        if (GetVehicleModel(vehicleid) == 519)
        {
                for (new i = 0; i < MAX_PLAYERS; i++)
                {
                        if (GetPlayerShamalID(i) == vehicleid)
                        {
                                SetPlayerHealth(i, 0.0);
                                CreateExplosion(S_EXPLODE_X, S_EXPLODE_Y, S_EXPLODE_Z, 2, S_EXPLODE_RANGE);
                        }
                }
                sExplode[vehicleid] = SetTimerEx("ExplodeShamal", 700, 0, "d", vehicleid);
                tCount[vehicleid] = true;
        }
        return 1;
}

public OnVehicleSpawn(vehicleid)
{
        tCount[vehicleid] = false;
        return 1;
}

public ExplodeShamal(vehicleid)
{
        KillTimer(sExplode[vehicleid]);
        if (tCount[vehicleid])
        {
                for (new i = 0; i < MAX_PLAYERS; i++)
                {
                        if (GetPlayerShamalID(i) == vehicleid)
                        {
                                CreateExplosion(S_EXPLODE_X, S_EXPLODE_Y, S_EXPLODE_Z, 2, S_EXPLODE_RANGE);
                        }
                }
                sExplode[vehicleid] = SetTimerEx("ExplodeShamal", random(1300) + 100, 0, "d", vehicleid);
        }
}
