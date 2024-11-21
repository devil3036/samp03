// FilterScript Crear Actores.
// By Edinson_Walker.

#include <a_samp>
#include <a_actor>
#include <zcmd>
#include <MSelection>

#define Funcion%0(%1) 	 forward %0(%1); public %0(%1)

new Skins = mS_INVALID_LISTID;

public OnFilterScriptInit()
{
Skins = LoadModelSelectionMenu("Skins.txt");
print("\n==============================================");
print(" Crear Actores sistema simple by Edinson_Walker ");
print("=================================================\n");
return 1;
}

public OnFilterScriptExit()
{
return 1;
}

CMD:crearactor(playerid, params[])
{
	if(IsPlayerAdmin(playerid))
	{
	ShowModelSelectionMenu(playerid, Skins, "Selecciona el skin del actor.");
	}
	return 1;
}

Funcion CrearActor(playerid, Skin, Float:X, Float:Y, Float:Z, Float:A)
{
new string[256];
format(string,sizeof string, "CreateActor(%d, %f, %f, %f, %f);",Skin, X, Y, Z, A);
Log_Write("Actors.txt", string);
CreateActor(Skin, X,Y,Z,A);
SendClientMessage(playerid,0x00C200FF,"[Info]:{FFFFFF} Actor creado correctamente.");
}

stock Log_Write(const path[], const str[], {Float,_}:...)
{
static args,start,end,File:file,string[1024];

if ((start = strfind(path, "/")) != -1) {
strmid(string, path, 0, start + 1);

if (!fexist(string))
return printf("¡Error! Directorio \"%s\" No existe.", string);
}
#emit LOAD.S.pri 8
#emit STOR.pri args

file = fopen(path, io_append);

if (!file) return 0;

if (args > 8){
#emit ADDR.pri str
#emit STOR.pri start

for (end = start + (args - 8); end > start; end -= 4)
{
#emit LREF.pri end
#emit PUSH.pri
}
#emit PUSH.S str
#emit PUSH.C 1024
#emit PUSH.C string
#emit PUSH.C args
#emit SYSREQ.C format

fwrite(file, string);
fwrite(file, "\r\n");
fclose(file);

#emit LCTRL 5
#emit SCTRL 4
#emit RETN
}
fwrite(file, str);
fwrite(file, "\r\n");
fclose(file);

return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
if(listid == Skins)// Esta es la compra de la ropa.
{
if(response)
{
new Float:pos[4];
GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
GetPlayerFacingAngle(playerid, pos[3]);
SetTimerEx("CrearActor", 5000, false, "ddffff", playerid, modelid, pos[0], pos[1], pos[2], pos[3]);
SendClientMessage(playerid,0x00C200FF,"[Info]:{FFFFFF} Espera 5 segundos mientras se crea el actor.");
}
else SendClientMessage(playerid,0x00C200FF,"[Info]:{FFFFFF} Has cancelado la creacion de actor.");
return 1;
}

return 1;
}
