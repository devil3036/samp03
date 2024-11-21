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
public OnFilterScriptInit()
{
CreateDynamicObject(978, 1524.91797, -1584.94775, 13.19400,   0.00000, 0.00000, 159.68547);
CreateDynamicObject(978, 1537.69531, -1597.57043, 13.19400,   0.00000, 0.00000, 112.52379);
CreateDynamicObject(978, 1378.62744, -1592.36951, 13.19400,   0.00000, 0.00000, 346.33206);
CreateDynamicObject(978, 1532.59570, -1589.86218, 13.19400,   0.00000, 0.00000, 135.01747);
CreateDynamicObject(978, 1524.33289, -1629.95813, 13.19400,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(978, 1505.53967, -1597.85986, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1495.96472, -1597.84802, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1486.13257, -1597.81030, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1476.30762, -1597.80334, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1466.41968, -1597.79480, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1456.93652, -1597.77869, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1447.12048, -1597.78101, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1437.54700, -1597.81177, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1416.52722, -1587.42688, 13.19400,   0.00000, 0.00000, 180.46599);
CreateDynamicObject(978, 1417.20776, -1597.67480, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1407.26306, -1597.66687, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1397.80054, -1596.88306, 13.19400,   0.00000, 0.00000, 350.84326);
CreateDynamicObject(978, 1388.24890, -1594.80908, 13.19400,   0.00000, 0.00000, 345.50348);
CreateDynamicObject(978, 1360.04626, -1587.35095, 13.19400,   0.00000, 0.00000, 344.60626);
CreateDynamicObject(978, 1369.24976, -1589.87634, 13.19400,   0.00000, 0.00000, 344.60626);
CreateDynamicObject(978, 1332.23511, -1579.67822, 13.19400,   0.00000, 0.00000, 344.60626);
CreateDynamicObject(978, 1350.76855, -1584.76294, 13.19400,   0.00000, 0.00000, 344.60626);
CreateDynamicObject(978, 1341.46240, -1582.13379, 13.19400,   0.00000, 0.00000, 344.60626);
CreateDynamicObject(978, 1307.84167, -1548.32349, 13.19400,   0.00000, 0.00000, 262.44183);
CreateDynamicObject(978, 1323.01160, -1577.33423, 13.19400,   0.00000, 0.00000, 346.92078);
CreateDynamicObject(978, 1314.61218, -1573.39551, 13.19400,   0.00000, 0.00000, 322.20642);
CreateDynamicObject(978, 1308.48718, -1566.47339, 13.19400,   0.00000, 0.00000, 301.22662);
CreateDynamicObject(978, 1306.59937, -1557.86621, 13.19400,   0.00000, 0.00000, 262.44183);
CreateDynamicObject(978, 1316.74878, -1521.71692, 13.19400,   0.00000, 0.00000, 241.57629);
CreateDynamicObject(978, 1309.63184, -1539.04980, 13.19400,   0.00000, 0.00000, 255.83099);
CreateDynamicObject(978, 1312.69141, -1530.04419, 13.19400,   0.00000, 0.00000, 247.48232);
CreateDynamicObject(978, 1332.11426, -1497.88696, 13.19400,   0.00000, 0.00000, 238.29082);
CreateDynamicObject(978, 1321.55298, -1513.65198, 13.19400,   0.00000, 0.00000, 235.72638);
CreateDynamicObject(978, 1326.95447, -1505.85193, 13.19400,   0.00000, 0.00000, 235.72638);
CreateDynamicObject(978, 1343.39111, -1472.51563, 13.19400,   0.00000, 0.00000, 255.93054);
CreateDynamicObject(978, 1336.85986, -1489.81140, 13.19400,   0.00000, 0.00000, 242.03442);
CreateDynamicObject(978, 1340.66931, -1481.30994, 13.19400,   0.00000, 0.00000, 249.31972);
CreateDynamicObject(978, 1350.73010, -1425.88635, 13.19400,   0.00000, 0.00000, 267.73419);
CreateDynamicObject(978, 1345.63281, -1463.06555, 13.19400,   0.00000, 0.00000, 256.97678);
CreateDynamicObject(978, 1347.83875, -1453.87683, 13.19400,   0.00000, 0.00000, 256.97678);
CreateDynamicObject(978, 1349.60095, -1444.55017, 13.19400,   0.00000, 0.00000, 261.90994);
CreateDynamicObject(978, 1350.38354, -1435.28760, 13.19400,   0.00000, 0.00000, 267.73419);
CreateDynamicObject(978, 1315.16528, -1405.78723, 13.19400,   0.00000, 0.00000, 0.15179);
CreateDynamicObject(978, 1347.42212, -1418.18457, 13.19400,   0.00000, 0.00000, 318.68930);
CreateDynamicObject(978, 1340.91968, -1413.82983, 13.21000,   0.00000, 0.00000, 333.62183);
CreateDynamicObject(978, 1332.91223, -1408.77869, 13.19400,   0.00000, 0.00000, 321.19919);
CreateDynamicObject(978, 1324.61694, -1405.84460, 13.19400,   0.00000, 0.00000, 359.34271);
CreateDynamicObject(978, 1275.93457, -1405.79956, 12.92200,   0.00000, 0.00000, 0.15180);
CreateDynamicObject(978, 1305.78259, -1405.75793, 13.09800,   0.00000, 0.00000, 0.15180);
CreateDynamicObject(978, 1515.38232, -1597.94263, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1522.14819, -1601.87756, 13.19400,   0.00000, 0.00000, 298.01559);
CreateDynamicObject(978, 1524.22925, -1610.81519, 13.19400,   0.00000, 0.00000, 270.63654);
CreateDynamicObject(978, 1427.42236, -1597.79028, 13.19400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1444.12695, -1582.10364, 13.19400,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(978, 1425.87585, -1586.36597, 13.19400,   0.00000, 0.00000, 192.70244);
CreateDynamicObject(978, 1388.17334, -1583.44751, 13.19400,   0.00000, 0.00000, 167.00195);
CreateDynamicObject(978, 1407.16809, -1586.95972, 13.19400,   0.00000, 0.00000, 174.12137);
CreateDynamicObject(978, 1397.55212, -1585.49731, 13.19400,   0.00000, 0.00000, 168.72743);
CreateDynamicObject(978, 1360.16553, -1575.89734, 13.29400,   0.00000, 0.00000, 163.44821);
CreateDynamicObject(978, 1378.88428, -1581.17786, 13.19400,   0.00000, 0.00000, 164.99709);
CreateDynamicObject(978, 1369.66382, -1578.65369, 13.29400,   0.00000, 0.00000, 164.06342);
CreateDynamicObject(978, 1326.14087, -1529.48328, 13.29400,   0.00000, 0.00000, 68.51263);
CreateDynamicObject(978, 1350.92053, -1573.39014, 13.29400,   0.00000, 0.00000, 166.57556);
CreateDynamicObject(978, 1341.80127, -1570.78027, 13.29400,   0.00000, 0.00000, 162.83195);
CreateDynamicObject(978, 1332.74011, -1568.00500, 13.29400,   0.00000, 0.00000, 163.66052);
CreateDynamicObject(978, 1324.03479, -1564.33630, 13.29400,   0.00000, 0.00000, 150.12392);
CreateDynamicObject(978, 1319.79834, -1557.32715, 13.29400,   0.00000, 0.00000, 91.07333);
CreateDynamicObject(978, 1320.43884, -1547.77332, 13.29400,   0.00000, 0.00000, 81.68607);
CreateDynamicObject(978, 1322.74097, -1538.53015, 13.29400,   0.00000, 0.00000, 70.17083);
CreateDynamicObject(978, 1359.03625, -1461.43323, 13.29400,   0.00000, 0.00000, 76.14355);
CreateDynamicObject(978, 1330.57202, -1520.86633, 13.29400,   0.00000, 0.00000, 57.82563);
CreateDynamicObject(978, 1335.86011, -1513.05591, 13.29400,   0.00000, 0.00000, 55.32072);
CreateDynamicObject(978, 1341.13354, -1505.41187, 13.29400,   0.00000, 0.00000, 56.65939);
CreateDynamicObject(978, 1345.71484, -1497.20117, 13.29400,   0.00000, 0.00000, 63.81292);
CreateDynamicObject(978, 1350.13550, -1488.56177, 13.29400,   0.00000, 0.00000, 63.09157);
CreateDynamicObject(978, 1353.85828, -1479.91443, 13.29400,   0.00000, 0.00000, 69.70235);
CreateDynamicObject(978, 1356.74353, -1470.75061, 13.29400,   0.00000, 0.00000, 76.14355);
CreateDynamicObject(978, 1347.98938, -1385.62183, 13.29400,   0.00000, 0.00000, 186.27072);
CreateDynamicObject(978, 1361.04822, -1451.89087, 13.29400,   0.00000, 0.00000, 80.45125);
CreateDynamicObject(978, 1362.12378, -1442.44202, 13.29400,   0.00000, 0.00000, 86.53038);
CreateDynamicObject(978, 1362.64587, -1432.94165, 13.29400,   0.00000, 0.00000, 87.25173);
CreateDynamicObject(978, 1363.05981, -1423.36206, 13.29400,   0.00000, 0.00000, 87.25173);
CreateDynamicObject(978, 1363.40344, -1413.88940, 13.29400,   0.00000, 0.00000, 89.70997);
CreateDynamicObject(978, 1363.51160, -1404.03394, 13.29400,   0.00000, 0.00000, 89.70997);
CreateDynamicObject(978, 1362.27234, -1394.64832, 13.29400,   0.00000, 0.00000, 105.89899);
CreateDynamicObject(978, 1356.75671, -1387.39758, 13.29400,   0.00000, 0.00000, 148.71783);
CreateDynamicObject(978, 1273.81372, -1395.55615, 12.87700,   0.00000, 0.00000, 180.54930);
CreateDynamicObject(978, 1339.11426, -1388.42957, 13.23000,   0.00000, 0.00000, 207.59351);
CreateDynamicObject(978, 1330.90503, -1392.90649, 13.19800,   0.00000, 0.00000, 208.04268);
CreateDynamicObject(978, 1322.13855, -1395.16614, 13.15800,   0.00000, 0.00000, 180.54930);
CreateDynamicObject(978, 1312.58789, -1395.32458, 13.08560,   0.00000, 0.00000, 180.54930);
CreateDynamicObject(978, 1302.97559, -1395.48633, 13.03700,   0.00000, 0.00000, 180.54930);
CreateDynamicObject(978, 1293.29590, -1395.51563, 12.99700,   0.00000, 0.00000, 180.54930);
CreateDynamicObject(978, 1283.59204, -1395.51990, 12.94900,   0.00000, 0.00000, 180.54930);
CreateDynamicObject(978, 1296.18384, -1405.79150, 13.02600,   0.00000, 0.00000, 0.15180);
CreateDynamicObject(978, 1286.09363, -1405.69275, 12.93800,   0.00000, 0.00000, 0.15180);
CreateDynamicObject(19545, 677.57483, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1177.00000, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1114.52576, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1052.22485, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 989.89642, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 927.36169, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 864.88049, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 802.54492, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 740.05750, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1239.48218, -1405.87817, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1239.48218, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1177.00000, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1114.52576, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 1052.22485, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 989.89642, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 927.36169, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 864.88049, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 802.54492, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 740.05750, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(19545, 677.57483, -1395.09998, 6.00000,   0.00000, 90.00000, 90.00000);
CreateDynamicObject(978, 641.34857, -1394.97388, 13.19150,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(978, 641.36432, -1405.99341, 13.20750,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 631.49237, -1405.98169, 13.25550,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 631.38354, -1394.97778, 13.25550,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(978, 621.39996, -1395.02527, 13.25550,   0.00000, 0.00000, 181.04623);
CreateDynamicObject(978, 611.68652, -1395.71265, 13.25550,   0.00000, 0.00000, 186.96645);
CreateDynamicObject(978, 602.13550, -1396.61938, 13.25550,   0.00000, 0.00000, 184.28358);
CreateDynamicObject(978, 621.72235, -1405.65332, 13.25550,   0.00000, 0.00000, 355.53696);
CreateDynamicObject(978, 611.99866, -1405.78357, 13.25550,   0.00000, 0.00000, 5.86223);
CreateDynamicObject(978, 602.29498, -1406.68433, 13.25550,   0.00000, 0.00000, 4.92538);
CreateDynamicObject(978, 592.89545, -1408.18298, 13.37385,   0.00000, 0.00000, 14.44452);
CreateDynamicObject(978, 592.36487, -1397.53198, 13.25550,   0.00000, 0.00000, 186.42885);
CreateDynamicObject(978, 583.25220, -1400.06409, 14.03050,   0.00000, -8.00000, 206.01100);
CreateDynamicObject(978, 574.81891, -1404.10620, 14.64400,   0.00000, 0.00000, 204.72659);
CreateDynamicObject(978, 583.25220, -1400.06409, 13.34635,   0.00000, 0.00000, 206.01100);
CreateDynamicObject(978, 585.86267, -1413.39771, 14.13810,   0.00000, 8.00000, 59.87660);
CreateDynamicObject(978, 579.83862, -1419.12732, 14.57613,   0.00000, 0.00000, 24.26269);
CreateDynamicObject(19545, 575.73059, -1424.34180, 12.27680,   -15.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 1434.95520, -1583.69080, 13.19400,   0.00000, 0.00000, 200.16058);
CreateDynamicObject(978, 1524.33374, -1620.30237, 13.19400,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(978, 1524.35657, -1639.38220, 13.19400,   0.00000, 0.00000, 270.00000);
CreateDynamicObject(978, 585.86267, -1413.39771, 13.41070,   0.00000, 0.00000, 59.87660);
CreateDynamicObject(978, 579.83862, -1419.12732, 13.51685,   0.00000, 0.00000, 24.26269);
CreateDynamicObject(978, 574.81891, -1404.10620, 13.39250,   0.00000, 0.00000, 204.72659);
CreateDynamicObject(978, 566.31403, -1406.82715, 14.41180,   0.00000, -3.50000, 192.39420);
CreateDynamicObject(978, 490.25540, -1449.86414, 16.75990,   0.00000, -5.00000, 237.61160);
CreateDynamicObject(978, 495.31000, -1442.12158, 16.10490,   0.00000, -5.00000, 237.61160);
CreateDynamicObject(978, 500.17099, -1434.47937, 15.30510,   0.00000, -5.00000, 237.61160);
CreateDynamicObject(978, 505.36121, -1426.71265, 15.28910,   0.00000, 2.00000, 237.61160);
CreateDynamicObject(978, 512.25128, -1421.08008, 15.62610,   0.00000, 1.00000, 200.60620);
CreateDynamicObject(978, 521.11853, -1418.17871, 15.72510,   0.00000, 0.00000, 195.43919);
CreateDynamicObject(978, 530.13391, -1415.69116, 15.72510,   0.00000, 0.00000, 195.43919);
CreateDynamicObject(978, 539.04883, -1413.25037, 15.57310,   0.00000, -2.00000, 195.43919);
CreateDynamicObject(978, 548.12659, -1411.07715, 15.28910,   0.00000, -2.00000, 192.79430);
CreateDynamicObject(978, 557.23279, -1408.92737, 14.90790,   0.00000, -2.50000, 193.51880);
CreateDynamicObject(987, 494.70807, -1442.69189, 11.63085,   0.00000, 0.00000, 58.13905);
CreateDynamicObject(978, 558.76343, -1426.77783, 15.84970,   0.00000, 0.00000, 1.55920);
CreateDynamicObject(978, 512.69531, -1454.11462, 15.47575,   0.00000, 5.00000, 50.79500);
CreateDynamicObject(978, 512.69531, -1454.11462, 14.93857,   0.00000, 0.00000, 50.79503);
CreateDynamicObject(978, 518.99597, -1447.14038, 15.03560,   0.00000, -1.00000, 44.27776);
CreateDynamicObject(978, 525.60266, -1440.72534, 15.33660,   0.00000, -1.00000, 42.49941);
CreateDynamicObject(978, 532.63916, -1434.44934, 15.54369,   0.00000, -1.00000, 40.17549);
CreateDynamicObject(978, 540.55560, -1430.02759, 15.74469,   0.00000, -1.00000, 18.62195);
CreateDynamicObject(978, 549.62579, -1427.66260, 15.88970,   0.00000, 0.00000, 10.29760);
CreateDynamicObject(987, 500.99310, -1432.53333, 11.63085,   0.00000, 0.00000, 58.13905);
CreateDynamicObject(3864, 1354.73547, -1385.27356, 14.12717,   0.00000, 0.00000, 56.53262);
CreateDynamicObject(3864, 1349.72278, -1421.31433, 14.12717,   0.00000, 0.00000, 244.70393);
CreateDynamicObject(3864, 1332.95496, -1391.12561, 14.12717,   0.00000, 0.00000, 180.16386);
CreateDynamicObject(3660, 1369.04651, -1406.79456, 14.65990,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(3660, 1346.59192, -1383.73352, 14.67594,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(3660, 1362.87634, -1390.53235, 14.67594,   0.00000, 0.00000, 314.93256);
CreateDynamicObject(972, 526.78516, -1648.59827, 12.21640,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(972, 543.75476, -1678.93140, 12.21637,   0.00000, 0.00000, 0.70482);
CreateDynamicObject(972, 543.31622, -1629.06873, 11.49505,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(972, 526.77570, -1673.54810, 12.21640,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(972, 526.70251, -1623.76746, 11.08685,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(972, 543.41620, -1653.99878, 12.21640,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(978, 519.16150, -1599.50073, 16.85760,   0.00000, 0.00000, 287.45520);
CreateDynamicObject(978, 522.01868, -1608.55103, 16.05360,   0.00000, 0.00000, 287.45520);
CreateDynamicObject(978, 515.56555, -1590.74463, 16.79681,   0.00000, 0.00000, 295.98737);
CreateDynamicObject(978, 519.16150, -1599.50073, 15.75059,   0.00000, 0.00000, 287.45520);
CreateDynamicObject(978, 511.37781, -1582.25659, 16.79568,   0.00000, 0.00000, 295.98737);
CreateDynamicObject(978, 515.56555, -1590.74463, 15.75059,   0.00000, 0.00000, 295.98737);
CreateDynamicObject(978, 511.37781, -1582.25659, 15.75059,   0.00000, 0.00000, 295.98737);
CreateDynamicObject(978, 524.06610, -1567.34253, 15.49854,   0.00000, 0.00000, 125.91591);
CreateDynamicObject(978, 546.51440, -1609.64148, 16.00154,   0.00000, 0.00000, 92.07845);
CreateDynamicObject(978, 544.34277, -1600.36719, 17.01058,   0.00000, 0.00000, 114.54224);
CreateDynamicObject(978, 539.93555, -1591.76099, 16.70758,   0.00000, 0.00000, 120.30193);
CreateDynamicObject(978, 534.87238, -1583.53101, 16.72079,   0.00000, 0.00000, 121.68287);
CreateDynamicObject(978, 529.76642, -1575.24731, 16.72592,   0.00000, 0.00000, 124.25449);
CreateDynamicObject(978, 524.06610, -1567.34253, 16.61467,   0.00000, 0.00000, 125.91591);
CreateDynamicObject(978, 529.69360, -1575.31580, 15.49854,   0.00000, 0.00000, 124.25449);
CreateDynamicObject(978, 534.87238, -1583.53101, 15.49854,   0.00000, 0.00000, 121.68287);
CreateDynamicObject(978, 539.93555, -1591.76099, 15.49854,   0.00000, 0.00000, 120.30193);
CreateDynamicObject(978, 544.34277, -1600.36719, 15.80155,   0.00000, 0.00000, 114.54224);
CreateDynamicObject(980, 517.56812, -1559.22925, 14.30239,   0.00000, 0.00000, 309.45206);
CreateDynamicObject(980, 496.11359, -1566.61536, 14.40749,   0.00000, 0.00000, 322.40833);
CreateDynamicObject(980, 511.48386, -1553.02246, 14.40749,   0.00000, 0.00000, 316.14496);
CreateDynamicObject(980, 504.92999, -1574.02173, 14.40749,   0.00000, 0.00000, 316.76019);
CreateDynamicObject(18761, 1530.80420, -1654.55701, 15.82817,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19972, 1432.11340, -1601.03210, 12.37784,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19972, 1427.39038, -1582.78857, 12.36720,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(19972, 1314.91260, -1576.18506, 12.37579,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19972, 1539.64990, -1594.94727, 12.37580,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(19972, 1371.57861, -1398.86560, 12.37840,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(19972, 1345.03406, -1381.32361, 12.48040,   0.00000, 0.00000, 180.00000);
CreateDynamicObject(19972, 1331.13086, -1409.47998, 12.34140,   0.00000, 0.00000, -90.00000);
CreateDynamicObject(19972, 1345.23438, -1418.95471, 12.37731,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(11752, 1263.38062, -1400.08044, 7.71530,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(11752, 659.76990, -1400.37988, 12.36810,   0.00000, 0.00000, 90.00000);
CreateDynamicObject(11752, 533.29810, -1722.72742, 9.58001,   0.00000, 0.00000, 353.55362);
CreateDynamicObject(18778, 534.80280, -1675.65735, 19.09440,   0.00000, 0.00000, 176.80289);
CreateDynamicObject(19336, 1315.30005, -1391.06897, 45.00290,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(19335, 1341.21704, -1436.61487, 30.27173,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1459, 1335.09082, -1418.58240, 12.96990,   0.00000, 0.00000, 311.74011);
CreateDynamicObject(1238, 1340.98340, -1424.08801, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1459, 1333.35571, -1416.48389, 12.96990,   0.00000, 0.00000, 311.74011);
CreateDynamicObject(1238, 1338.18323, -1420.83655, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1339.59290, -1422.34241, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1330.55090, -1391.10303, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1341.96936, -1425.67786, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1341.75244, -1427.57568, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1342.47083, -1418.92212, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1344.74158, -1421.59363, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1346.46936, -1424.23596, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1340.18323, -1415.25171, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1321.66992, -1411.77502, 12.90100,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1328.45703, -1407.38306, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1331.93750, -1383.67737, 13.56920,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1328.71582, -1392.52148, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1339.13171, -1378.85364, 12.77300,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1336.31299, -1386.06873, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1332.50330, -1389.29785, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1334.29126, -1387.70544, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1328.68982, -1386.48181, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1326.19385, -1388.64148, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1336.98962, -1381.34644, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1336.94971, -1370.99414, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1333.02612, -1378.98938, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1326.62537, -1394.08521, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1363.30847, -1376.30396, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1344.40991, -1376.10657, 12.77300,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1341.75623, -1377.02563, 12.77300,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1335.33875, -1373.77405, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1333.14258, -1375.98340, 12.95400,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1346.65735, -1374.46777, 12.77300,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1369.78882, -1392.82068, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1359.95374, -1385.04553, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1359.95374, -1385.04553, 12.83700,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1366.94031, -1384.79260, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1365.74597, -1383.53577, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1364.64038, -1382.02722, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1363.63098, -1380.14880, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1363.41797, -1378.03394, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1361.62781, -1386.15295, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1358.01123, -1383.64026, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1356.27722, -1381.87366, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1354.07031, -1380.37744, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1352.93127, -1377.62183, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1368.80615, -1391.43604, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1372.20325, -1395.90881, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1371.23376, -1394.28577, 12.84500,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1375.58142, -1389.05408, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1366.99084, -1389.48096, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1363.91956, -1387.85632, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1370.29419, -1386.52026, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1372.85193, -1388.18066, 12.98210,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1329.32581, -1409.30505, 12.68390,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1331.53271, -1411.26245, 12.90100,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1335.85730, -1412.79041, 12.90100,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1324.90662, -1415.46790, 12.90100,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1238, 1323.50757, -1413.74731, 12.90100,   0.00000, 0.00000, 0.00000);
return 1;
}

//-------------------------------------------------

public OnFilterScriptExit()
{
	return 1;
}

//-------------------------------------------------



