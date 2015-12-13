/*
 * Preview.h
 */
import AppKit
import ScriptingBridge
@objc enum PreviewSavo: NSInteger {
	case PreviewSavoAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
	case PreviewSavoNo = 0x6e6f2020 /* Do not save the file. */
	case PreviewSavoYes = 0x79657320 /* Save the file. */
};
@objc enum PreviewEnum: NSInteger {
	case PreviewEnumStandard = 0x6c777374 /* Standard PostScript error handling */
	case PreviewEnumDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: PreviewSavo, savingIn: NSURL)
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
@objc protocol PreviewItem {
	optional var properties: NSDictionary {get set}
// All of the object"s properties.
}
extension SBObject: PreviewItem{}
// An application"s top level scripting object.
@objc protocol PreviewApplication {
	optional func documents() -> SBElementArray<PreviewDocument *>
	optional func windows() -> SBElementArray<PreviewWindow *>
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var name: NSString {get}
// The name of the application.
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSURL) -> PreviewDocument
// Open an object.
	optional func print(x: NSURL, printDialog: Bool, withProperties: PreviewPrintSettings)
// Print an object.
	optional func quitSaving(saving: PreviewSavo)
// Quit an application.
}
extension SBApplication: PreviewApplication{}
// A color.
@objc protocol PreviewColor: PreviewItem {
}
extension SBObject: PreviewColor{}
// A document.
@objc protocol PreviewDocument: PreviewItem {
	optional var modified: Bool {get}
// Has the document been modified since the last save?
	optional var name: NSString {get set}
// The document"s name.
	optional var path: NSString {get set}
// The document"s path.
}
extension SBObject: PreviewDocument{}
// A window.
@objc protocol PreviewWindow: PreviewItem {
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Whether the window has a close box.
	optional var document: PreviewDocument {get}
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
extension SBObject: PreviewWindow{}
/*
 * Text Suite
 */
// This subdivides the text into chunks that all have the same attributes.
@objc protocol PreviewAttributeRun: PreviewItem {
	optional func attachments() -> SBElementArray<PreviewAttachment *>
	optional func attributeRuns() -> SBElementArray<PreviewAttributeRun *>
	optional func characters() -> SBElementArray<PreviewCharacter *>
	optional func paragraphs() -> SBElementArray<PreviewParagraph *>
	optional func words() -> SBElementArray<PreviewWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: PreviewAttributeRun{}
// This subdivides the text into characters.
@objc protocol PreviewCharacter: PreviewItem {
	optional func attachments() -> SBElementArray<PreviewAttachment *>
	optional func attributeRuns() -> SBElementArray<PreviewAttributeRun *>
	optional func characters() -> SBElementArray<PreviewCharacter *>
	optional func paragraphs() -> SBElementArray<PreviewParagraph *>
	optional func words() -> SBElementArray<PreviewWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: PreviewCharacter{}
// This subdivides the text into paragraphs.
@objc protocol PreviewParagraph: PreviewItem {
	optional func attachments() -> SBElementArray<PreviewAttachment *>
	optional func attributeRuns() -> SBElementArray<PreviewAttributeRun *>
	optional func characters() -> SBElementArray<PreviewCharacter *>
	optional func paragraphs() -> SBElementArray<PreviewParagraph *>
	optional func words() -> SBElementArray<PreviewWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: PreviewParagraph{}
// Rich (styled) text
@objc protocol PreviewText: PreviewItem {
	optional func attachments() -> SBElementArray<PreviewAttachment *>
	optional func attributeRuns() -> SBElementArray<PreviewAttributeRun *>
	optional func characters() -> SBElementArray<PreviewCharacter *>
	optional func paragraphs() -> SBElementArray<PreviewParagraph *>
	optional func words() -> SBElementArray<PreviewWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: PreviewText{}
// Represents an inline text attachment.  This class is used mainly for make commands.
@objc protocol PreviewAttachment: PreviewText {
	optional var fileName: NSString {get set}
// The path to the file for the attachment
}
extension SBObject: PreviewAttachment{}
// This subdivides the text into words.
@objc protocol PreviewWord: PreviewItem {
	optional func attachments() -> SBElementArray<PreviewAttachment *>
	optional func attributeRuns() -> SBElementArray<PreviewAttributeRun *>
	optional func characters() -> SBElementArray<PreviewCharacter *>
	optional func paragraphs() -> SBElementArray<PreviewParagraph *>
	optional func words() -> SBElementArray<PreviewWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: PreviewWord{}
/*
 * Type Definitions
 */
@objc protocol PreviewPrintSettings {
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
	optional var errorHandling: PreviewEnum {get set}
// how errors are handled
	optional var faxNumber: NSString {get set}
// for fax number
	optional var targetPrinter: NSString {get set}
// for target printer
}
extension SBObject: PreviewPrintSettings{}
