// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>

#if defined FILTERSCRIPT

new Puerta_derecha;

public OnFilterScriptInit()
{
	Puerta_izquierda =  CreateObject(1495, 1564.73792, -1664.65930, 4989.52588,   0.00000, 0.00000, -90.00000);
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
  if (strcmp("/abrir", cmdtext, true) == 0) //para abrir la puerta
  {

    if(IsPlayerInRangeOfPoint(playerid, 15.0, 1564.73792, -1664.65930, 4989.52588)){  //si el jugador no esta en un radio de 15.0 a la puerta no lo dejara usar el comando. (Reemplazar las coordenadas por las coordenadas de nuestra puerta (CERRADA))
      MoveObject(Puerta_izquierda, 1564.73792, -1663.3313, 4989.52588, 3.0);  //mueve nuestra puerta hasta las coordenadas de la puerta abierta. (Reemplazar las coordenadas por las coordenadas de nuestra puerta (ABIERTA))
      return SendClientMessage(playerid, 0x28F943FF, "Server: Has abierto la puerta");
    }else return SendClientMessage(playerid, 0xFF0000FF, "ERROR: Debes estar cerca de la puerta para usar este comando");
  }

  if (strcmp("/cerrar", cmdtext, true) == 0) //cerrar
  {

    if(IsPlayerInRangeOfPoint(playerid, 15.0, 1564.73792, -1664.65930, 4989.52588)){  //si el jugador no esta en un radio de 15.0 a la puerta no lo dejara usar el comando. (Reemplazar las coordenadas por las coordenadas de nuestra puerta (CERRADA))
      MoveObject(Puerta_izquierda, 1564.73792, -1664.65930, 4989.52588, 3.0);  //mueve nuestra puerta hasta las coordenadas de la puerta abierta. (Reemplazar las coordenadas por las coordenadas de nuestra puerta (CERRADA))
      return SendClientMessage(playerid, 0x28F943FF, "Server: Has cerrado la puerta");
    }else return SendClientMessage(playerid, 0xFF0000FF, "ERROR: Debes estar cerca de la puerta para usar este comando");
  }
  return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

