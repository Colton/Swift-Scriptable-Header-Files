/*
 * Terminal.h
 */
import AppKit
import ScriptingBridge
@objc enum TerminalSaveOptions: NSInteger {
	case TerminalSaveOptionsYes = 0x79657320 /* Save the file. */
	case TerminalSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case TerminalSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum TerminalPrintingErrorHandling: NSInteger {
	case TerminalPrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case TerminalPrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: TerminalSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL)
// Save a document.
	optional func printWithProperties(withProperties: NSDictionary, printDialog: Bool)
// Print a document.
	optional func delete()
// Delete an object.
	optional func duplicateTo(to: SBObject, withProperties: NSDictionary)
// Copy object(s) and put the copies at a new location.
	optional func exists() -> Bool
// Verify if an object exists.
	optional func moveTo(to: SBObject)
// Move object(s) to a new location.
/*
 * Standard Suite
 */
// The application‘s top-level scripting object.
@objc protocol TerminalApplication {
	optional func windows() -> SBElementArray<TerminalWindow *>
	optional var name: NSString {get}
// The name of the application.
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSArray<NSURL *>)
// Open a document.
	optional func print(x: AnyObject, withProperties: NSDictionary, printDialog: Bool)
// Print a document.
	optional func quitSaving(saving: TerminalSaveOptions)
// Quit the application.
	optional func doScript(x: NSString, `in`: AnyObject) -> TerminalTab
// Runs a UNIX shell script or command.
}
extension SBApplication: TerminalApplication{}
// A window.
@objc protocol TerminalWindow {
	optional func tabs() -> SBElementArray<TerminalTab *>
	optional var name: NSString {get}
// The full title of the window.
	optional func id() -> NSInteger
// The unique identifier of the window.
	optional var index: NSInteger {get set}
// The index of the window, ordered front to back.
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Whether the window has a close box.
	optional var miniaturizable: Bool {get}
// Whether the window can be minimized.
	optional var miniaturized: Bool {get set}
// Whether the window is currently minimized.
	optional var resizable: Bool {get}
// Whether the window can be resized.
	optional var visible: Bool {get set}
// Whether the window is currently visible.
	optional var zoomable: Bool {get}
// Whether the window can be zoomed.
	optional var zoomed: Bool {get set}
// Whether the window is currently zoomed.
	optional var frontmost: Bool {get set}
// Whether the window is currently the frontmost Terminal window.
	optional var selectedTab: TerminalTab {get set}
	optional var position: NSPoint {get set}
// The position of the window, relative to the upper left corner of the screen.
	optional var origin: NSPoint {get set}
// The position of the window, relative to the lower left corner of the screen.
	optional var size: NSPoint {get set}
// The width and height of the window
	optional var frame: NSRect {get set}
// The bounding rectangle, relative to the lower left corner of the screen.
}
extension SBObject: TerminalWindow{}
/*
 * Terminal Suite
 */
@objc protocol TerminalApplication {
	optional func settingsSets() -> SBElementArray<TerminalSettingsSet *>
	optional var defaultSettings: TerminalSettingsSet {get set}
// The settings set used for new windows.
	optional var startupSettings: TerminalSettingsSet {get set}
// The settings set used for the window created on application startup.
}
extension SBObject: TerminalApplication{}
// A set of settings.
@objc protocol TerminalSettingsSet {
	optional func id() -> NSInteger
// The unique identifier of the settings set.
	optional var name: NSString {get set}
// The name of the settings set.
	optional var numberOfRows: NSInteger {get set}
// The number of rows displayed in the tab.
	optional var numberOfColumns: NSInteger {get set}
// The number of columns displayed in the tab.
	optional var cursorColor: NSColor {get set}
// The cursor color for the tab.
	optional var backgroundColor: NSColor {get set}
// The background color for the tab.
	optional var normalTextColor: NSColor {get set}
// The normal text color for the tab.
	optional var boldTextColor: NSColor {get set}
// The bold text color for the tab.
	optional var fontName: NSString {get set}
// The name of the font used to display the tab’s contents.
	optional var fontSize: NSInteger {get set}
// The size of the font used to display the tab’s contents.
	optional var fontAntialiasing: Bool {get set}
// Whether the font used to display the tab’s contents is antialiased.
	optional var cleanCommands: *> {get set}
// The processes which will be ignored when checking whether a tab can be closed without showing a prompt.
	optional var titleDisplaysDeviceName: Bool {get set}
// Whether the title contains the device name.
	optional var titleDisplaysShellPath: Bool {get set}
// Whether the title contains the shell path.
	optional var titleDisplaysWindowSize: Bool {get set}
// Whether the title contains the tab’s size, in rows and columns.
	optional var titleDisplaysSettingsName: Bool {get set}
// Whether the title contains the settings name.
	optional var titleDisplaysCustomTitle: Bool {get set}
// Whether the title contains a custom title.
	optional var customTitle: NSString {get set}
// The tab’s custom title.
}
extension SBObject: TerminalSettingsSet{}
// A tab.
@objc protocol TerminalTab {
	optional var numberOfRows: NSInteger {get set}
// The number of rows displayed in the tab.
	optional var numberOfColumns: NSInteger {get set}
// The number of columns displayed in the tab.
	optional var contents: NSString {get}
// The currently visible contents of the tab.
	optional var history: NSString {get}
// The contents of the entire scrolling buffer of the tab.
	optional var busy: Bool {get}
// Whether the tab is busy running a process.
	optional var processes: *> {get}
// The processes currently running in the tab.
	optional var selected: Bool {get set}
// Whether the tab is selected.
	optional var titleDisplaysCustomTitle: Bool {get set}
// Whether the title contains a custom title.
	optional var customTitle: NSString {get set}
// The tab’s custom title.
	optional var tty: NSString {get}
// The tab’s TTY device.
	optional var currentSettings: TerminalSettingsSet {get set}
// The set of settings which control the tab’s behavior and appearance.
	optional var cursorColor: NSColor {get set}
// The cursor color for the tab.
	optional var backgroundColor: NSColor {get set}
// The background color for the tab.
	optional var normalTextColor: NSColor {get set}
// The normal text color for the tab.
	optional var boldTextColor: NSColor {get set}
// The bold text color for the tab.
	optional var cleanCommands: *> {get set}
// The processes which will be ignored when checking whether a tab can be closed without showing a prompt.
	optional var titleDisplaysDeviceName: Bool {get set}
// Whether the title contains the device name.
	optional var titleDisplaysShellPath: Bool {get set}
// Whether the title contains the shell path.
	optional var titleDisplaysWindowSize: Bool {get set}
// Whether the title contains the tab’s size, in rows and columns.
	optional var titleDisplaysFileName: Bool {get set}
// Whether the title contains the file name.
	optional var fontName: NSString {get set}
// The name of the font used to display the tab’s contents.
	optional var fontSize: NSInteger {get set}
// The size of the font used to display the tab’s contents.
	optional var fontAntialiasing: Bool {get set}
// Whether the font used to display the tab’s contents is antialiased.
}
extension SBObject: TerminalTab{}
