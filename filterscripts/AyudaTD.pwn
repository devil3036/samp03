//######################################################################################################//
//                            			  	Creditos: Cox_Cen       	                                //
//######################################################################################################//
#include <a_samp>
//######################################################################################################//
new Text: AyudaTitulo, Text: AyudaBox1, Text: AyudaBox2, Text: AyudaInfo;
new Text: AyudaMenu1, Text: AyudaMenu2;
//######################################################################################################//
forward SaludoAyuda(playerid);
forward Mensaje1Ayuda(playerid);
forward Mensaje2Ayuda(playerid);
//######################################################################################################//
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/ayuda", cmdtext, true, 10) == 0)
	{
		TextDrawShowForPlayer(playerid, AyudaTitulo);
		TextDrawShowForPlayer(playerid, AyudaBox1);
		TextDrawShowForPlayer(playerid, AyudaBox2);
		TextDrawShowForPlayer(playerid, AyudaInfo);
		TextDrawShowForPlayer(playerid, AyudaMenu1);
		TextDrawShowForPlayer(playerid, AyudaMenu2);
		SaludoAyuda(playerid);
		SelectTextDraw(playerid, 0x4088CDFF);
		return 1;
	}
	return 0;
}
//######################################################################################################//
public OnGameModeInit()
{
	AyudaBox1 = TextDrawCreate(359.000000, 130.000000, ".");
	TextDrawAlignment(AyudaBox1, 2);
	TextDrawBackgroundColor(AyudaBox1, 255);
	TextDrawFont(AyudaBox1, 1);
	TextDrawLetterSize(AyudaBox1, 0.000000, 22.000009);
	TextDrawColor(AyudaBox1, -1);
	TextDrawSetOutline(AyudaBox1, 1);
	TextDrawSetProportional(AyudaBox1, 1);
	TextDrawUseBox(AyudaBox1, 1);
	TextDrawBoxColor(AyudaBox1, 85);
	TextDrawTextSize(AyudaBox1, 0.000000, 178.000000);

	AyudaBox2 = TextDrawCreate(319.000000, 109.000000, ".");
	TextDrawAlignment(AyudaBox2, 2);
	TextDrawBackgroundColor(AyudaBox2, 16711935);
	TextDrawFont(AyudaBox2, 1);
	TextDrawLetterSize(AyudaBox2, 0.000000, 2.000009);
	TextDrawColor(AyudaBox2, -1);
	TextDrawSetOutline(AyudaBox2, 0);
	TextDrawSetProportional(AyudaBox2, 1);
	TextDrawSetShadow(AyudaBox2, 0);
	TextDrawUseBox(AyudaBox2, 1);
	TextDrawBoxColor(AyudaBox2, 85);
	TextDrawTextSize(AyudaBox2, 0.000000, 263.000000);

	AyudaMenu1 = TextDrawCreate(229.000000, 130.000000, "General");
	TextDrawAlignment(AyudaMenu1, 2);
	TextDrawBackgroundColor(AyudaMenu1, 255);
	TextDrawFont(AyudaMenu1, 2);
	TextDrawLetterSize(AyudaMenu1, 0.190000, 1.200009);
	TextDrawColor(AyudaMenu1, -1);
	TextDrawSetOutline(AyudaMenu1, 1);
	TextDrawSetProportional(AyudaMenu1, 1);
	TextDrawUseBox(AyudaMenu1, 1);
	TextDrawBoxColor(AyudaMenu1, 85);
	TextDrawTextSize(AyudaMenu1, 8.000000, 78.000000);
	TextDrawSetSelectable(AyudaMenu1, 1);

	AyudaMenu2 = TextDrawCreate(229.000000, 145.000000, "Salir");
	TextDrawAlignment(AyudaMenu2, 2);
	TextDrawBackgroundColor(AyudaMenu2, 255);
	TextDrawFont(AyudaMenu2, 2);
	TextDrawLetterSize(AyudaMenu2, 0.190000, 1.200009);
	TextDrawColor(AyudaMenu2, -1);
	TextDrawSetOutline(AyudaMenu2, 1);
	TextDrawSetProportional(AyudaMenu2, 1);
	TextDrawUseBox(AyudaMenu2, 1);
	TextDrawBoxColor(AyudaMenu2, 85);
	TextDrawTextSize(AyudaMenu2, 8.000000, 78.000000);
	TextDrawSetSelectable(AyudaMenu2, 1);

	AyudaTitulo = TextDrawCreate(260.000000, 111.000000, "Menu De Ayuda");
	TextDrawBackgroundColor(AyudaTitulo, 255);
	TextDrawFont(AyudaTitulo, 2);
	TextDrawLetterSize(AyudaTitulo, 0.380000, 1.500000);
	TextDrawColor(AyudaTitulo, 0x4088CDFF);
	TextDrawSetOutline(AyudaTitulo, 1);
	TextDrawSetProportional(AyudaTitulo, 1);

	AyudaInfo = TextDrawCreate(272.000000, 131.000000, "");
	TextDrawBackgroundColor(AyudaInfo, 255);
	TextDrawFont(AyudaInfo, 1);
	TextDrawLetterSize(AyudaInfo, 0.149999, 1.000000);
	TextDrawColor(AyudaInfo, 0x4088CDFF);
	TextDrawSetOutline(AyudaInfo, 1);
	TextDrawSetProportional(AyudaInfo, 1);
	return 1;
}
//######################################################################################################//
public SaludoAyuda(playerid)
{
	new Texto[256], Nombre[MAX_PLAYER_NAME];
  	GetPlayerName(playerid, Nombre, sizeof(Nombre));
    format(Texto, sizeof(Texto), "%s ~w~Bienvenido al menu de ayuda... ~n~~n~~w~Para informacion sobre el servidor da click en cualquier texto.", Nombre);
    TextDrawSetString(AyudaInfo, Texto);
 }
//-------------------------------------------------------------------------------------------------------------//
public Mensaje1Ayuda(playerid)
{
	new Texto[256];
    format(Texto, sizeof(Texto), "~w~[PJ]: /cuenta /cambiarclave /tiendacash /tirar /mostrar ~n~/trabajoayuda /removergps /reanimar /dnifalso ~n~~n~[CMD'S]: /pagar /payday /id /cfumar /comprar /comprarlicencia ~n~/animaciones /ven /google /ap /cp /apgarage /cpgarage /togduda ~n~/buscartrabajo /tognews /togfam /togphone /ocultarinfo ~n~/darcheque /eject /fumarcrack /fumarhierba /llenar /moneda ~n~/dar /contrato  /duda /re /e");
    TextDrawSetString(AyudaInfo, Texto);
 }
 public Mensaje2Ayuda(playerid)
{
	new Texto[256];
    format(Texto, sizeof(Texto), "~w~[PJ]: /cuenta /cambiarclave /tiendacash /tirar /mostrar ~n~/trabajoayuda /removergps /reanimar /dnifalso ~n~~n~[CMD'S]: /pagar /payday /id /cfumar /comprar /comprarlicencia ~n~/animaciones /ven /google /ap /cp /apgarage /cpgarage /togduda ~n~/buscartrabajo /tognews /togfam /togphone /ocultarinfo ~n~/darcheque /eject /fumarcrack /fumarhierba /llenar /moneda ~n~/dar /contrato  /duda /re /e");
    TextDrawSetString(AyudaInfo, Texto);
 }
//######################################################################################################//
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if(clickedid == AyudaMenu1)
    {
		Mensaje1Ayuda(playerid);
    }
    if(clickedid == AyudaMenu2)
    {
		Mensaje2Ayuda(playerid);
    }
    return 1;
}
//######################################################################################################//
