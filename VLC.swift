/*
 * VLC.h
 */
import AppKit
import ScriptingBridge
@objc enum VLCSavo: NSInteger {
	case VLCSavoAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
	case VLCSavoNo = 0x6e6f2020 /* Do not save the file. */
	case VLCSavoYes = 0x79657320 /* Save the file. */
};
@objc enum VLCEnum: NSInteger {
	case VLCEnumStandard = 0x6c777374 /* Standard PostScript error handling */
	case VLCEnumDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: VLCSavo, savingIn: NSURL)
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
	optional func fullscreen()
// Toggle between fullscreen and windowed mode.
	optional func GetURL()
// Get a URL
	optional func mute()
// Mute the audio
	optional func next()
// Go to the next item in the playlist or the next chapter in the DVD/VCD.
	optional func OpenURL()
// Open a URL
	optional func play()
// Start playing the current playlistitem or pause it when it is already playing.
	optional func previous()
// Go to the previous item in the playlist or the previous chapter in the DVD/VCD.
	optional func stepBackward()
// Step the current playlist item backward the specified step width (default is 2) (1=extraShort, 2=short, 3=medium, 4=long).
	optional func stepForward()
// Step the current playlist item forward the specified step width (default is 2) (1=extraShort, 2=short, 3=medium, 4=long).
	optional func stop()
// Stop playing the current playlistitem
	optional func volumeDown()
// Bring the volume down by one step. There are 32 steps from 0 to 400% volume.
	optional func volumeUp()
// Bring the volume up by one step. There are 32 steps from 0 to 400% volume.
/*
 * Standard Suite
 */
// A scriptable object.
@objc protocol VLCItem {
	optional var properties: NSDictionary {get set}
// All of the object"s properties.
}
extension SBObject: VLCItem{}
// An application"s top level scripting object.
@objc protocol VLCApplication {
	optional func documents() -> SBElementArray<VLCDocument *>
	optional func windows() -> SBElementArray<VLCWindow *>
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var name: NSString {get}
// The name of the application.
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSURL) -> VLCDocument
// Open an object.
	optional func print(x: NSURL, printDialog: Bool, withProperties: VLCPrintSettings)
// Print an object.
	optional func quitSaving(saving: VLCSavo)
// Quit an application.
}
extension SBApplication: VLCApplication{}
// A color.
@objc protocol VLCColor: VLCItem {
}
extension SBObject: VLCColor{}
// A document.
@objc protocol VLCDocument: VLCItem {
	optional var modified: Bool {get}
// Has the document been modified since the last save?
	optional var name: NSString {get set}
// The document"s name.
	optional var path: NSString {get set}
// The document"s path.
}
extension SBObject: VLCDocument{}
// A window.
@objc protocol VLCWindow: VLCItem {
	optional var bounds: NSRect {get set}
// The bounding rectangle of the window.
	optional var closeable: Bool {get}
// Whether the window has a close box.
	optional var document: VLCDocument {get}
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
extension SBObject: VLCWindow{}
/*
 * Text Suite
 */
// This subdivides the text into chunks that all have the same attributes.
@objc protocol VLCAttributeRun: VLCItem {
	optional func attachments() -> SBElementArray<VLCAttachment *>
	optional func attributeRuns() -> SBElementArray<VLCAttributeRun *>
	optional func characters() -> SBElementArray<VLCCharacter *>
	optional func paragraphs() -> SBElementArray<VLCParagraph *>
	optional func words() -> SBElementArray<VLCWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: VLCAttributeRun{}
// This subdivides the text into characters.
@objc protocol VLCCharacter: VLCItem {
	optional func attachments() -> SBElementArray<VLCAttachment *>
	optional func attributeRuns() -> SBElementArray<VLCAttributeRun *>
	optional func characters() -> SBElementArray<VLCCharacter *>
	optional func paragraphs() -> SBElementArray<VLCParagraph *>
	optional func words() -> SBElementArray<VLCWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: VLCCharacter{}
// This subdivides the text into paragraphs.
@objc protocol VLCParagraph: VLCItem {
	optional func attachments() -> SBElementArray<VLCAttachment *>
	optional func attributeRuns() -> SBElementArray<VLCAttributeRun *>
	optional func characters() -> SBElementArray<VLCCharacter *>
	optional func paragraphs() -> SBElementArray<VLCParagraph *>
	optional func words() -> SBElementArray<VLCWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: VLCParagraph{}
// Rich (styled) text
@objc protocol VLCText: VLCItem {
	optional func attachments() -> SBElementArray<VLCAttachment *>
	optional func attributeRuns() -> SBElementArray<VLCAttributeRun *>
	optional func characters() -> SBElementArray<VLCCharacter *>
	optional func paragraphs() -> SBElementArray<VLCParagraph *>
	optional func words() -> SBElementArray<VLCWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: VLCText{}
// Represents an inline text attachment.  This class is used mainly for make commands.
@objc protocol VLCAttachment: VLCText {
	optional var fileName: NSString {get set}
// The path to the file for the attachment
}
extension SBObject: VLCAttachment{}
// This subdivides the text into words.
@objc protocol VLCWord: VLCItem {
	optional func attachments() -> SBElementArray<VLCAttachment *>
	optional func attributeRuns() -> SBElementArray<VLCAttributeRun *>
	optional func characters() -> SBElementArray<VLCCharacter *>
	optional func paragraphs() -> SBElementArray<VLCParagraph *>
	optional func words() -> SBElementArray<VLCWord *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: VLCWord{}
/*
 * VLC suite
 */
// VLC"s top level scripting object
@objc protocol VLCApplication {
	optional var audioVolume: NSInteger {get set}
// The volume of the current playlist item from 0 to 4, where 4 is 400%
	optional var currentTime: NSInteger {get set}
// The current time of the current playlist item in seconds.
	optional var durationOfCurrentItem: NSInteger {get}
// The duration of the current playlist item in seconds.
	optional var fullscreenMode: Bool {get set}
// indicates wheter fullscreen is enabled or not
	optional var muted: Bool {get}
// Is VLC currently muted?
	optional var nameOfCurrentItem: NSString {get}
// Name of the current playlist item.
	optional var pathOfCurrentItem: NSString {get}
// Path to the current playlist item.
	optional var playing: Bool {get}
// Is VLC playing an item?
}
extension SBObject: VLCApplication{}
/*
 * Type Definitions
 */
@objc protocol VLCPrintSettings {
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
	optional var errorHandling: VLCEnum {get set}
// how errors are handled
	optional var faxNumber: NSString {get set}
// for fax number
	optional var targetPrinter: NSString {get set}
// for target printer
}
extension SBObject: VLCPrintSettings{}
