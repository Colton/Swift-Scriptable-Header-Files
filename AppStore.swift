/*
 * AppStore.h
 */
import AppKit
import ScriptingBridge
@objc enum AppStoreSavo: NSInteger {
	case AppStoreSavoAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
	case AppStoreSavoNo = 0x6e6f2020 /* Do not save the file. */
	case AppStoreSavoYes = 0x79657320 /* Save the file. */
};
@objc enum AppStoreEnum: NSInteger {
	case AppStoreEnumStandard = 0x6c777374 /* Standard PostScript error handling */
	case AppStoreEnumDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: AppStoreSavo, savingIn: NSURL)
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
@objc protocol AppStoreItem {
	optional var properties: NSDictionary {get set}
// All of the object"s properties.
}
extension SBObject: AppStoreItem{}
// An application"s top level scripting object.
@objc protocol AppStoreApplication {
	optional func documents() -> SBElementArray<AppStoreDocument *>
	optional func windows() -> SBElementArray<AppStoreWindow *>
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var name: NSString {get}
// The name of the application.
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSURL) -> AppStoreDocument
// Open an object.
	optional func print(x: NSURL, printDialog: Bool, withProperties: AppStorePrintSettings)
// Print an object.
	optional func quitSaving(saving: AppStoreSavo)
// Quit an application.
}
extension SBApplication: AppStoreApplication{}
// A color.
@objc protocol AppStoreColor: AppStoreItem {
}
extension SBObject: AppStoreColor{}
// A document.
@objc protocol AppStoreDocument: AppStoreItem {
	optional var modified: Bool {get}
// Has the document been modified since the last save?
	optional var name: NSString {get set}
// The document"s name.
	optional var path: NSString {get set}
// The document"s path.
}
extension SBObject: AppStoreDocument{}
// A window.
@objc protocol AppStoreWindow: AppStoreItem {
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Whether the window has a close box.
	optional var document: AppStoreDocument {get}
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
extension SBObject: AppStoreWindow{}
/*
 * Text Suite
 */
// This subdivides the text into chunks that all have the same attributes.
@objc protocol AppStoreAttributeRun: AppStoreItem {
	optional func attachments() -> SBElementArray<AppStoreAttachment *>
	optional func attributeRuns() -> SBElementArray<AppStoreAttributeRun *>
	optional func characters() -> SBElementArray<AppStoreCharacter *>
	optional func paragraphs() -> SBElementArray<AppStoreParagraph *>
	optional func words() -> SBElementArray<AppStoreWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: AppStoreAttributeRun{}
// This subdivides the text into characters.
@objc protocol AppStoreCharacter: AppStoreItem {
	optional func attachments() -> SBElementArray<AppStoreAttachment *>
	optional func attributeRuns() -> SBElementArray<AppStoreAttributeRun *>
	optional func characters() -> SBElementArray<AppStoreCharacter *>
	optional func paragraphs() -> SBElementArray<AppStoreParagraph *>
	optional func words() -> SBElementArray<AppStoreWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: AppStoreCharacter{}
// This subdivides the text into paragraphs.
@objc protocol AppStoreParagraph: AppStoreItem {
	optional func attachments() -> SBElementArray<AppStoreAttachment *>
	optional func attributeRuns() -> SBElementArray<AppStoreAttributeRun *>
	optional func characters() -> SBElementArray<AppStoreCharacter *>
	optional func paragraphs() -> SBElementArray<AppStoreParagraph *>
	optional func words() -> SBElementArray<AppStoreWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: AppStoreParagraph{}
// Rich (styled) text
@objc protocol AppStoreText: AppStoreItem {
	optional func attachments() -> SBElementArray<AppStoreAttachment *>
	optional func attributeRuns() -> SBElementArray<AppStoreAttributeRun *>
	optional func characters() -> SBElementArray<AppStoreCharacter *>
	optional func paragraphs() -> SBElementArray<AppStoreParagraph *>
	optional func words() -> SBElementArray<AppStoreWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: AppStoreText{}
// Represents an inline text attachment.  This class is used mainly for make commands.
@objc protocol AppStoreAttachment: AppStoreText {
	optional var fileName: NSString {get set}
// The path to the file for the attachment
}
extension SBObject: AppStoreAttachment{}
// This subdivides the text into words.
@objc protocol AppStoreWord: AppStoreItem {
	optional func attachments() -> SBElementArray<AppStoreAttachment *>
	optional func attributeRuns() -> SBElementArray<AppStoreAttributeRun *>
	optional func characters() -> SBElementArray<AppStoreCharacter *>
	optional func paragraphs() -> SBElementArray<AppStoreParagraph *>
	optional func words() -> SBElementArray<AppStoreWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: AppStoreWord{}
/*
 * Type Definitions
 */
@objc protocol AppStorePrintSettings {
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
	optional var errorHandling: AppStoreEnum {get set}
// how errors are handled
	optional var faxNumber: NSString {get set}
// for fax number
	optional var targetPrinter: NSString {get set}
// for target printer
}
extension SBObject: AppStorePrintSettings{}
