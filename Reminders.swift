/*
 * Reminders.h
 */
import AppKit
import ScriptingBridge
@objc enum RemindersSaveOptions: NSInteger {
	case RemindersSaveOptionsYes = 0x79657320 /* Save the file. */
	case RemindersSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case RemindersSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum RemindersPrintingErrorHandling: NSInteger {
	case RemindersPrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case RemindersPrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
@objc enum RemindersSaveableFileFormat: NSInteger {
	case RemindersSaveableFileFormatText = 0x63747874 /* Text File Format */
};
	optional func closeSaving(saving: RemindersSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL, `as`: RemindersSaveableFileFormat)
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
@objc protocol RemindersApplication {
	optional func documents() -> SBElementArray<RemindersDocument *>
	optional func windows() -> SBElementArray<RemindersWindow *>
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
	optional func quitSaving(saving: RemindersSaveOptions)
// Quit the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
}
extension SBApplication: RemindersApplication{}
// A document.
@objc protocol RemindersDocument {
	optional var name: NSString {get}
// Its name.
	optional var modified: Bool {get}
// Has it been modified since the last save?
	optional var file: NSURL {get}
// Its location on disk, if it has one.
}
extension SBObject: RemindersDocument{}
// A window.
@objc protocol RemindersWindow {
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
	optional var document: RemindersDocument {get}
// The document whose contents are displayed in the window.
}
extension SBObject: RemindersWindow{}
/*
 * Reminders Suite
 */
// the Reminders application
@objc protocol RemindersApplication {
	optional func accounts() -> SBElementArray<RemindersAccount *>
	optional func lists() -> SBElementArray<RemindersList *>
	optional func reminders() -> SBElementArray<RemindersReminder *>
	optional var defaultAccount: RemindersAccount {get}
// the account currently active in the Reminders application
	optional var defaultList: RemindersList {get}
// the list currently active in the Reminders application
}
extension SBObject: RemindersApplication{}
// an account in the Notes application
@objc protocol RemindersAccount {
	optional func lists() -> SBElementArray<RemindersList *>
	optional var name: NSString {get}
// the name of the account
	optional func id() -> NSString
// the unique identifier of the account
}
extension SBObject: RemindersAccount{}
// a list in the Reminders application
@objc protocol RemindersList {
	optional func reminders() -> SBElementArray<RemindersReminder *>
	optional var name: NSString {get set}
// the name of the list
	optional func id() -> NSString
// the unique identifier of the list
	optional var container: RemindersAccount {get}
// the container of the list
	optional func show() -> AnyObject
// Show an object in the UI
}
extension SBObject: RemindersList{}
// a reminder in the Reminders application
@objc protocol RemindersReminder {
	optional var name: NSString {get set}
// the name of the reminder
	optional func id() -> NSString
// the unique identifier of the reminder
	optional var body: NSString {get set}
// the notes attached to the reminder
	optional var completed: Bool {get set}
// Is the reminder completed?
	optional var completionDate: NSDate {get set}
// the completion date of the reminder
	optional var container: RemindersList {get}
// the container of the reminder
	optional var creationDate: NSDate {get}
// the creation date of the reminder
	optional var dueDate: NSDate {get set}
// the due date of the reminder
	optional var modificationDate: NSDate {get}
// the modification date of the reminder
	optional var remindMeDate: NSDate {get set}
// the remind date of the reminder
	optional var priority: NSInteger {get set}
// the priority of the reminder
	optional func show() -> AnyObject
// Show an object in the UI
}
extension SBObject: RemindersReminder{}
