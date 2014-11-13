// Script header for module 'ChangePlayer'

//! fügt einen Spieler zu den wechselbaren Spielfiguren hinzu
import bool AddChangePlayer(this Character *);
//! entfernt einen Spieler von den wechselbaren Spielfiguren
import bool RemoveChangePlayer(this Character *);
//! setzt die aktuelle Figur als Spieler und entfernt die anderen aus der wählbaren Liste
import bool SetPlayerCC(this Character *);
//! setzt den gewählten Spieler als aktuellen spielbaren Charakter
/*! befinden sich beide Charaktere im selben Raum, dann wird in diesem hin- und hergescrollt */
import bool SetPlayer(this Character *);
//! wechselt zum aktuellen Charakter (entspricht einem Klick auf einen der zwei Buttons)
import bool SetChangePlayer(this Character *);

//! setzt diese drei Spielfiguren als auswählbare zum Wechseln bereit gehaltene Figuren
import function SetPlayers(Character *cha, Character *ch1, Character *ch2);
//! frägt ab, ob man zur definierten Figur wechseln kann
import bool ChangeableTo(Character *cha);
//! frägt die Anzahl der spielbaren Charakter ab
import int ListLength();
//! führt einen Klick auf den oberen Button aus.
import int UpperButton();
//! führt einen Klick auf den unteren Button aus.
import int LowerButton();
// Aufruf in game_start->SetChangeablePlayers
import bool AddPlayerToSwitch(this Character*,  int pictureid);



// veraltete Funktionen (obsolete functions)
//! veraltet (obsolete)
import bool AddChangePlayer(Character *cha);
//! veraltet (obsolete)
import bool RemoveChangePlayer(Character *cha);
//! veraltet (obsolete)
import bool SetPlayerCC(Character *cha);
//! veraltet (obsolete)
import bool SetPlayer(int charid);
//! veraltet (obsolete)
import bool SetChangePlayer(Character *cha);
