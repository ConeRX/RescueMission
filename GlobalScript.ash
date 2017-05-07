// Main header script - this will be included into every script in
// the game (local and global). Do not place functions here; rather,
// place import definitions and #define names here to be used by all
// scripts.

// -- Variablen ---
import bool F5Allowed;

// -- Keypad ---
import int keypad_function;
import function Keypad_start(int phrase);

// --- owntimer ---
import function SetOwnTimer(int timerid, int timeout);
import function IsOwnTimerExpired(int timerid);

// --- Speech ---
import function DisplaySpeechBackgroundEx(this Character*, String message);
import function repeatedly_execute_always();

//veraltet (defines)
#define A_WALK_TO  0
#define A_LOOK_AT  1
#define A_TALK_TO  2
#define A_GIVE_TO  3
#define A_PICK_UP  4
#define A_USE      5
#define A_OPEN     6
#define A_CLOSE    7
#define A_PUSH     8
#define A_PULL     9

#define A_COUNT_     10

#define A_DEFAULT    11
#define A_SWITCH_TO  12
#define A_USE_INV    13

// --- action ---
enum eAction
{
	eActWalkTo = 0, 
	eActLookAt = 1, 
	eActTalkTo = 2, 
	eActGiveTo = 3, 
	eActPickUp = 4,
	eActUse    = 5, 
	eActOpen   = 6, 
	eActClose  = 7, 
	eActPush   = 8, 
	eActPull   = 9, 

	eActCount  = 10,

	eActDefault      = 11, 
	eActSwitchTo     = 12, 
	eActUseInventory = 13, 
};

import function UsedAction(eAction test_action);

// --- cancelable semi-blocking move-player-character functions:---

//! veraltet (obsolet)
import function MovePlayer(int x, int y);
//! veraltet (obsolet) - wird durch ein Player-Extend ersetzt (Character.GoToCharacter(Character *charac, CharacterDirection dir, bool FacePlayer, eBlockingMMM blocking);)
import function GoToCharacter(Character *charid, int direction, int NPCfacesplayer, int blocking);
//! veraltet (obsolet) - wird durch ein Player-Extend ersetzt (Character.GoToCharacter(Character *charac, CharacterDirection dir, bool FacePlayer, eBlockingMMM blocking);)
import function NPCGoToCharacter(Character *charidwhogoes, Character *charidtogoto, int direction, int NPCfacesplayer, int blocking);

// -- interaction function ---
//! wird aufgerufen, wenn keine Aktion für das aktuelle Objekt definiert wurde (sollte immer in einem else-Zweig am Ende stehen)
import function Unhandled ();

//! lässt den Charakter eiinen Text sagen, wenn die spezifizierte Aktion wurde
import function SayIfAction(this Character*, eAction action, String message);
//! lässt einen Charakter einen Satz sagen, wenn er der aktuelle Spieler ist
import bool SayIfPlayer(this Character*, String mesage);


// --- parameters for CallRoomScript / on_call ---
#define GAME_RESTORED      2


// --- translation ---
import function TranslateNumber (String number_name);
import function getInteger (string numbers);

// --- sound functions ---
import function AlarmSound ();


// --- interaction functions ---

//! Extender Funktion - setzt die gewählte Spielfigur auf die aktuelle Position, ohne diese dahin laufen zu lassen.
import function PlaceCharacter (this Character*, int x, int y, CharacterDirection dir);

//! veraltet (obsolet)
import function PlacePC (int x, int y, CharacterDirection dir);
//! muss für jedes Tür-Objekt in before fade-in aufgerufen werden um den aktuellen Zustand der Tür anzuzeigen und das Objekt nicht klickbar zu machen
import function init_object (this Object*,  int GI);

//! lässt den aktuellen Spieler an die Position x,y laufen und richtet ihn danach mit Richtung dir aus
import function any_click_move (int x, int y, CharacterDirection dir);
//! lässt den Spieler nur an die Position laufen, wenn die aktuelle Aktion 'eActWalk' ist
import function any_click_walk (int x, int y, CharacterDirection dir);
//! lässt den Spieler nur an die Position laufen, wenn die aktuelle Aktion 'eActLookat' ist
import function any_click_walk_look (int x, int y, CharacterDirection dir, String lookat);

//! normale Türenfunktion
/*! zeigt die Tür im geöffneten oder geschlossenen Zustand an, je nach Wert der übergebenen GlobalInt
		\param GI die zu verwendende GlobalInt
		\param *objekt das anzuzeigende oder zu verbergende Türenobjekt 
		\param x horizontale Position auf dem Bildschirm
		\param y vertiakle Position auf dem Bildschirm
		\param dir Die Richtung, in die der Spieler schaut, bevor die Tür geöffnet oder geschlossen wird
		\param nr_room der neue Raum, in den der Spiueler wechselt
		\param nr_x horizontale Position auf dem Bildschirm im neuen Raum
		\param nr_y vertiakle Position auf dem Bildschirm im neuen Raum
		\param nr_dir die Richtung in die der Spieler im neuen Raum schaut */
import function any_click_on_door (int GI, Object *objekt, int x, int y, CharacterDirection dir, int nr_room, int nr_x, int nr_y, CharacterDirection nr_dir);
//! setzt die Türenrückmeldungen für das Anschauen, für eine gesperrte Tür und für ein falsches Item zum Aufsperren
import function SetDoorStrings (String lookat, String islocked, String wrongitem);

//! erweiterte Türen-Aktion
import function any_click_on_door_special (int GI, Object *objekt, int x, int y, CharacterDirection dir, int nr_room, int nr_x, int nr_y, CharacterDirection nr_dir, int opensound, int closesound, int key, int closevalue);
import function any_click_on_light_switch (int hotspot, int x, int y, CharacterDirection dir);
import function any_click_use_inv (int item, int x, int y, CharacterDirection dir);
//! lässt den Spieler an die angegebene Position laufen, den Gegenstand anschauen und bei gewählter eActPickup-Aktion danach ins Inventar aufnehmen
import function any_click_walk_look_pick (int x, int y, CharacterDirection dir, string lookat, Object *object, InventoryItem *item, int GI, int sound);

//! veraltet (obsolet)
import function SetWalkTo (int x, int y, CharacterDirection dir);
//! veraltet (obsolet)
import function MovedTo ();
//! veraltet (obsolet)
import function WalkedToLookedAt (string lookat);
//! veraltet (obsolet)
import function UsedInvItem (int item);
//! veraltet (obsolet)
import function WalkedToLookedAtPickedUp (string lookat, Object *object, InventoryItem *item, int GI, int sound);  


// --- DisplaySpeechbackground functions ---
import function qDisplaySpeech(Character *CharID, String message);
import function qStopSpeech();
import function qIsTalking();
import String   Delay(int time);
import function qSkipCurrentMessage();

enum eColor
{
	eColRed, 
	eColBlue, 
	eColGreen, 
	eColCyan, 
	eColYellow, 
	eColViolett, 
	eColRosa, 
	eColWhite, 
	eColOrange, 
};

enum eLanguage
{
	eGerman, 
	eEnglish, 
};
