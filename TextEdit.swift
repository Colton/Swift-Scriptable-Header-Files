/*
 * TextEdit.h
 */
import AppKit
import ScriptingBridge
@objc enum TextEditSavo: NSInteger {
	case TextEditSavoAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
	case TextEditSavoNo = 0x6e6f2020 /* Do not save the file. */
	case TextEditSavoYes = 0x79657320 /* Save the file. */
};
@objc enum TextEditEnum: NSInteger {
	case TextEditEnumStandard = 0x6c777374 /* Standard PostScript error handling */
	case TextEditEnumDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: TextEditSavo, savingIn: NSURL)
// Close an object.
	optional func delete()
// Delete an object.
	optional func duplicateTo(to: SBObject, withProperties: NSDictionary)
// Copy object(s) and put the copies at a new location.
	optional func exists() -> Bool
// Verify if an object exists.
	optional func moveTo(to: SBObject)
// Move object(s) to a new location.
	optional func saveAs(`as`: NSString, `in`: NSURL)
// Save an object.
/*
 * Standard Suite
 */
// A scriptable object.
@objc protocol TextEditItem {
	optional var properties: NSDictionary {get set}
// All of the object"s properties.
}
extension SBObject: TextEditItem{}
// An application"s top level scripting object.
@objc protocol TextEditApplication {
	optional func documents() -> SBElementArray<TextEditDocument *>
	optional func windows() -> SBElementArray<TextEditWindow *>
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var name: NSString {get}
// The name of the application.
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSURL) -> TextEditDocument
// Open an object.
	optional func print(x: NSURL, printDialog: Bool, withProperties: TextEditPrintSettings)
// Print an object.
	optional func quitSaving(saving: TextEditSavo)
// Quit an application.
}
extension SBApplication: TextEditApplication{}
// A color.
@objc protocol TextEditColor: TextEditItem {
}
extension SBObject: TextEditColor{}
// A document.
@objc protocol TextEditDocument: TextEditItem {
	optional var modified: Bool {get}
// Has the document been modified since the last save?
	optional var name: NSString {get set}
// The document"s name.
	optional var path: NSString {get set}
// The document"s path.
}
extension SBObject: TextEditDocument{}
// A window.
@objc protocol TextEditWindow: TextEditItem {
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Whether the window has a close box.
	optional var document: TextEditDocument {get}
// The document whose contents are being displayed in the window.
	optional var floating: Bool {get}
// Whether the window floats.
	optional func id() -> NSInteger
// The unique identifier of the window.
	optional var index: NSInteger {get set}
// The index of the window, ordered front to back.
	optional var miniaturizable: Bool {get}
// Whether the window can be miniaturized.
	optional var miniaturized: Bool {get set}
// Whether the window is currently miniaturized.
	optional var modal: Bool {get}
// Whether the window is the application"s current modal window.
	optional var name: NSString {get set}
// The full title of the window.
	optional var resizable: Bool {get}
// Whether the window can be resized.
	optional var titled: Bool {get}
// Whether the window has a title bar.
	optional var visible: Bool {get set}
// Whether the window is currently visible.
	optional var zoomable: Bool {get}
// Whether the window can be zoomed.
	optional var zoomed: Bool {get set}
// Whether the window is currently zoomed.
}
extension SBObject: TextEditWindow{}
/*
 * Text Suite
 */
// This subdivides the text into chunks that all have the same attributes.
@objc protocol TextEditAttributeRun: TextEditItem {
	optional func attachments() -> SBElementArray<TextEditAttachment *>
	optional func attributeRuns() -> SBElementArray<TextEditAttributeRun *>
	optional func characters() -> SBElementArray<TextEditCharacter *>
	optional func paragraphs() -> SBElementArray<TextEditParagraph *>
	optional func words() -> SBElementArray<TextEditWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: TextEditAttributeRun{}
// This subdivides the text into characters.
@objc protocol TextEditCharacter: TextEditItem {
	optional func attachments() -> SBElementArray<TextEditAttachment *>
	optional func attributeRuns() -> SBElementArray<TextEditAttributeRun *>
	optional func characters() -> SBElementArray<TextEditCharacter *>
	optional func paragraphs() -> SBElementArray<TextEditParagraph *>
	optional func words() -> SBElementArray<TextEditWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: TextEditCharacter{}
// This subdivides the text into paragraphs.
@objc protocol TextEditParagraph: TextEditItem {
	optional func attachments() -> SBElementArray<TextEditAttachment *>
	optional func attributeRuns() -> SBElementArray<TextEditAttributeRun *>
	optional func characters() -> SBElementArray<TextEditCharacter *>
	optional func paragraphs() -> SBElementArray<TextEditParagraph *>
	optional func words() -> SBElementArray<TextEditWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: TextEditParagraph{}
// Rich (styled) text
@objc protocol TextEditText: TextEditItem {
	optional func attachments() -> SBElementArray<TextEditAttachment *>
	optional func attributeRuns() -> SBElementArray<TextEditAttributeRun *>
	optional func characters() -> SBElementArray<TextEditCharacter *>
	optional func paragraphs() -> SBElementArray<TextEditParagraph *>
	optional func words() -> SBElementArray<TextEditWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: TextEditText{}
// Represents an inline text attachment.  This class is used mainly for make commands.
@objc protocol TextEditAttachment: TextEditText {
	optional var fileName: NSString {get set}
// The path to the file for the attachment
}
extension SBObject: TextEditAttachment{}
// This subdivides the text into words.
@objc protocol TextEditWord: TextEditItem {
	optional func attachments() -> SBElementArray<TextEditAttachment *>
	optional func attributeRuns() -> SBElementArray<TextEditAttributeRun *>
	optional func characters() -> SBElementArray<TextEditCharacter *>
	optional func paragraphs() -> SBElementArray<TextEditParagraph *>
	optional func words() -> SBElementArray<TextEditWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: TextEditWord{}
/*
 * TextEdit suite
 */
// TextEdit"s top level scripting object.
@objc protocol TextEditApplication {
	optional func documents() -> SBElementArray<TextEditDocument *>
}
extension SBObject: TextEditApplication{}
// A TextEdit document.
@objc protocol TextEditDocument {
	optional var text: TextEditText {get set}
// The text of the document.
}
extension SBObject: TextEditDocument{}
/*
 * Type Definitions
 */
@objc protocol TextEditPrintSettings {
	optional var copies: NSInteger {get set}
// the number of copies of a document to be printed
	optional var collating: Bool {get set}
// Should printed copies be collated?
	optional var startingPage: NSInteger {get set}
// the first page of the document to be printed
	optional var endingPage: NSInteger {get set}
// the last page of the document to be printed
	optional var pagesAcross: NSInteger {get set}
// number of logical pages laid across a physical page
	optional var pagesDown: NSInteger {get set}
// number of logical pages laid out down a physical page
	optional var requestedPrintTime: NSDate {get set}
// the time at which the desktop printer should print the document
	optional var errorHandling: TextEditEnum {get set}
// how errors are handled
	optional var faxNumber: NSString {get set}
// for fax number
	optional var targetPrinter: NSString {get set}
// for target printer
}
extension SBObject: TextEditPrintSettings{}
