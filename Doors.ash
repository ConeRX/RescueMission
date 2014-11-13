enum eDoorState
{
	eDoorClosed		= 0, 
	eDoorOpen			= 1, 
	eDoorLocked		= 2, 
};
	
enum eDoorNum
{
	eDoorNumKevin, 
	eDoorNumKamin, 
	eDoorNumDachboden, 
	eDoorNumKueche, 
	eDoorNumBad, 
	eDoorNumHaustuer, 
	eDoorNumWasser1, 
	eDoorNumWasser2, 
  
  eTuerBernardsZimmer, 
  eTuerBritneysZimmer,
  eTuerSchlafzimmer,
  eTuerDachboden,
  eTuerBibliothek,
  eTuerWohnzimmer,
  eTuerEsszimmer,
  eTuerKueche,
  eTuerEingang,
};

struct DoorType
{
	String			s_LookAt;
	String			s_NewLookAt;
	String			s_IsLocked;
	String			s_WrongItemOpen;
	String			s_WrongItemClose;
	int					i_GlobalInt;

	int					l_Room;
	int					i_XPosition;
	int					i_YPosition;
	eDirection	l_Direction;
	Hotspot			*h_Hotspot;
	Object			*o_Objekt;

	int					l_NewRoom;
	int					i_NewXPosition;
	int					i_NewYPosition;
	eDirection	l_NewDirection;
	Hotspot			*h_NewHotspot;
	Object			*o_NewObjekt;
	
	import int SetStrings(String lookat, String islocked, String wrongitemopen,  String wrongitemclose, String lookAt2);
	import int ClickSpecial(int opensound = 2, int closesound = 3, InventoryItem *iItem, int closevalue = 0);
	import int Click();
	import int Init(Object *o_Objekt, Hotspot *h_Hotspot);
};

#define MAX_DOORS 30
import DoorType Door[MAX_DOORS];
import String s_IsLockedStandard;
import String s_WrongItemOpenStandard;
import String s_WrongItemCloseStandard;
import String s_LookAtStandard;
import String s_NewLookAtStandard;

import void DoorSetup();
