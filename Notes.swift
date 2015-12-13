/*
 * Notes.h
 */
import AppKit
import ScriptingBridge
@objc enum NotesSaveOptions: NSInteger {
	case NotesSaveOptionsYes = 0x79657320 /* Save the file. */
	case NotesSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case NotesSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum NotesPrintingErrorHandling: NSInteger {
	case NotesPrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case NotesPrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
@objc enum NotesSaveableFileFormat: NSInteger {
	case NotesSaveableFileFormatNativeFormat = 0x6974656d /* Native format */
};
	optional func closeSaving(saving: NotesSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL, `as`: NotesSaveableFileFormat)
// Save a document.
	optional func printWithProperties(withProperties: NSDictionary, printDialog: Bool)
// Print a document.
	optional func delete()
// Delete an object.
	optional func duplicateTo(to: SBObject, withProperties: NSDictionary)
// Copy an object.
	optional func moveTo(to: SBObject)
// Move an object to a new location.
/*
 * Standard Suite
 */
// The application"s top-level scripting object.
@objc protocol NotesApplication {
	optional func documents() -> SBElementArray<NotesDocument *>
	optional func windows() -> SBElementArray<NotesWindow *>
	optional var name: NSString {get}
// The name of the application.
	optional var frontmost: Bool {get}
// Is this the active application?
	optional var version: NSString {get}
// The version number of the application.
	optional func open(x: AnyObject) -> AnyObject
// Open a document.
	optional func print(x: AnyObject, withProperties: NSDictionary, printDialog: Bool)
// Print a document.
	optional func quitSaving(saving: NotesSaveOptions)
// Quit the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
}
extension SBApplication: NotesApplication{}
// A document.
@objc protocol NotesDocument {
	optional var name: NSString {get}
// Its name.
	optional var modified: Bool {get}
// Has it been modified since the last save?
	optional var file: NSURL {get}
// Its location on disk, if it has one.
}
extension SBObject: NotesDocument{}
// A window.
@objc protocol NotesWindow {
	optional var name: NSString {get}
// The title of the window.
	optional func id() -> NSInteger
// The unique identifier of the window.
	optional var index: NSInteger {get set}
// The index of the window, ordered front to back.
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Does the window have a close button?
	optional var miniaturizable: Bool {get}
// Does the window have a minimize button?
	optional var miniaturized: Bool {get set}
// Is the window minimized right now?
	optional var resizable: Bool {get}
// Can the window be resized?
	optional var visible: Bool {get set}
// Is the window visible right now?
	optional var zoomable: Bool {get}
// Does the window have a zoom button?
	optional var zoomed: Bool {get set}
// Is the window zoomed right now?
	optional var document: NotesDocument {get}
// The document whose contents are displayed in the window.
}
extension SBObject: NotesWindow{}
/*
 * Notes Suite
 */
// the Notes application
@objc protocol NotesApplication {
	optional func accounts() -> SBElementArray<NotesAccount *>
	optional func folders() -> SBElementArray<NotesFolder *>
	optional func notes() -> SBElementArray<NotesNote *>
	optional func attachments() -> SBElementArray<NotesAttachment *>
}
extension SBObject: NotesApplication{}
// a Notes account
@objc protocol NotesAccount {
	optional func folders() -> SBElementArray<NotesFolder *>
	optional var name: NSString {get set}
// the name of the account
	optional func id() -> NSString
// the unique identifier of the account
}
extension SBObject: NotesAccount{}
// a folder containing notes
@objc protocol NotesFolder {
	optional func folders() -> SBElementArray<NotesFolder *>
	optional func notes() -> SBElementArray<NotesNote *>
	optional var name: NSString {get set}
// the name of the folder
	optional func id() -> NSString
// the unique identifier of the folder
	optional var container: AnyObject {get}
// the container of the folder
}
extension SBObject: NotesFolder{}
// a note in the Notes application
@objc protocol NotesNote {
	optional func attachments() -> SBElementArray<NotesAttachment *>
	optional var name: NSString {get set}
// the name of the note (normally the first line of the body)
	optional func id() -> NSString
// the unique identifier of the note
	optional var container: NotesFolder {get}
// the folder of the note
	optional var body: NSString {get set}
// the HTML content of the note
	optional var creationDate: NSDate {get}
// the creation date of the note
	optional var modificationDate: NSDate {get}
// the modification date of the note
}
extension SBObject: NotesNote{}
// an attachment in a note
@objc protocol NotesAttachment {
	optional var name: NSString {get}
// the name of the attachment
	optional func id() -> NSString
// the unique identifier of the attachment
	optional var container: NotesNote {get}
// the note containing the attachment
	optional var contentIdentifier: NSString {get}
// the content-id URL in the note"s HTML
}
extension SBObject: NotesAttachment{}
