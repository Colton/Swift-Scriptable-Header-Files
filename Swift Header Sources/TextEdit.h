/*
 * TextEdit.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class TextEditItem, TextEditApplication, TextEditColor, TextEditDocument, TextEditWindow, TextEditAttributeRun, TextEditCharacter, TextEditParagraph, TextEditText, TextEditAttachment, TextEditWord, TextEditPrintSettings;

enum TextEditSavo {
	TextEditSavoAsk = 'ask ' /* Ask the user whether or not to save the file. */,
	TextEditSavoNo = 'no  ' /* Do not save the file. */,
	TextEditSavoYes = 'yes ' /* Save the file. */
};
typedef enum TextEditSavo TextEditSavo;

enum TextEditEnum {
	TextEditEnumStandard = 'lwst' /* Standard PostScript error handling */,
	TextEditEnumDetailed = 'lwdt' /* print a detailed report of PostScript errors */
};
typedef enum TextEditEnum TextEditEnum;

@protocol TextEditGenericMethods

- (void) closeSaving:(TextEditSavo)saving savingIn:(NSURL *)savingIn;  // Close an object.
- (void) delete;  // Delete an object.
- (void) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy object(s) and put the copies at a new location.
- (BOOL) exists;  // Verify if an object exists.
- (void) moveTo:(SBObject *)to;  // Move object(s) to a new location.
- (void) saveAs:(NSString *)as in:(NSURL *)in_;  // Save an object.

@end



/*
 * Standard Suite
 */

// A scriptable object.
@interface TextEditItem : SBObject <TextEditGenericMethods>

@property (copy) NSDictionary *properties;  // All of the object's properties.


@end

// An application's top level scripting object.
@interface TextEditApplication : SBApplication

- (SBElementArray<TextEditDocument *> *) documents;
- (SBElementArray<TextEditWindow *> *) windows;

@property (readonly) BOOL frontmost;  // Is this the frontmost (active) application?
@property (copy, readonly) NSString *name;  // The name of the application.
@property (copy, readonly) NSString *version;  // The version of the application.

- (TextEditDocument *) open:(NSURL *)x;  // Open an object.
- (void) print:(NSURL *)x printDialog:(BOOL)printDialog withProperties:(TextEditPrintSettings *)withProperties;  // Print an object.
- (void) quitSaving:(TextEditSavo)saving;  // Quit an application.

@end

// A color.
@interface TextEditColor : TextEditItem


@end

// A document.
@interface TextEditDocument : TextEditItem

@property (readonly) BOOL modified;  // Has the document been modified since the last save?
@property (copy) NSString *name;  // The document's name.
@property (copy) NSString *path;  // The document's path.


@end

// A window.
@interface TextEditWindow : TextEditItem

@property NSRect bounds;  // The bounding rectangle of the window.
@property (readonly) BOOL closeable;  // Whether the window has a close box.
@property (copy, readonly) TextEditDocument *document;  // The document whose contents are being displayed in the window.
@property (readonly) BOOL floating;  // Whether the window floats.
- (NSInteger) id;  // The unique identifier of the window.
@property NSInteger index;  // The index of the window, ordered front to back.
@property (readonly) BOOL miniaturizable;  // Whether the window can be miniaturized.
@property BOOL miniaturized;  // Whether the window is currently miniaturized.
@property (readonly) BOOL modal;  // Whether the window is the application's current modal window.
@property (copy) NSString *name;  // The full title of the window.
@property (readonly) BOOL resizable;  // Whether the window can be resized.
@property (readonly) BOOL titled;  // Whether the window has a title bar.
@property BOOL visible;  // Whether the window is currently visible.
@property (readonly) BOOL zoomable;  // Whether the window can be zoomed.
@property BOOL zoomed;  // Whether the window is currently zoomed.


@end



/*
 * Text Suite
 */

// This subdivides the text into chunks that all have the same attributes.
@interface TextEditAttributeRun : TextEditItem

- (SBElementArray<TextEditAttachment *> *) attachments;
- (SBElementArray<TextEditAttributeRun *> *) attributeRuns;
- (SBElementArray<TextEditCharacter *> *) characters;
- (SBElementArray<TextEditParagraph *> *) paragraphs;
- (SBElementArray<TextEditWord *> *) words;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.


@end

// This subdivides the text into characters.
@interface TextEditCharacter : TextEditItem

- (SBElementArray<TextEditAttachment *> *) attachments;
- (SBElementArray<TextEditAttributeRun *> *) attributeRuns;
- (SBElementArray<TextEditCharacter *> *) characters;
- (SBElementArray<TextEditParagraph *> *) paragraphs;
- (SBElementArray<TextEditWord *> *) words;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.


@end

// This subdivides the text into paragraphs.
@interface TextEditParagraph : TextEditItem

- (SBElementArray<TextEditAttachment *> *) attachments;
- (SBElementArray<TextEditAttributeRun *> *) attributeRuns;
- (SBElementArray<TextEditCharacter *> *) characters;
- (SBElementArray<TextEditParagraph *> *) paragraphs;
- (SBElementArray<TextEditWord *> *) words;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.


@end

// Rich (styled) text
@interface TextEditText : TextEditItem

- (SBElementArray<TextEditAttachment *> *) attachments;
- (SBElementArray<TextEditAttributeRun *> *) attributeRuns;
- (SBElementArray<TextEditCharacter *> *) characters;
- (SBElementArray<TextEditParagraph *> *) paragraphs;
- (SBElementArray<TextEditWord *> *) words;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.


@end

// Represents an inline text attachment.  This class is used mainly for make commands.
@interface TextEditAttachment : TextEditText

@property (copy) NSString *fileName;  // The path to the file for the attachment


@end

// This subdivides the text into words.
@interface TextEditWord : TextEditItem

- (SBElementArray<TextEditAttachment *> *) attachments;
- (SBElementArray<TextEditAttributeRun *> *) attributeRuns;
- (SBElementArray<TextEditCharacter *> *) characters;
- (SBElementArray<TextEditParagraph *> *) paragraphs;
- (SBElementArray<TextEditWord *> *) words;

@property (copy) NSColor *color;  // The color of the first character.
@property (copy) NSString *font;  // The name of the font of the first character.
@property NSInteger size;  // The size in points of the first character.


@end



/*
 * TextEdit suite
 */

// TextEdit's top level scripting object.
@interface TextEditApplication (TextEditSuite)

- (SBElementArray<TextEditDocument *> *) documents;

@end

// A TextEdit document.
@interface TextEditDocument (TextEditSuite)

@property (copy) TextEditText *text;  // The text of the document.

@end



/*
 * Type Definitions
 */

@interface TextEditPrintSettings : SBObject <TextEditGenericMethods>

@property NSInteger copies;  // the number of copies of a document to be printed
@property BOOL collating;  // Should printed copies be collated?
@property NSInteger startingPage;  // the first page of the document to be printed
@property NSInteger endingPage;  // the last page of the document to be printed
@property NSInteger pagesAcross;  // number of logical pages laid across a physical page
@property NSInteger pagesDown;  // number of logical pages laid out down a physical page
@property (copy) NSDate *requestedPrintTime;  // the time at which the desktop printer should print the document
@property TextEditEnum errorHandling;  // how errors are handled
@property (copy) NSString *faxNumber;  // for fax number
@property (copy) NSString *targetPrinter;  // for target printer


@end

