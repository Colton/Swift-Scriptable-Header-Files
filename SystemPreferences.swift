/*
 * SystemPreferences.h
 */
import AppKit
import ScriptingBridge
@objc enum SystemPreferencesSaveOptions: NSInteger {
	case SystemPreferencesSaveOptionsYes = 0x79657320 /* Save the file. */
	case SystemPreferencesSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case SystemPreferencesSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum SystemPreferencesPrintingErrorHandling: NSInteger {
	case SystemPreferencesPrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case SystemPreferencesPrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: SystemPreferencesSaveOptions, savingIn: NSURL)
// Close a document.
	optional func printWithProperties(withProperties: NSDictionary, printDialog: Bool)
// Print a document.
/*
 * Standard Suite
 */
// The application"s top-level scripting object.
@objc protocol SystemPreferencesApplication {
	optional func documents() -> SBElementArray<SystemPreferencesDocument *>
	optional func windows() -> SBElementArray<SystemPreferencesWindow *>
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
	optional func quitSaving(saving: SystemPreferencesSaveOptions)
// Quit the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
}
extension SBApplication: SystemPreferencesApplication{}
// A document.
@objc protocol SystemPreferencesDocument {
	optional var name: NSString {get}
// Its name.
	optional var modified: Bool {get}
// Has it been modified since the last save?
	optional var file: NSURL {get}
// Its location on disk, if it has one.
}
extension SBObject: SystemPreferencesDocument{}
// A window.
@objc protocol SystemPreferencesWindow {
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
	optional var document: SystemPreferencesDocument {get}
// The document whose contents are displayed in the window.
}
extension SBObject: SystemPreferencesWindow{}
/*
 * System Preferences
 */
// System Preferences top level scripting object
@objc protocol SystemPreferencesApplication {
	optional func panes() -> SBElementArray<SystemPreferencesPane *>
	optional var currentPane: SystemPreferencesPane {get set}
// the currently selected pane
	optional var preferencesWindow: SystemPreferencesWindow {get}
// the main preferences window
	optional var showAll: Bool {get set}
// Is SystemPrefs in show all view. (Setting to false will do nothing)
}
extension SBObject: SystemPreferencesApplication{}
// a preference pane
@objc protocol SystemPreferencesPane {
	optional func anchors() -> SBElementArray<SystemPreferencesAnchor *>
	optional func id() -> NSString
// locale independent name of the preference pane	optional var localizedName: NSString {get}
// localized name of the preference pane
	optional var name: NSString {get}
// name of the preference pane as it appears in the title bar	optional func reveal() -> AnyObject
// Reveals an anchor within a preference pane or preference pane itself
	optional func authorize() -> SystemPreferencesPane
// Prompt authorization for given preference pane
}
extension SBObject: SystemPreferencesPane{}
// an anchor within a preference pane
@objc protocol SystemPreferencesAnchor {
	optional var name: NSString {get}
// name of the anchor within a preference pane
	optional func reveal() -> AnyObject
// Reveals an anchor within a preference pane or preference pane itself
}
extension SBObject: SystemPreferencesAnchor{}
