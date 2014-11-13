// Script header for module 'Credits'
//
// Author: Andrew MacCormack (SSH)
//   Please use the PM function on the AGS forums to contact
//   me about problems with this module
// 
// Abstract: Provides scrolling credits of text or images
// Dependencies:
//
//   AGS 2.71RC2 or later
//
// Functions:
// 	 Credits[n].AddTitle(String t, optional int x, optional int font, optional int colour)
//      This adds a line to the credits in the "Title" style, with x position,
//      font and colour optional overrides.
//      Properties DefaultTitleX, DefaultTitleFont and DefaultTitleColour set the
//      charactersitics of the Title style.
//
//      eCreditCentred can be used as x for centered text
//      eCreditXDefault can be used as x to pick up the default x position for titles
//      eCreditFontDefault can be used for font to pick up the default font
//      eCreditColourDefault can be used for colour to pick up the default colour
//
//   Credits[n].AddCredit(String t, optional int x, optional int font, optional int colour);
//      This adds a line to the credits in the "Credit" style, with x position,
//      font and colour optional overrides.
//      Properties DefaultCreditX, DefaultCreditFont and DefaultCreditColour set the
//      charactersitics of the Credit style.
//
//      enumerated constants can be used as with AddTitle
//
//   Credits[n].AddImage(int sprite, optional int x, optional int valign)
//      This adds an image to the credits, with optional x position and alignment
//      specified. x defaults to Centred, valign defaults to "next credit comes at
//      bottom". Specifying a number for valign will make the next credit line appear
//      that many pixels below the top of the image.
//      
//   Credits[n].Run();
//      This starts the credit sequence off rolling. The credits will appear at Y
//      position Credit[n].StartY and scroll up until they pass Credit[n].MinY. These 
//      properties default to the top and bottom of the screen.
//
//   Credits[n].Pause();
//      This will pause a running credit scroller or restart a paused one.
//
//   Credits[n].IsRunning();
//      This function returns a value of type CreditRunning_t, which will be equal to
//      eCreditFinished when the sequence has finished.
//
//   Credits[n].Stop();
//      Terminate credit sequence early: e.g. skipping or abort, etc.
//
// Configuration:
//   The Credits module operates in one of two modes:
//     Credits[n].CreditStyle=eCreditScrolling; //  (Default)
//   or
//     Credits[n].CreditStyle=eCreditStatic; //  (Default)
//
//   Scrolling Mode:
//
//   The speed of scrolling can be configured with Credit[n].Delay. This determines
//   the number of cycles between each pixel moves by the scrolling credits.
//
//   The spacing between text lines can be changed by using Credits[n].LineSeparation
//   which sets the number of pixels after a text line before the next credit item.
//
//   Static Mode:
//
//   Static mode has a variety of transitions for the text or image entering and 
//   leaving the screen:
//     eCreditSimple       Instant appearing or disappearing
//     eCreditTypewriter   (text appear only) Typewriter simulation
//     eCreditSlideLeft    Slide text in from/out to the left of screen
//     eCreditSlideRight   Slide text in from/out to the right of screen
//     eCreditSlideTop     Slide text in from/out to the top of screen
//     eCreditSlideBottom  Slide text in from/out to the bottom of screen
//
//   In the middle of a credit, a '[' means a line break, but text will be left-aligned
//   within the same credit, so centering can be messed up by this.
//
//   Also in static mode, a '[' character at the end of a credit line means that the
//   line will not disappear before the next line arrives. All such lines will be cleared
//   by the next line with no special character at the end. You can manually clear any
//   such uncleared lines by putting a '[' as the first character of a line. If you wish
//   to have a linebreak at the beginning of text, preceed it with a space: e.g.
//   " [my text".
//
//   By default, the ']' character can also be used at the end of a line in a similar
//   way, except that such lines are not cleared by following lines with no special
//   characters: a manual clear by using an initial ']' must be done to clear the line.
//
//   By changing the Credits[n].StaticSpecialChars variable, you can add extra characters
//   with the same behaviour, each one only being cleared by the special character 
//   appearing at the start of a following line. Multiple special characters may appear
//   at the start of a line until the first non-special character. Only one special 
//   character at the end of the line applies, however.
//     
//   General:
//
//   Credits come in two "styles": titles and credits. The default settings for these
//   can be configured separately and the functions AddCredit and AddTitle use the
//   appropriate templates.
//
//   The DefaultCreditN and DefaultTitleN properties set those templates, where N can
//   be X, Colour, Font and in the case of static credits, Y, StartTransition and 
//   EndTransition.
//
//   More advanced configuration involves changing CREDIT_MAX_LINES to have more lines
//   per credit sequence, changing CREDIT_MAX_SEQUENCES to have more different 
//   sequences and if you for some reason want the string "<img>" as a credit, change
//   CREDIT_IMAGE to be some other string that you do not use.
//
//   The property Credits[n].JumpToRoomAtEnd can be set to a room number or -1 if no
//   room jump is required at the end of the credits.
//
// Example:
//   Credits[0].DefaultCreditFont=3;
//   Credits[0].DefaultTitleFont=3;
//   Credits[0].DefaultTitleColour=65000;
//   Credits[0].DefaultCreditColour=15;
//   Credits[0].Delay=1;
//
//   Credits[0].AddTitle("Scripting by");
//   Credits[0].AddCredit("SSH");
//   Credits[0].AddImage(12, eCreditCentred, eCreditAlignBelow);
//   Credits[0].AddTitle("Credit Module by");
//   Credits[0].AddCredit("SSH again!");
//   Credits[0].Run();
//
// Caveats:
//   If more lines of credit are onscreen than AGS allows overlays, then this module
//   will crash. Use a bigger font.
//   Not extensively tested: please report bugs on the AGS forums
//   
// Revision History:
//
// 22 Sep 05: v1.0  First release of Scrolling Credits module
// 26 Oct 05: v1.1  First release of full Credits module
// 26 Oct 05: v1.11 Added word wrap to typewriter mode
// 27 Oct 05: v1.12 Fixed debug code left in and 800x600 compatibility
// 28 Feb 06: v1.13 Added property to jump to new room at end of credits
// 18 Apr 06: v1.14 Added Stop function to allow credit termination
// 25 Jul 06: v1.15 Tried to fix the problems with simple start transitions
// 26 Jul 06: v1.16	Another attempt at fixing top, etc.
// 27 Jul 06: v1.17 Added extra, programmable, static special characters
// 16 Feb 07: v1.18 Added translation support and use new strings only
// 26 Oct 07: v1.19 Actually made translations work!
//
// Licence:
//
//   Credits AGS script module
//   Copyright (C) 2005-2007 Andrew MacCormack
//
//   This library is free software; you can redistribute it and/or
//   modify it under the terms of the GNU Lesser General Public
//   License as published by the Free Software Foundation; either
//   version 2.1 of the License, or (at your option) any later version.
//
//   This library is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//   Lesser General Public License for more details.
//
//   You should have received a copy of the GNU Lesser General Public
//   License along with this library; if not, write to the Free Software
//   Foundation, Inc, 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
//=========================================================

#define CREDIT_MAX_LINES 100
#define CREDIT_MAX_SEQUENCES 4
#define CREDIT_IMAGE "<img>"
#define CREDIT_DEFAULTSTATICSPECIAL "[]"

// Fake enumerations and make them autocomplete
#define eCreditCentred -1  
// import int eCreditCentred;
#define eCreditXDefault -2  
#define eCreditYDefault -2  
// import int eCreditXDefault;
// import int eCreditYDefault;
#define eCreditFontDefault -1  
// import int eCreditFontDefault;
#define eCreditColourDefault -1 
// import int eCreditColourDefault;
#define eCreditAlignBelow -1 
// import int  eCreditAlignBelow;
#define eCreditTransDefault -1
// import int  eCreditTransDefault;

enum CreditRunning_t { eCreditWait, eCreditRunning, eCreditFinished};
enum CreditStyle_t { eCreditScrolling, eCreditStatic };
enum CreditTransition_t {eCreditSimple=0, eCreditTypewriter, 
				eCreditSlideLeft, eCreditSlideRight, eCreditSlideTop, eCreditSlideBottom };
// Fades not possible with overlays, because of lack of transparency
// However we could maybe take a colour to fade to and gradually morph the RGB values
// to the next colour?


struct CreditSequence {
  import function AddTitle(String t, int x=-2, int font=-1, int colour=-1, int y=-2, CreditTransition_t start=-1, CreditTransition_t end=-1);
  import function AddCredit(String t, int x=-2, int font=-1, int colour=-1, int y=-2, CreditTransition_t start=-1, CreditTransition_t end=-1);
  import function AddImage(int sprite, int x=-1, int valign=-1, CreditTransition_t start=-1, CreditTransition_t end=-1);
  
  import function Run();
	import function Pause();
	import function IsRunning();
	import function Stop();
	
  int LineSeparation;
  int Delay;
  int DefaultTitleX;
  int DefaultTitleY;
  int DefaultTitleFont;
  int DefaultTitleColour;
  CreditTransition_t DefaultTitleStartTransition;
  CreditTransition_t DefaultTitleEndTransition;
  int DefaultCreditX;
  int DefaultCreditY;
  int DefaultCreditFont;
  int DefaultCreditColour;
  CreditTransition_t DefaultCreditStartTransition;
  CreditTransition_t DefaultCreditEndTransition;
  CreditTransition_t DefaultImageStartTransition;
  CreditTransition_t DefaultImageEndTransition;
  int StartY;
  int MinY;
  CreditStyle_t CreditStyle;
  int SpaceSound;
  int TypeSound;
  int EOLSound;
  int TypeDelay;
  int TypeRandom;
  int SlideSpeed;
  int ExitDelay;
  int InterDelay;
  int JumpToRoomAtEnd;
  String StaticSpecialChars;

	// Not protected, but please don't touch or use
  import function rep_ex();
	import function Reset(int id=-1);

  // Internal stuff
  protected import function find_free();
  protected import function scroll();
  protected import function checkline();
  protected import function update();
  protected import function type();
  protected import function endprev(int n, char c='[');
  protected import function cleartrans(int inc);
  protected import String wordwrap(String s, int font, int width);
  protected String line[CREDIT_MAX_LINES];
  protected int x_pos[CREDIT_MAX_LINES];
  protected int fontimage[CREDIT_MAX_LINES];
  protected int colour[CREDIT_MAX_LINES];
  protected Overlay *ol[CREDIT_MAX_LINES];
  protected int oh[CREDIT_MAX_LINES];
  protected int ow[CREDIT_MAX_LINES];
  protected CreditTransition_t starttrans[CREDIT_MAX_LINES];
  protected CreditTransition_t endtrans[CREDIT_MAX_LINES];
  protected int y_pos[CREDIT_MAX_LINES];
	protected CreditRunning_t Running;
  protected int maxy;
  protected int nextline;
  protected int timer;
  protected int ID;
  protected String typet;
};

import CreditSequence Credits[CREDIT_MAX_SEQUENCES];
