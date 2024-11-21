//
// Used for testing interpolated rotations with MoveObject
// Also used to test AttachObjectToObject
// A pirate ship goes around and visits some route points
//
// SA-MP 0.3d and above
//
// - Kye 2011
//

#include <a_samp>
#include <streamer>
#include <sscanf2>


	// AQUI COLOCAS TU MAPEADO Y REEMPLAZA TODOS LOS 'PollaXDExs' por 'PollaXDExsEx'

public OnFilterScriptInit()
{
CreateDynamicObject(3988, 1596.55469, -1817.29688, 21.03125,   0.0, 0.00000, 0.0); // Desbug map Deposito.
CreateDynamicObject(10023, 1480.90002, -1756.00000, 2990.00000,   0.00000, 0.00000, 0.00000); // Desbug map de Ayuntamiento.
CreateDynamicObject(1537, 732.11340, -1334.90588, 12.42140,   0.00000, 0.00000, 90.00000); // Desbug LSTV.
// Cartel 1 - Ayuntamiento.
CreateDynamicObject(1267, 1514.53589, -1722.73425, 23.25947,   0.00000, 0.00000, 0.00000);
new Cartel = CreateDynamicObject(9189, 1517.98596, -1723.23938, 29.25100,   0.00000, 0.00000, 105.00000);
SetDynamicObjectMaterialText(Cartel, 0,"[Gobierno de S.A]\n{5882FA}Presidente Osiel Amador:\n{81DAF5}- Habrá un antes y un después\nen este nuevo Gobierno -",OBJECT_MATERIAL_SIZE_256x128,
"Arial", 20, 1, 0xFFFF0000, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
// Cartel 2 - Taller.
CreateDynamicObject(1267, 1921.74426, -1759.14612, 21.80191,   0.00000, 0.00000, 0.00000);
new Cartel2 = CreateDynamicObject(9189, 1925.26025, -1759.62317, 27.79650,   0.00000, 0.00000, 105.48060);
SetDynamicObjectMaterialText(Cartel2, 0,"[Gobierno de S.A]\n{5882FA}Presidente Osiel Amador:\n{81DAF5}- Generemos más empleo\naumento de riqueza y salud -",OBJECT_MATERIAL_SIZE_256x128,
"Arial", 20, 1, 0xFFFF0000, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
// Cartel 3 - SEC.
CreateDynamicObject(1267, 1320.60620, -1388.31787, 21.69403,   0.00000, 0.00000, 0.00000);
new Cartel3 = CreateDynamicObject(9189, 1324.03235, -1388.83167, 27.69610,   0.00000, 0.00000, 104.90590);
SetDynamicObjectMaterialText(Cartel3, 0,"[Gobierno de S.A]\n{5882FA}Presidente Osiel Amador:\n{81DAF5}- El cambio no está en nosotros\nestá en todos -",OBJECT_MATERIAL_SIZE_256x128,
"Arial", 20, 1, 0xFFFF0000, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

new testing = CreateDynamicObject(9189, 760.97223, 15.66000, 1004.1,   0.00000, 0.00000, 7.50000);
SetDynamicObjectMaterialText(testing, 0,"\n{FAAC58}- Evento Ganton -\n{F7D358}¡Apuntense ahora mismo!\n{FFFFFF}#ClubLuchaNS{585858}",OBJECT_MATERIAL_SIZE_256x128,
"Arial", 20, 1, 0xFFFF0000, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

return 1;
}

//-------------------------------------------------

public OnFilterScriptExit()
{
	return 1;
}

//-------------------------------------------------



