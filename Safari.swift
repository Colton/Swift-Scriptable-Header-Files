/*
 * Safari.h
 */
import AppKit
import ScriptingBridge
@objc enum SafariSavo: NSInteger {
	case SafariSavoAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
	case SafariSavoNo = 0x6e6f2020 /* Do not save the file. */
	case SafariSavoYes = 0x79657320 /* Save the file. */
};
@objc enum SafariEnum: NSInteger {
	case SafariEnumStandard = 0x6c777374 /* Standard PostScript error handling */
	case SafariEnumDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: SafariSavo, savingIn: NSURL)
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
	optional func emailContentsOf(of: SafariTab)
// Emails the contents of a tab.
	optional func searchTheWebFor(`for`: NSString, `in`: SafariTab)
// Searches the web using Safari"s current search provider.
/*
 * Standard Suite
 */
// A scriptable object.
@objc protocol SafariItem {
	optional var properties: NSDictionary {get set}
// All of the object"s properties.
}
extension SBObject: SafariItem{}
// An application"s top level scripting object.
@objc protocol SafariApplication {
	optional func documents() -> SBElementArray<SafariDocument *>
	optional func windows() -> SBElementArray<SafariWindow *>
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var name: NSString {get}
// The name of the application.
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSURL) -> SafariDocument
// Open an object.
	optional func print(x: NSURL, printDialog: Bool, withProperties: SafariPrintSettings)
// Print an object.
	optional func quitSaving(saving: SafariSavo)
// Quit an application.
	optional func addReadingListItem(x: NSString, andPreviewText: NSString, withTitle: NSString)
// Add a new Reading List item with the given URL. Allows a custom title and preview text to be specified.
	optional func doJavaScript(x: NSString, `in`: SafariTab) -> AnyObject
// Applies a string of JavaScript code to a document.
	optional func showBookmarks()
// Shows Safari"s bookmarks.
}
extension SBApplication: SafariApplication{}
// A color.
@objc protocol SafariColor: SafariItem {
}
extension SBObject: SafariColor{}
// A document.
@objc protocol SafariDocument: SafariItem {
	optional var modified: Bool {get}
// Has the document been modified since the last save?
	optional var name: NSString {get set}
// The document"s name.
	optional var path: NSString {get set}
// The document"s path.
}
extension SBObject: SafariDocument{}
// A window.
@objc protocol SafariWindow: SafariItem {
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Whether the window has a close box.
	optional var document: SafariDocument {get}
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
extension SBObject: SafariWindow{}
/*
 * Text Suite
 */
// This subdivides the text into chunks that all have the same attributes.
@objc protocol SafariAttributeRun: SafariItem {
	optional func attachments() -> SBElementArray<SafariAttachment *>
	optional func attributeRuns() -> SBElementArray<SafariAttributeRun *>
	optional func characters() -> SBElementArray<SafariCharacter *>
	optional func paragraphs() -> SBElementArray<SafariParagraph *>
	optional func words() -> SBElementArray<SafariWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: SafariAttributeRun{}
// This subdivides the text into characters.
@objc protocol SafariCharacter: SafariItem {
	optional func attachments() -> SBElementArray<SafariAttachment *>
	optional func attributeRuns() -> SBElementArray<SafariAttributeRun *>
	optional func characters() -> SBElementArray<SafariCharacter *>
	optional func paragraphs() -> SBElementArray<SafariParagraph *>
	optional func words() -> SBElementArray<SafariWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: SafariCharacter{}
// This subdivides the text into paragraphs.
@objc protocol SafariParagraph: SafariItem {
	optional func attachments() -> SBElementArray<SafariAttachment *>
	optional func attributeRuns() -> SBElementArray<SafariAttributeRun *>
	optional func characters() -> SBElementArray<SafariCharacter *>
	optional func paragraphs() -> SBElementArray<SafariParagraph *>
	optional func words() -> SBElementArray<SafariWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: SafariParagraph{}
// Rich (styled) text
@objc protocol SafariText: SafariItem {
	optional func attachments() -> SBElementArray<SafariAttachment *>
	optional func attributeRuns() -> SBElementArray<SafariAttributeRun *>
	optional func characters() -> SBElementArray<SafariCharacter *>
	optional func paragraphs() -> SBElementArray<SafariParagraph *>
	optional func words() -> SBElementArray<SafariWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
	optional func addReadingListItemAndPreviewText(andPreviewText: NSString, withTitle: NSString)
// Add a new Reading List item with the given URL. Allows a custom title and preview text to be specified.
	optional func doJavaScriptIn(`in`: SafariTab) -> AnyObject
// Applies a string of JavaScript code to a document.
}
extension SBObject: SafariText{}
// Represents an inline text attachment.  This class is used mainly for make commands.
@objc protocol SafariAttachment: SafariText {
	optional var fileName: NSString {get set}
// The path to the file for the attachment
}
extension SBObject: SafariAttachment{}
// This subdivides the text into words.
@objc protocol SafariWord: SafariItem {
	optional func attachments() -> SBElementArray<SafariAttachment *>
	optional func attributeRuns() -> SBElementArray<SafariAttributeRun *>
	optional func characters() -> SBElementArray<SafariCharacter *>
	optional func paragraphs() -> SBElementArray<SafariParagraph *>
	optional func words() -> SBElementArray<SafariWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: SafariWord{}
/*
 * Safari suite
 */
// A Safari document representing the active tab in a window.
@objc protocol SafariDocument {
	optional var source: NSString {get}
// The HTML source of the web page currently loaded in the document.
	optional var text: SafariText {get}
// The text of the web page currently loaded in the document. Modifications to text aren"t reflected on the web page.
	optional var URL: NSString {get set}
// The current URL of the document.
}
extension SBObject: SafariDocument{}
// A Safari window tab.
@objc protocol SafariTab: SafariItem {
	optional var index: NSInteger {get}
// The index of the tab, ordered left to right.
	optional var name: NSString {get}
// The name of the tab.
	optional var source: NSString {get}
// The HTML source of the web page currently loaded in the tab.
	optional var text: SafariText {get}
// The text of the web page currently loaded in the tab. Modifications to text aren"t reflected on the web page.
	optional var URL: NSString {get set}
// The current URL of the tab.
	optional var visible: Bool {get}
// Whether the tab is currently visible.
}
extension SBObject: SafariTab{}
// A Safari window.
@objc protocol SafariWindow {
	optional func tabs() -> SBElementArray<SafariTab *>
	optional var currentTab: SafariTab {get set}
// The current tab.
}
extension SBObject: SafariWindow{}
/*
 * Type Definitions
 */
@objc protocol SafariPrintSettings {
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
	optional var errorHandling: SafariEnum {get set}
// how errors are handled
	optional var faxNumber: NSString {get set}
// for fax number
	optional var targetPrinter: NSString {get set}
// for target printer
}
extension SBObject: SafariPrintSettings{}
