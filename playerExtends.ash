// --- FaceDirection ---

/*! veraltet (obsolete) */
#define DIR_UP    0  //!< veraltet (obsolete)
/*! veraltet (obsolete) */
#define DIR_LEFT  1  //!< veraltet (obsolete)
/*! veraltet (obsolete) */
#define DIR_DOWN  2  //!< veraltet (obsolete)
/*! veraltet (obsolete) */
#define DIR_RIGHT 3  //!< veraltet (obsolete)
/*! veraltet (obsolete) */
#define DIR_AUTO  4  //!< veraltet (obsolete)

//! l�sst den Spieler in eine bestimmte Richtung schauen \see FaceDirection
/*! l�sst den Spieler in eine bestimmte Richtung schauen \see FaceDirection */
enum eDirection
{
	/*! l�sst den Charakter nach oben schauen */
	eDirUp    = 0, 
	/*! l�sst den Charakter nach links schauen */
	eDirLeft  = 1, 
	/*! l�sst den Charakter nach unten schauen */
	eDirDown  = 2, 
	/*! l�sst den Charakter nach rechts schauen */
	eDirRight = 3, 
	/*! only for GoToCharacter */
	eDirAuto  = 4, // $AUTOCOMPLETEIGNORE$
};

//! noch ungenutzt
/*! setzt den Spieler an die Seite eines Charakters (noch ungenutzt) */
enum Side
{
	eSideAuto   = 0, 
	eSideLeft   = 4, 
	eSideRight  = 2, 
	eSideUpper  = 1, 
	eSideLower  = 3, 
};

//! l�sst den Spieler in die gew�hlte Richtung schauen
/*! l�sst den Spieler in die gew�hlte Richtung schauen
		\param Character markiert diese Funktion als extender-Funktion
		\param dir l�sst den Spieler in die Richtung \see dir schauen
		\return meldet zur�ck, ob der �bergeben Parameter g�ltig war und der Richtungswechsel erfolgte */
import bool FaceDirection (this Character *, eDirection dir);
//! Transferiert den Spieler in den aktuell gew�hlten Raum, an die Stelle x,y und l��sst ihn in eine bestimmte Richtung schauen
/*! Transferiert den Spieler in den aktuell gew�hlten Raum, an die Stelle x,y und l��sst ihn in eine bestimmte Richtung schauen
		\param Character markiert diese Funktion als extender-Funktion
		\param room In diesen Raum wird der Spieler gesetzt
		\param x x-Position
		\param y y-Position
		\param dir l�sst den Spieler in die Richtung  schauen
		\return (keine spezielle R�ckmeldung (immer 1)
		\see dir
		*/
import function EnterRoom (this Character *,  int room, int x, int y, eDirection dir);


//! veraltet (obsolete)
/*! veraltet (obsolete) */
import bool FaceDirection (int charac, eDirection dir);
//! veraltet (obsolete)
/*! veraltet (obsolete) */
import function EnterRoom (int room, int x, int y, eDirection dir);
