/*
	- Sistema de Neon - ( RolePlay Script )
		- Tipo: RolePlay & FreeRoam.
		- Autor: [J]ulian ( Las coordenadas fueron sacadas de un GM FreeRoam, se desconocen los créditos ).
		- Para: sa-mp.com/es

	- Updates -
	    - v0.9: Lanzamiento.
	    - v1.0: Agregado: Quitar y Random.
	    - v1.1: Sólo se puede colocar en coches ( ya no en bicicletas, barcos o motos ). ShowNeones.
*/

#include <a_samp>

#define COLOR_GREY 0xAFAFAFAA
#define COLOR_LIGHTBLUE 0x33CCFFAA

main(){}

enum nNeon
{
	TieneNeon,
	/*
		0 - No tiene.
		1 - Azul.
		2 - Verde.
		3 - Blanco.
		4 - Amarillo.
		5 - Rojo.
  		6 - Rosa.
	*/
	TieneLuz,
	/*
		0 - No tiene.
		1 - Azul.
		2 - Verde.
		3 - Blanco.
		4 - Rojo.
	*/
	LuzPrendida, // 0 No. 1 Si.
	NeonPrendido // 0 No. 1 Si.
};
new Neon[MAX_VEHICLES][nNeon];

new neon[4], luz[2], mensaje[128], t_show[MAX_PLAYERS];

public OnGameModeInit()
{
	CreateVehicle(415, 0, 0, 0, 0, 1, 7, 10);
	for(new v = 0; v < MAX_VEHICLES; v++)
	{
	    Neon[v][TieneNeon] = 0;
	    Neon[v][TieneLuz] =  0;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid, 0, 0, 15);
	SetWorldTime(24);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256], idx, tmp[256];
	cmd = strtok(cmdtext, idx);
	if(!strcmp(cmd, "/tablero", true))
	{
		ShowPlayerDialog(playerid,1,DIALOG_STYLE_LIST,"Tablero","Prender Luz\nPrender Neon\nApagar Luz\nApagar Neon","Continuar", "");
		return 1;
	}
	if(!strcmp(cmd, "/quitar", true))
	{
		if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "* Debes estar subido a un vehículo.");
 		if(IsPlayerOnBike(playerid) || IsPlayerInBoat(playerid) || IsPlayerOnBicycle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "* Este vehículo no acepta neon ni luz.");
		if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 0 && Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 0) return SendClientMessage(playerid, COLOR_GREY, "* Este vehículo no tiene ningún neon o luz para quitar.");
    	tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) return SendClientMessage(playerid, COLOR_GREY, "Utilizá: /colocar [luz-neon]");
		if(!strcmp(tmp, "neon", true))
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Has quitado satisfactoriamente el neon a este vehículo.");
			Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 0;
			DestroyObject(neon[0]);
			DestroyObject(neon[1]);
			DestroyObject(neon[2]);
			DestroyObject(neon[3]);
			return 1;
		}
		if(!strcmp(tmp, "luz", true))
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Has quitado satisfactoriamente la luz a este vehículo.");
			Neon[GetPlayerVehicleID(playerid)][TieneLuz] = 0;
			DestroyObject(luz[0]);
			DestroyObject(luz[1]);
			return 1;
		}
		return 1;
	}
	if(!strcmp(cmd, "/colocar", true))
	{
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "* Tienes que estar en un vehículo.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
		{
			SendClientMessage(playerid, COLOR_GREY, "Utilizá: /colocar [luz-neon] [color]");
			SendClientMessage(playerid, COLOR_GREY, "Colores Luz: azul - verde - blanco - rojo - random.");
			SendClientMessage(playerid, COLOR_GREY, "Colores Neon: amarillo - rosa - azul - verde - blanco - rojo - random.");
		    return 1;
		}
		if(!strcmp(tmp, "luz", true))
		{
		    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GREY, "Utilizá: /colocar [luz-neon] [color]");
				SendClientMessage(playerid, COLOR_GREY, "Colores Luz: azul - verde - blanco - rojo - random.");
				SendClientMessage(playerid, COLOR_GREY, "Colores Neon: amarillo - rosa - azul - verde - blanco - rojo - random.");
			    return 1;
			}
		    if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] != 0) return SendClientMessage(playerid, COLOR_GREY, "* Este vehículo ya tiene un neón colocado.");
		    if(!strcmp(tmp, "azul", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto una luz de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneLuz] = 1;
			}
		    if(!strcmp(tmp, "verde", true))
			{
				Neon[GetPlayerVehicleID(playerid)][TieneLuz] = 2;
				format(mensaje, sizeof(mensaje), "* Has puesto una luz de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneLuz] = 2;
			}
		    if(!strcmp(tmp, "blanco", true))
			{
   				format(mensaje, sizeof(mensaje), "* Has puesto una luz de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneLuz] = 3;
			}
		    if(!strcmp(tmp, "rojo", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto una luz de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneLuz] = 4;
			}
		    if(!strcmp(tmp, "random", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto una luz de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				new color = random(7);
				if(color > 8) color = random(7);
				Neon[GetPlayerVehicleID(playerid)][TieneLuz] = color;
				return 1;
			}
		    return 1;
		}
		if(!strcmp(tmp, "neon", true))
		{
		    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_GREY, "Utilizá: /colocar [luz-neon] [color]");
				SendClientMessage(playerid, COLOR_GREY, "Colores Luz: azul - verde - blanco - rojo - random.");
				SendClientMessage(playerid, COLOR_GREY, "Colores Neon: amarillo - rosa - azul - verde - blanco - rojo - random.");
			    return 1;
			}
		    if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] != 0) return SendClientMessage(playerid, COLOR_GREY, "* Este vehículo ya tiene un neón colocado.");
		    if(!strcmp(tmp, "azul", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 1;
			}
		    if(!strcmp(tmp, "verde", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 2;
			}
		    if(!strcmp(tmp, "blanco", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 3;
			}
		    if(!strcmp(tmp, "amarillo", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 4;
			}
		    if(!strcmp(tmp, "rojo", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 5;
			}
		    if(!strcmp(tmp, "rosa", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				return Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 6;
			}
		    if(!strcmp(tmp, "random", true))
			{
				format(mensaje, sizeof(mensaje), "* Has puesto un neon de color %s en el vehículo..", tmp);
				SendClientMessage(playerid, COLOR_LIGHTBLUE, mensaje);
				new color = random(7);
				if(color > 8) color = random(7);
				Neon[GetPlayerVehicleID(playerid)][TieneNeon] = color;
				return 1;
			}
		    return 1;
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "Utilizá: /colocar [luz-neon] [color]");
			SendClientMessage(playerid, COLOR_GREY, "Colores Luz: azul - verde - blanco - rojo - random.");
			SendClientMessage(playerid, COLOR_GREY, "Colores Neon: amarillo - rosa - azul - verde - blanco - rojo - random.");
		}
		return 1;
	}
	if(!strcmp(cmd, "/luces", true))
	{
		if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 0)  return SendClientMessage(playerid, -1, "* Este vehículo no tiene luces.");
	    if(Neon[GetPlayerVehicleID(playerid)][LuzPrendida] == 0)
	    {
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 1)
			{
				luz[0] = CreateObject(19298,0,0,0,0,0,0);
				luz[1] = CreateObject(19298,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 2)
			{
                luz[0] = CreateObject(19297,0,0,0,0,0,0);
				luz[1] = CreateObject(19297,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 3)
			{
				luz[0] = CreateObject(19295,0,0,0,0,0,0);
				luz[1] = CreateObject(19295,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 4)
			{
				luz[0] = CreateObject(19296,0,0,0,0,0,0);
				luz[1] = CreateObject(19296,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			Neon[GetPlayerVehicleID(playerid)][LuzPrendida] = 1;
			SendClientMessage(playerid, COLOR_GREY, "* Has prendido la luz de este vehículo.");
			return 1;
  		}
  		else if(Neon[GetPlayerVehicleID(playerid)][LuzPrendida] == 1)
  		{
			DestroyObject(luz[0]);
			DestroyObject(luz[1]);
			Neon[GetPlayerVehicleID(playerid)][LuzPrendida] = 0;
			SendClientMessage(playerid, COLOR_GREY, "* Has apagado la luz de este vehículo.");
			return 1;
  		}
		return 1;
	}
	if(!strcmp(cmd, "/neon", true))
	{
		if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 0)  return SendClientMessage(playerid, -1, "* Este vehículo no tiene neones.");
		if(Neon[GetPlayerVehicleID(playerid)][NeonPrendido] == 0)
  		{
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 1)
			{
				neon[0] = CreateObject(18648,0,0,0,0,0,0);
				neon[1] = CreateObject(18648,0,0,0,0,0,0);
				neon[2] = CreateObject(18648,0,0,0,0,0,0);
				neon[3] = CreateObject(18648,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 2)
			{
				neon[0] = CreateObject(18649,0,0,0,0,0,0);
				neon[1] = CreateObject(18649,0,0,0,0,0,0);
				neon[2] = CreateObject(18649,0,0,0,0,0,0);
				neon[3] = CreateObject(18649,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 3)
			{
				neon[0] = CreateObject(18652,0,0,0,0,0,0);
				neon[1] = CreateObject(18652,0,0,0,0,0,0);
				neon[2] = CreateObject(18652,0,0,0,0,0,0);
				neon[3] = CreateObject(18652,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 4)
			{
				neon[0] = CreateObject(18650,0,0,0,0,0,0);
				neon[1] = CreateObject(18650,0,0,0,0,0,0);
				neon[2] = CreateObject(18650,0,0,0,0,0,0);
				neon[3] = CreateObject(18650,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 5)
			{
                neon[0] = CreateObject(18647,0,0,0,0,0,0);
				neon[1] = CreateObject(18647,0,0,0,0,0,0);
				neon[2] = CreateObject(18647,0,0,0,0,0,0);
				neon[3] = CreateObject(18647,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 6)
			{
				neon[0] = CreateObject(18651,0,0,0,0,0,0);
				neon[1] = CreateObject(18651,0,0,0,0,0,0);
				neon[2] = CreateObject(18651,0,0,0,0,0,0);
				neon[3] = CreateObject(18651,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			Neon[GetPlayerVehicleID(playerid)][NeonPrendido] = 1;
			SendClientMessage(playerid, COLOR_GREY, "* Has prendido el neon de este vehículo.");
			return 1;
		}
		else if(Neon[GetPlayerVehicleID(playerid)][NeonPrendido] == 1)
  		{
			DestroyObject(neon[0]);
			DestroyObject(neon[1]);
			DestroyObject(neon[2]);
			DestroyObject(neon[3]);
			Neon[GetPlayerVehicleID(playerid)][NeonPrendido] = 0;
			SendClientMessage(playerid, COLOR_GREY, "* Has apagado el neon de este vehículo.");
			return 1;
  		}
		return 1;
	}
	if(!strcmp(cmd, "/show-neon", true))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			if(Neon[GetPlayerVehicleID(playerid)][NeonPrendido] == 0)
			{
				t_show[playerid] = SetTimerEx("ShowNeon", 1000, 1, "i", playerid);
				SendClientMessage(playerid, COLOR_GREY, "* Has activado el show-neon.");
				Neon[GetPlayerVehicleID(playerid)][NeonPrendido] = 1;
				return 1;
			}
			else if(Neon[GetPlayerVehicleID(playerid)][NeonPrendido] != 0)
			{
				KillTimer(t_show[playerid]);
				SendClientMessage(playerid, COLOR_GREY, "* Has desactivado el show-neon.");
				Neon[GetPlayerVehicleID(playerid)][NeonPrendido] = 0;
				return 1;
			}
		}
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1)
    {
		if(listitem == 0)
		{
		    if(Neon[GetPlayerVehicleID(playerid)][LuzPrendida] == 1) return SendClientMessage(playerid, -1, "* Las luces ya están prendidas.");
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 1)
			{
				luz[0] = CreateObject(19298,0,0,0,0,0,0);
				luz[1] = CreateObject(19298,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 2)
			{
                luz[0] = CreateObject(19297,0,0,0,0,0,0);
				luz[1] = CreateObject(19297,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 3)
			{
				luz[0] = CreateObject(19295,0,0,0,0,0,0);
				luz[1] = CreateObject(19295,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneLuz] == 4)
			{
				luz[0] = CreateObject(19296,0,0,0,0,0,0);
				luz[1] = CreateObject(19296,0,0,0,0,0,0);
				AttachObjectToVehicle(luz[0], GetPlayerVehicleID(playerid), 0.679999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(luz[1], GetPlayerVehicleID(playerid), -0.729999, 3.315028, -0.234999, 0.000000, 0.000000, -88.589958);
			}
			Neon[GetPlayerVehicleID(playerid)][LuzPrendida] = 1;
		}
		if(listitem == 1)
		{
		    if(Neon[GetPlayerVehicleID(playerid)][NeonPrendido] == 1) return SendClientMessage(playerid, -1, "* Las luces ya están prendidas.");
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 1)
			{
				neon[0] = CreateObject(18648,0,0,0,0,0,0);
				neon[1] = CreateObject(18648,0,0,0,0,0,0);
				neon[2] = CreateObject(18648,0,0,0,0,0,0);
				neon[3] = CreateObject(18648,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 2)
			{
				neon[0] = CreateObject(18649,0,0,0,0,0,0);
				neon[1] = CreateObject(18649,0,0,0,0,0,0);
				neon[2] = CreateObject(18649,0,0,0,0,0,0);
				neon[3] = CreateObject(18649,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 3)
			{
				neon[0] = CreateObject(18652,0,0,0,0,0,0);
				neon[1] = CreateObject(18652,0,0,0,0,0,0);
				neon[2] = CreateObject(18652,0,0,0,0,0,0);
				neon[3] = CreateObject(18652,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 4)
			{
				neon[0] = CreateObject(18650,0,0,0,0,0,0);
				neon[1] = CreateObject(18650,0,0,0,0,0,0);
				neon[2] = CreateObject(18650,0,0,0,0,0,0);
				neon[3] = CreateObject(18650,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 5)
			{
                neon[0] = CreateObject(18647,0,0,0,0,0,0);
				neon[1] = CreateObject(18647,0,0,0,0,0,0);
				neon[2] = CreateObject(18647,0,0,0,0,0,0);
				neon[3] = CreateObject(18647,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 6)
			{
				neon[0] = CreateObject(18651,0,0,0,0,0,0);
				neon[1] = CreateObject(18651,0,0,0,0,0,0);
				neon[2] = CreateObject(18651,0,0,0,0,0,0);
				neon[3] = CreateObject(18651,0,0,0,0,0,0);
				AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
				AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
				AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
			}
			Neon[GetPlayerVehicleID(playerid)][NeonPrendido] = 1;
		}
		if(listitem == 2)
		{
			DestroyObject(luz[0]);
			DestroyObject(luz[1]);
			Neon[GetPlayerVehicleID(playerid)][LuzPrendida] = 0;
		}
		if(listitem == 3)
		{
			DestroyObject(neon[0]);
			DestroyObject(neon[1]);
			DestroyObject(neon[2]);
			DestroyObject(neon[3]);
			Neon[GetPlayerVehicleID(playerid)][NeonPrendido] = 0;
		}
        return 1;
    }
    return 0;
}

public OnVehicleSpawn(vehicleid)
{
	for(new nl = 0; nl < 4; nl++)
	{
	    if(nl <= 2) DestroyObject(luz[nl]);
	    DestroyObject(neon[nl]);
	}
	Neon[vehicleid][LuzPrendida] = 0;
	Neon[vehicleid][NeonPrendido] = 0;
	return 1;
}
forward ShowNeon(playerid);
public ShowNeon(playerid)
{
	DestroyObject(neon[0]);
	DestroyObject(neon[1]);
	DestroyObject(neon[2]);
	DestroyObject(neon[3]);
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 1)
	{
		neon[0] = CreateObject(18648,0,0,0,0,0,0);
		neon[1] = CreateObject(18648,0,0,0,0,0,0);
		neon[2] = CreateObject(18648,0,0,0,0,0,0);
		neon[3] = CreateObject(18648,0,0,0,0,0,0);
		AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
	}
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 2)
	{
		neon[0] = CreateObject(18649,0,0,0,0,0,0);
		neon[1] = CreateObject(18649,0,0,0,0,0,0);
		neon[2] = CreateObject(18649,0,0,0,0,0,0);
		neon[3] = CreateObject(18649,0,0,0,0,0,0);
		AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
	}
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 3)
	{
		neon[0] = CreateObject(18652,0,0,0,0,0,0);
		neon[1] = CreateObject(18652,0,0,0,0,0,0);
		neon[2] = CreateObject(18652,0,0,0,0,0,0);
		neon[3] = CreateObject(18652,0,0,0,0,0,0);
		AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
	}
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 4)
	{
		neon[0] = CreateObject(18650,0,0,0,0,0,0);
		neon[1] = CreateObject(18650,0,0,0,0,0,0);
		neon[2] = CreateObject(18650,0,0,0,0,0,0);
		neon[3] = CreateObject(18650,0,0,0,0,0,0);
		AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
	}
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 5)
	{
        neon[0] = CreateObject(18647,0,0,0,0,0,0);
		neon[1] = CreateObject(18647,0,0,0,0,0,0);
		neon[2] = CreateObject(18647,0,0,0,0,0,0);
		neon[3] = CreateObject(18647,0,0,0,0,0,0);
		AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
	}
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] == 6)
	{
		neon[0] = CreateObject(18651,0,0,0,0,0,0);
		neon[1] = CreateObject(18651,0,0,0,0,0,0);
		neon[2] = CreateObject(18651,0,0,0,0,0,0);
		neon[3] = CreateObject(18651,0,0,0,0,0,0);
		AttachObjectToVehicle(neon[0], GetPlayerVehicleID(playerid), -0.909999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[1], GetPlayerVehicleID(playerid), 0.914999, -0.009999, -0.649999, 0.000000, 0.000000, 0.000000);
		AttachObjectToVehicle(neon[2], GetPlayerVehicleID(playerid), 0.034999, 2.225003, -0.629999, 0.000000, 0.000000, -88.589958);
		AttachObjectToVehicle(neon[3], GetPlayerVehicleID(playerid), 0.034999, -2.034998, -0.629999, 0.000000, 0.000000, -88.589958);
	}
	Neon[GetPlayerVehicleID(playerid)][TieneNeon]++;
	if(Neon[GetPlayerVehicleID(playerid)][TieneNeon] > 6) Neon[GetPlayerVehicleID(playerid)][TieneNeon] = 1;
	return 1;
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

IsPlayerOnBike(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleclass = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(vehicleclass)
		{
			case 448:return 1;
			case 461:return 1;
			case 462:return 1;
			case 463:return 1;
			case 468:return 1;
			case 521:return 1;
			case 522:return 1;
			case 523:return 1;
			case 581:return 1;
			case 586:return 1;
			case 471:return 1;
		}
	}
	return 0;
}

IsPlayerInBoat(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleclass = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(vehicleclass)
		{
			case 430:return 1;
			case 446:return 1;
			case 452:return 1;
			case 453:return 1;
			case 454:return 1;
			case 472:return 1;
			case 473:return 1;
			case 484:return 1;
			case 493:return 1;
			case 595:return 1;
		}
	}
	return 0;
}

IsPlayerOnBicycle(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new vehicleclass = GetVehicleModel(GetPlayerVehicleID(playerid));
		switch(vehicleclass)
		{
			case 481:return 1;
			case 509:return 1;
			case 510:return 1;
		}
	}
	return 0;
}
