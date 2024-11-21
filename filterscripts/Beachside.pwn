// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// Example Filterscript for the new LS BeachSide Building with ASCENSOR
// --------------------------------------------------------------------
// Original ASCENSOR code by Zamaroht in 2010
//
// Updated by Kye in 2011
// * Added a sound effect for the ASCENSOR starting/stopping
//
// Edited by Matite in January 2015
// * Adapted the ASCENSOR code so it works in this new building and removed the
//   light pole at the underSUELO car park entrance
//
// Updated to v1.03 by Matite in April 2015
// * Removed the code that removes the existing building map object and the lines
//   that create the new objects as the original building is now replaced with
//   the new one by SAMP instead (same as the LS Office building)
//
// Updated to v1.02 by Matite in February 2015
// * Added code for the new car park object and edited the ASCENSOR to
//   include the car park
//
// This script creates the new LS BeachSide building object, removes the
// existing GTASA building object, adds the new car park object and creates
// an ASCENSOR that can be used to travel between all levels.
//
// You can un-comment the OnPlayerCommandText callback below to enable a simple
// teleport command (/lsb) that teleports you to the LS BeachSide building.
//
// Warning...
// This script uses a total of:
// * 31 objects = 1 for the ASCENSOR, 2 for the ASCENSOR puertas and 28 for the
//   ASCENSOR PISO puertas
// * 15 3D Text Labels = 14 on the PISOs and 1 in the ASCENSOR
// * 1 dialog (for the ASCENSOR - dialog ID 877)
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


// -----------------------------------------------------------------------------
// Includes
// --------

// SA-MP include
#include <a_samp>

// For PlaySoundForPlayersInRange()
#include "../include/gl_common.inc"

// -----------------------------------------------------------------------------
// Defines
// -------

// Movement speed of the ASCENSOR
#define ASCENSOR_SPEED      (5.0)

// Movement speed of the puertas
#define puertaS_SPEED         (5.0)

// Time in ms that the ASCENSOR will wait in each PISO before continuing with the queue...
// be sure to give enough time for puertas to open
#define ASCENSOR_WAIT_TIME  (5000)

// Dialog ID for the LS BeachSide ASCENSOR dialog
#define DIALOG_ID           (878)

// Position defines
#define X_puerta_R_OPENED     (289.542419)
#define X_puerta_L_OPENED     (286.342407)
#define Y_puerta_R_OPENED     (-1609.640991)
#define Y_puerta_L_OPENED     (-1609.076049)

#define X_Fpuerta_R_OPENED    (289.492431)
#define X_Fpuerta_L_OPENED    (286.292419)
#define Y_Fpuerta_R_OPENED    (-1609.870971)
#define Y_Fpuerta_L_OPENED    (-1609.306030)

#define SUELO_Z_COORD      (18.755348)     // (33.825077)
#define X_ASCENSOR_POS      (287.942413)
#define Y_ASCENSOR_POS      (-1609.341064)

// ASCENSOR state defines
#define ASCENSOR_STATE_IDLE     (0)
#define ASCENSOR_STATE_WAITING  (1)
#define ASCENSOR_STATE_MOVING   (2)

// Invalid PISO define
#define INVALID_PISO           (-1)

// Used for chat text messages
#define COLOR_MESSAGE_YELLOW        0xFFDD00AA

// -----------------------------------------------------------------------------
// Constants
// ---------

// ASCENSOR PISO names for the 3D text labels
static PISONames[14][] =
{
	"Estacionamiento",
	"Recibidor y Oficinas FBI",
	"P1 Gimnasio y Equipación",
	"P2 Unidad de Investigación",
	"P3 Sala de Cámaras (Próximamente)",
	"P4 Dep. de Homicidios (Próximamente)",
	"P5 [Piso en Obras]",
	"P6 [Piso en Obras]",
	"P7 [Piso en Obras]",
	"P8 Escuela de Formación (Próximamente)",
	"P9 Sala de Interrogatorio (Próximamente)",
	"P10 Prisión Federal [Sólo FBI]",
	"P11 Sala de Incautaciones",
	"P12 Oficinas FBI - Directiva"
};

// ASCENSOR PISO Z heights
static Float:PISOZOffsets[14] =
{
    0.0, 		// Car Park
    15.069729,  // SUELO PISO
    29.130733,	// First PISO
    33.630733,  // Second PISO = 29.130733 + 4.5
    38.130733,  // Third PISO = 33.630733 + 4.5
    42.630733,  // Fourth PISO = 38.130733 + 4.5
    47.130733,  // Fifth PISO = 42.630733 + 4.5
    51.630733,  // Sixth PISO = 47.130733 + 4.5
    56.130733,  // Seventh PISO = 51.630733 + 4.5
    60.630733,  // Eighth PISO = 56.130733 + 4.5
    65.130733,  // Ninth PISO = 60.630733 + 4.5
    69.630733,  // Tenth PISO = 65.130733 + 4.5
    74.130733,  // Eleventh PISO = 69.630733 + 4.5
    78.630733,  // Twelfth PISO = 74.130733 + 4.5
};

// -----------------------------------------------------------------------------
// Variables
// ---------

// Stores the created object numbers of the ASCENSOR, the ASCENSOR puertas and
// the ASCENSOR PISO puertas so they can be destroyed when the filterscript
// is unloaded
new Obj_ASCENSOR, Obj_ASCENSORpuertas[2], Obj_PISOpuertas[14][2];
	
// Stores a reference to the 3D text labels used on each PISO and inside the
// ASCENSOR itself so they can be detroyed when the filterscript is unloaded
new Text3D:Label_ASCENSOR, Text3D:Label_PISOs[14];

// Stores the current state of the ASCENSOR (ie ASCENSOR_STATE_IDLE,
// ASCENSOR_STATE_WAITING or ASCENSOR_STATE_MOVING)
new ASCENSORState;

// Stores the current PISO the ASCENSOR is on or heading to... if the value is
// ASCENSOR_STATE_IDLE or ASCENSOR_STATE_WAITING this is the current PISO. If
// the value is ASCENSOR_STATE_MOVING then it is the PISO it's moving to
new	ASCENSORPISO;

// Stores the ASCENSOR queue for each PISO
new ASCENSORQueue[14];

// Stores who requested the PISO for the ASCENSOR queue...
// PISORequestedBy[PISO_id] = playerid;  (stores who requested which PISO)
new	PISORequestedBy[14];

// Used for a timer that makes the ASCENSOR move faster after players start
// surfing the object
new ASCENSORBoostTimer;

// -----------------------------------------------------------------------------
// Function Forwards
// -----------------

// Public:
forward CallASCENSOR(playerid, PISOid);    // You can use INVALID_PLAYER_ID too.
forward ShowASCENSORDialog(playerid);

// Private:
forward ASCENSOR_Initialize();
forward ASCENSOR_Destroy();

forward ASCENSOR_Openpuertas();
forward ASCENSOR_Closepuertas();
forward PISO_Openpuertas(PISOid);
forward PISO_Closepuertas(PISOid);

forward ASCENSOR_MoveToPISO(PISOid);
forward ASCENSOR_Boost(PISOid);        	// Increases the ASCENSOR speed until it reaches 'PISOid'.
forward ASCENSOR_TurnToIdle();

forward ReadNextPISOInQueue();
forward RemoveFirstQueuePISO();
forward AddPISOToQueue(PISOid);
forward IsPISOInQueue(PISOid);
forward ResetASCENSORQueue();

forward DidPlayerRequestASCENSOR(playerid);

forward Float:GetASCENSORZCoordForPISO(PISOid);
forward Float:GetpuertasZCoordForPISO(PISOid);

// -----------------------------------------------------------------------------
// Callbacks
// ---------

// Un-comment the OnPlayerCommandText callback below (remove the "/*" and the "*/")
// to enable a simple teleport command (/lsb) which teleports the player to
// outside the LS BeachSide building.

/*
public OnPlayerCommandText(playerid, cmdtext[])
{
	// Check command text
	if (strcmp("/lsb", cmdtext, true, 4) == 0)
	{
	    // Set the interior
		SetPlayerInterior(playerid, 0);

		// Set player position and facing angle
		SetPlayerPos(playerid, 289.81 + random(2), -1630.65 + random(2), 34.32);
		SetPlayerFacingAngle(playerid, 10);

		// Fix camera position after teleporting
		SetCameraBehindPlayer(playerid);

		// Send a gametext message to the player
		GameTextForPlayer(playerid, "~b~~h~LS BeachSide!", 3000, 3);

	    // Exit here
	    return 1;
	}

	// Exit here (return 0 as the command was not handled in this filterscript)
	return 0;
}
*/

public OnFilterScriptInit()
{
    // Display information in the Server Console
	print("\n");
	print("  |---------------------------------------------------");
	print("  |--- LS BeachSide Filterscript");
    print("  |--  Script v1.03");
    print("  |--  19th April 2015");
	print("  |---------------------------------------------------");

    // Reset the ASCENSOR queue
	ResetASCENSORQueue();

	// Create the ASCENSOR object, the ASCENSOR puertas and the PISO puertas
	ASCENSOR_Initialize();

	// Display information in the Server Console
    print("  |--  LS BeachSide Building ASCENSOR created");
    print("  |---------------------------------------------------");
    
    // Loop
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        // Check if the player is connected and not a NPC
        if (IsPlayerConnected(i) && !IsPlayerNPC(i))
        {
            // Remove the lamp post at the underSUELO car park entrance
            RemoveBuildingForPlayer(i, 1226, 265.481, -1581.1, 32.9311, 5.0);
            
            // Remove the night lights object (must be removed to also remove any
		    // occulsion zones inside the building)
		    RemoveBuildingForPlayer(i, 6518, 280.297, -1606.2, 72.3984, 250.0);
        }
    }

	// Exit here
	return 1;
}

public OnFilterScriptExit()
{
    // Destroy the ASCENSOR, the ASCENSOR puertas and the ASCENSOR PISO puertas
	ASCENSOR_Destroy();

	// Display information in the Server Console
    print("  |--  LS BeachSide Building ASCENSOR destroyed");
    print("  |---------------------------------------------------");

    // Exit here
	return 1;
}

public OnPlayerConnect(playerid)
{
    // Remove the lamp post at the underSUELO car park entrance
    RemoveBuildingForPlayer(playerid, 1226, 265.481, -1581.1, 32.9311, 5.0);
    
    // Remove the night lights object (must be removed to also remove any
    // occulsion zones inside the building)
    RemoveBuildingForPlayer(playerid, 6518, 280.297, -1606.2, 72.3984, 250.0);

	// Exit here (return 1 so this callback is processed in other scripts)
	return 1;
}

public OnObjectMoved(objectid)
{
	// Create variables
    new Float:x, Float:y, Float:z;
    
    // Loop
	for(new i; i < sizeof(Obj_PISOpuertas); i ++)
	{
	    // Check if the object that moved was one of the ASCENSOR PISO puertas
		if(objectid == Obj_PISOpuertas[i][0])
		{
		    GetObjectPos(Obj_PISOpuertas[i][0], x, y, z);

            // Some PISO puertas have shut, move the ASCENSOR to next PISO in queue:
            if (y < Y_puerta_L_OPENED - 0.5)
		    {
				ASCENSOR_MoveToPISO(ASCENSORQueue[0]);
				RemoveFirstQueuePISO();
			}
		}
	}

	if(objectid == Obj_ASCENSOR)   // The ASCENSOR reached the specified PISO.
	{
	    KillTimer(ASCENSORBoostTimer);  // Kills the timer, in case the ASCENSOR reached the PISO before boost.

	    PISORequestedBy[ASCENSORPISO] = INVALID_PLAYER_ID;

	    ASCENSOR_Openpuertas();
	    PISO_Openpuertas(ASCENSORPISO);

	    GetObjectPos(Obj_ASCENSOR, x, y, z);
	    Label_ASCENSOR	= Create3DTextLabel("{CCCCCC}Presiona '{FFFFFF}~k~~CONVERSATION_YES~{CCCCCC}' para usar el ascensor", 0xCCCCCCAA, X_ASCENSOR_POS + 1.6, Y_ASCENSOR_POS - 1.85, z - 0.4, 4.0, 0, 1);

	    ASCENSORState 	= ASCENSOR_STATE_WAITING;
	    SetTimer("ASCENSOR_TurnToIdle", ASCENSOR_WAIT_TIME, 0);
	}

	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_ID)
    {
        if(!response)
            return 0;

        if(PISORequestedBy[listitem] != INVALID_PLAYER_ID || IsPISOInQueue(listitem))
            GameTextForPlayer(playerid, "~r~Espera un momento", 3500, 4);
		else if(DidPlayerRequestASCENSOR(playerid))
		    GameTextForPlayer(playerid, "~r~Usted ya ha solicitado el ascensor, espere un momento", 3500, 4);
		else
	        CallASCENSOR(playerid, listitem);

		return 1;
    }

	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	// Check if the player is not in a vehicle and pressed the conversation yes key (Y by default)
	if (!IsPlayerInAnyVehicle(playerid) && (newkeys & KEY_YES))
	{
	    // Create variables and get the players current position
	    new Float:pos[3];
	    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	    
	    // For debug
	    //printf("X = %0.2f | Y = %0.2f | Z = %0.2f", pos[0], pos[1], pos[2]);

        // Check if the player is using the button inside the ASCENSOR
	    if (pos[1] > (Y_ASCENSOR_POS - 1.8) && pos[1] < (Y_ASCENSOR_POS + 1.8) && pos[0] < (X_ASCENSOR_POS + 1.8) && pos[0] > (X_ASCENSOR_POS - 1.8))
	    {
	        // The player is using the button inside the ASCENSOR
	        // --------------------------------------------------
	        
	        // Show the ASCENSOR dialog to the player
	        ShowASCENSORDialog(playerid);
	    }
		else
		{
		    // Check if the player is using the button on one of the PISOs
		    if(pos[1] < (Y_ASCENSOR_POS - 1.81) && pos[1] > (Y_ASCENSOR_POS - 3.8) && pos[0] > (X_ASCENSOR_POS + 1.21) && pos[0] < (X_ASCENSOR_POS + 3.8))
		    {
		        // The player is most likely using an ASCENSOR PISO button... check which PISO
		        // -----------------------------------------------------------------------------
		        
		        // Create variable with the number of PISOs to check (total PISOs minus 1)
				new i = 13;

				// Loop
				while(pos[2] < GetpuertasZCoordForPISO(i) + 3.5 && i > 0)
				    i --;

				if(i == 0 && pos[2] < GetpuertasZCoordForPISO(0) + 2.0)
				    i = -1;

				if (i <= 12)
				{
				    // Check if the ASCENSOR is not moving (idle or waiting)
				    if (ASCENSORState != ASCENSOR_STATE_MOVING)
				    {
				        // Check if the ASCENSOR is already on the PISO it was called from
				        if (ASCENSORPISO == i + 1)
				        {
				            // Display gametext message to the player
							GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~y~~h~Ascensor Beachside~n~~y~~h~Se encuentra en su mismo piso...~n~~w~Entre dentro~n~~w~y presione '~k~~CONVERSATION_YES~'", 3500, 3);

							// Display chat text message to the player
	                        SendClientMessage(playerid, COLOR_MESSAGE_YELLOW, "*El ascensor está en su planta, entre dentro y eliga el piso al que desea ir, usa'{FFFFFF}~k~~CONVERSATION_YES~{CCCCCC}'");
	                        
	                        // Exit here (return 1 so this callback is processed in other scripts)
	                        return 1;
				        }
				    }

				    // Call function to call the ASCENSOR to the PISO
					CallASCENSOR(playerid, i + 1);

					// Display gametext message to the player
					GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~g~~h~LS BeachSide ASCENSOR~n~~g~~h~ha sido llamado...~n~~w~Por favor espere", 3000, 3);

					// Create variable for formatted message
					new strTempString[100];
					
					// Check if the ASCENSOR is moving
					if (ASCENSORState == ASCENSOR_STATE_MOVING)
					{
					    // Format chat text message
						format(strTempString, sizeof(strTempString), "El ascensor está en movimiento, su planta actual es %s.", PISONames[ASCENSORPISO]);
					}
					else
					{
					    // Check if the PISO is the car park
					    if (ASCENSORPISO == 0)
					    {
					    	// Format chat text message
							format(strTempString, sizeof(strTempString), "El ascensor está en movimiento, su planta actual es %s.", PISONames[ASCENSORPISO]);
						}
						else
						{
					    	// Format chat text message
							format(strTempString, sizeof(strTempString), "El ascensor está en movimiento, su planta actual es %s.", PISONames[ASCENSORPISO]);
						}
					}
					
					// Display formatted chat text message to the player
					SendClientMessage(playerid, COLOR_MESSAGE_YELLOW, strTempString);

					// Exit here (return 1 so this callback is processed in other scripts)
					return 1;
				}
		    }
		}
	}

    // Exit here (return 1 so this callback is processed in other scripts)
	return 1;
}

// ------------------------ Functions ------------------------
stock ASCENSOR_Initialize()
{
	// Create the ASCENSOR and ASCENSOR puerta objects
	Obj_ASCENSOR 			= CreateObject(18755, X_ASCENSOR_POS, Y_ASCENSOR_POS, SUELO_Z_COORD, 0.000000, 0.000000, 80.000000);
	Obj_ASCENSORpuertas[0] 	= CreateObject(18757, X_ASCENSOR_POS, Y_ASCENSOR_POS, SUELO_Z_COORD, 0.000000, 0.000000, 80.000000);
	Obj_ASCENSORpuertas[1] 	= CreateObject(18756, X_ASCENSOR_POS, Y_ASCENSOR_POS, SUELO_Z_COORD, 0.000000, 0.000000, 80.000000);

	// Create the 3D text label for inside the ASCENSOR
	Label_ASCENSOR = Create3DTextLabel("{CCCCCC}Presiona '{FFFFFF}~k~~CONVERSATION_YES~{CCCCCC}' para usar el ascensor", 0xCCCCCCAA, X_ASCENSOR_POS + 1.6, Y_ASCENSOR_POS - 1.85, SUELO_Z_COORD - 0.4, 4.0, 0, 1);

	// Create variables
	new string[128], Float:z;

	// Loop
	for (new i; i < sizeof(Obj_PISOpuertas); i ++)
	{
	    // Create ASCENSOR PISO puerta objects
	    Obj_PISOpuertas[i][0] 	= CreateObject(18757, X_ASCENSOR_POS, Y_ASCENSOR_POS - 0.245, GetpuertasZCoordForPISO(i) + 0.05, 0.000000, 0.000000, 80.000000);
		Obj_PISOpuertas[i][1] 	= CreateObject(18756, X_ASCENSOR_POS, Y_ASCENSOR_POS - 0.245, GetpuertasZCoordForPISO(i) + 0.05, 0.000000, 0.000000, 80.000000);

        // Format string for the PISO 3D text label
		format(string, sizeof(string), "{CCCCCC}[%s]\n{CCCCCC}Presiona '{FFFFFF}~k~~CONVERSATION_YES~{CCCCCC}' para usar", PISONames[i]);

		// Get label Z position
		z = GetpuertasZCoordForPISO(i);

		// Create PISO label
		Label_PISOs[i] = Create3DTextLabel(string, 0xCCCCCCAA, X_ASCENSOR_POS + 2, Y_ASCENSOR_POS -3, z - 0.2, 10.5, 0, 1);
	}

	// Open the car park PISO puertas and the ASCENSOR puertas
	PISO_Openpuertas(0);
	ASCENSOR_Openpuertas();

	// Exit here
	return 1;
}

stock ASCENSOR_Destroy()
{
	// Destroys the ASCENSOR.

	DestroyObject(Obj_ASCENSOR);
	DestroyObject(Obj_ASCENSORpuertas[0]);
	DestroyObject(Obj_ASCENSORpuertas[1]);
	Delete3DTextLabel(Label_ASCENSOR);

	for(new i; i < sizeof(Obj_PISOpuertas); i ++)
	{
	    DestroyObject(Obj_PISOpuertas[i][0]);
		DestroyObject(Obj_PISOpuertas[i][1]);
		Delete3DTextLabel(Label_PISOs[i]);
	}

	return 1;
}

stock ASCENSOR_Openpuertas()
{
	// Opens the ASCENSOR's puertas.

	new Float:x, Float:y, Float:z;

	GetObjectPos(Obj_ASCENSORpuertas[0], x, y, z);
	MoveObject(Obj_ASCENSORpuertas[0], X_puerta_L_OPENED, Y_puerta_L_OPENED, z, puertaS_SPEED);
	MoveObject(Obj_ASCENSORpuertas[1], X_puerta_R_OPENED, Y_puerta_R_OPENED, z, puertaS_SPEED);

	return 1;
}

stock ASCENSOR_Closepuertas()
{
    // Closes the ASCENSOR's puertas.

    if(ASCENSORState == ASCENSOR_STATE_MOVING)
	    return 0;

    new Float:x, Float:y, Float:z;

	GetObjectPos(Obj_ASCENSORpuertas[0], x, y, z);
	MoveObject(Obj_ASCENSORpuertas[0], X_ASCENSOR_POS, Y_ASCENSOR_POS, z, puertaS_SPEED);
	MoveObject(Obj_ASCENSORpuertas[1], X_ASCENSOR_POS, Y_ASCENSOR_POS, z, puertaS_SPEED);

	return 1;
}

stock PISO_Openpuertas(PISOid)
{
    // Opens the puertas at the specified PISO.

    MoveObject(Obj_PISOpuertas[PISOid][0], X_Fpuerta_L_OPENED, Y_Fpuerta_L_OPENED, GetpuertasZCoordForPISO(PISOid) + 0.05, puertaS_SPEED);
	MoveObject(Obj_PISOpuertas[PISOid][1], X_Fpuerta_R_OPENED, Y_Fpuerta_R_OPENED, GetpuertasZCoordForPISO(PISOid) + 0.05, puertaS_SPEED);
	
	//PlaySoundForPlayersInRange(6401, 50.0, X_ASCENSOR_POS, Y_ASCENSOR_POS, GetpuertasZCoordForPISO(PISOid) + 5.0);

	return 1;
}

stock PISO_Closepuertas(PISOid)
{
    // Closes the puertas at the specified PISO.

    MoveObject(Obj_PISOpuertas[PISOid][0], X_ASCENSOR_POS, Y_ASCENSOR_POS - 0.245, GetpuertasZCoordForPISO(PISOid) + 0.05, puertaS_SPEED);
	MoveObject(Obj_PISOpuertas[PISOid][1], X_ASCENSOR_POS, Y_ASCENSOR_POS - 0.245, GetpuertasZCoordForPISO(PISOid) + 0.05, puertaS_SPEED);
	
	//PlaySoundForPlayersInRange(6401, 50.0, X_ASCENSOR_POS, Y_ASCENSOR_POS, GetpuertasZCoordForPISO(PISOid) + 5.0);

	return 1;
}

stock ASCENSOR_MoveToPISO(PISOid)
{
	// Moves the ASCENSOR to specified PISO (puertas are meant to be already closed).

	ASCENSORState = ASCENSOR_STATE_MOVING;
	ASCENSORPISO = PISOid;

	// Move the ASCENSOR slowly, to give time to clients to sync the object surfing. Then, boost it up:
	MoveObject(Obj_ASCENSOR, X_ASCENSOR_POS, Y_ASCENSOR_POS, GetASCENSORZCoordForPISO(PISOid), 0.25);
    MoveObject(Obj_ASCENSORpuertas[0], X_ASCENSOR_POS, Y_ASCENSOR_POS, GetpuertasZCoordForPISO(PISOid), 0.25);
    MoveObject(Obj_ASCENSORpuertas[1], X_ASCENSOR_POS, Y_ASCENSOR_POS, GetpuertasZCoordForPISO(PISOid), 0.25);
    Delete3DTextLabel(Label_ASCENSOR);

	ASCENSORBoostTimer = SetTimerEx("ASCENSOR_Boost", 2000, 0, "i", PISOid);

	return 1;
}

public ASCENSOR_Boost(PISOid)
{
	// Increases the ASCENSOR's speed until it reaches 'PISOid'
	StopObject(Obj_ASCENSOR);
	StopObject(Obj_ASCENSORpuertas[0]);
	StopObject(Obj_ASCENSORpuertas[1]);
	
	MoveObject(Obj_ASCENSOR, X_ASCENSOR_POS, Y_ASCENSOR_POS, GetASCENSORZCoordForPISO(PISOid), ASCENSOR_SPEED);
    MoveObject(Obj_ASCENSORpuertas[0], X_ASCENSOR_POS, Y_ASCENSOR_POS, GetpuertasZCoordForPISO(PISOid), ASCENSOR_SPEED);
    MoveObject(Obj_ASCENSORpuertas[1], X_ASCENSOR_POS, Y_ASCENSOR_POS, GetpuertasZCoordForPISO(PISOid), ASCENSOR_SPEED);

	return 1;
}

public ASCENSOR_TurnToIdle()
{
	ASCENSORState = ASCENSOR_STATE_IDLE;
	ReadNextPISOInQueue();

	return 1;
}

stock RemoveFirstQueuePISO()
{
	// Removes the data in ASCENSORQueue[0], and reorders the queue accordingly.

	for(new i; i < sizeof(ASCENSORQueue) - 1; i ++)
	    ASCENSORQueue[i] = ASCENSORQueue[i + 1];

	ASCENSORQueue[sizeof(ASCENSORQueue) - 1] = INVALID_PISO;

	return 1;
}

stock AddPISOToQueue(PISOid)
{
 	// Adds 'PISOid' at the end of the queue.

	// Scan for the first empty space:
	new slot = -1;
	for(new i; i < sizeof(ASCENSORQueue); i ++)
	{
	    if(ASCENSORQueue[i] == INVALID_PISO)
	    {
	        slot = i;
	        break;
	    }
	}

	if(slot != -1)
	{
	    ASCENSORQueue[slot] = PISOid;

     	// If needed, move the ASCENSOR.
	    if(ASCENSORState == ASCENSOR_STATE_IDLE)
	        ReadNextPISOInQueue();

	    return 1;
	}

	return 0;
}

stock ResetASCENSORQueue()
{
	// Resets the queue.

	for(new i; i < sizeof(ASCENSORQueue); i ++)
	{
	    ASCENSORQueue[i] 	= INVALID_PISO;
	    PISORequestedBy[i] = INVALID_PLAYER_ID;
	}

	return 1;
}

stock IsPISOInQueue(PISOid)
{
	// Checks if the specified PISO is currently part of the queue.

	for(new i; i < sizeof(ASCENSORQueue); i ++)
	    if(ASCENSORQueue[i] == PISOid)
	        return 1;

	return 0;
}

stock ReadNextPISOInQueue()
{
	// Reads the next PISO in the queue, closes puertas, and goes to it.

	if(ASCENSORState != ASCENSOR_STATE_IDLE || ASCENSORQueue[0] == INVALID_PISO)
	    return 0;

	ASCENSOR_Closepuertas();
	PISO_Closepuertas(ASCENSORPISO);

	return 1;
}

stock DidPlayerRequestASCENSOR(playerid)
{
	for(new i; i < sizeof(PISORequestedBy); i ++)
	    if(PISORequestedBy[i] == playerid)
	        return 1;

	return 0;
}

stock ShowASCENSORDialog(playerid)
{
	new string[512];
	for(new i; i < sizeof(ASCENSORQueue); i ++)
	{
	    if(PISORequestedBy[i] != INVALID_PLAYER_ID)
	        strcat(string, "{FF0000}");

	    strcat(string, PISONames[i]);
	    strcat(string, "\n");
	}

	ShowPlayerDialog(playerid, DIALOG_ID, DIALOG_STYLE_LIST, "[ASCENSOR] Beachside Los Santos", string, "Aceptar", "Cancelar");

	return 1;
}

stock CallASCENSOR(playerid, PISOid)
{
	// Calls the ASCENSOR (also used with the ASCENSOR dialog).

	if(PISORequestedBy[PISOid] != INVALID_PLAYER_ID || IsPISOInQueue(PISOid))
	    return 0;

	PISORequestedBy[PISOid] = playerid;
	AddPISOToQueue(PISOid);

	return 1;
}

stock Float:GetASCENSORZCoordForPISO(PISOid)
{
	// Return Z height value
    return (SUELO_Z_COORD + PISOZOffsets[PISOid]);
}

stock Float:GetpuertasZCoordForPISO(PISOid)
{
    // Return Z height value
	return (SUELO_Z_COORD + PISOZOffsets[PISOid]);
}

