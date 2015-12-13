/*
 * QuicktimePlayer.h
 */
import AppKit
import ScriptingBridge
@objc enum QuicktimePlayerSaveOptions: NSInteger {
	case QuicktimePlayerSaveOptionsYes = 0x79657320 /* Save the file. */
	case QuicktimePlayerSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case QuicktimePlayerSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum QuicktimePlayerPrintingErrorHandling: NSInteger {
	case QuicktimePlayerPrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case QuicktimePlayerPrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
	optional func closeSaving(saving: QuicktimePlayerSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL, `as`: AnyObject)
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
@objc protocol QuicktimePlayerApplication {
	optional func documents() -> SBElementArray<QuicktimePlayerDocument *>
	optional func windows() -> SBElementArray<QuicktimePlayerWindow *>
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
	optional func quitSaving(saving: QuicktimePlayerSaveOptions)
// Quit the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
	optional func openURL(x: NSString)
// Open a URL.
	optional func newMovieRecording NS_RETURNS_NOT_RETAINED() -> QuicktimePlayerDocument
// Create a new movie recording document.
	optional func newAudioRecording NS_RETURNS_NOT_RETAINED() -> QuicktimePlayerDocument
// Create a new audio recording document.
	optional func newScreenRecording NS_RETURNS_NOT_RETAINED() -> QuicktimePlayerDocument
// Create a new screen recording document.
}
extension SBApplication: QuicktimePlayerApplication{}
// A document.
@objc protocol QuicktimePlayerDocument {
	optional var name: NSString {get}
// Its name.
	optional var modified: Bool {get}
// Has it been modified since the last save?
	optional var file: NSURL {get}
// Its location on disk, if it has one.
	optional func play()
// Play the movie.
	optional func start()
// Start the movie recording.
	optional func pause()
// Pause the recording.
	optional func resume()
// Resume the recording.
	optional func stop()
// Stop the movie or recording.
	optional func stepBackwardBy(by: NSInteger)
// Step the movie backward the specified number of steps (default is 1).
	optional func stepForwardBy(by: NSInteger)
// Step the movie forward the specified number of steps (default is 1).
	optional func trimFrom(from: CDouble, to: CDouble)
// Trim the movie.
	optional func present()
// Present the document full screen.
	optional func exportIn(`in`: NSURL, usingSettingsPreset: NSString)
// Export a movie to another file
}
extension SBObject: QuicktimePlayerDocument{}
// A window.
@objc protocol QuicktimePlayerWindow {
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
	optional var document: QuicktimePlayerDocument {get}
// The document whose contents are displayed in the window.
}
extension SBObject: QuicktimePlayerWindow{}
/*
 * Internet Suite
 */
@objc protocol QuicktimePlayerApplication {
}
extension SBObject: QuicktimePlayerApplication{}
/*
 * QuickTime Player Suite
 */
// A video recording device
@objc protocol QuicktimePlayerVideoRecordingDevice {
	optional var name: NSString {get}
// The name of the device.
	optional func id() -> NSString
// The unique identifier of the device.
}
extension SBObject: QuicktimePlayerVideoRecordingDevice{}
// An audio recording device
@objc protocol QuicktimePlayerAudioRecordingDevice {
	optional var name: NSString {get}
// The name of the device.
	optional func id() -> NSString
// The unique identifier of the device.
}
extension SBObject: QuicktimePlayerAudioRecordingDevice{}
// An audio recording compression preset
@objc protocol QuicktimePlayerAudioCompressionPreset {
	optional var name: NSString {get}
// The name of the preset.
	optional func id() -> NSString
// The unique identifier of the preset.
}
extension SBObject: QuicktimePlayerAudioCompressionPreset{}
// A movie recording compression preset
@objc protocol QuicktimePlayerMovieCompressionPreset {
	optional var name: NSString {get}
// The name of the preset.
	optional func id() -> NSString
// The unique identifier of the preset.
}
extension SBObject: QuicktimePlayerMovieCompressionPreset{}
// A screen recording compression preset
@objc protocol QuicktimePlayerScreenCompressionPreset {
	optional var name: NSString {get}
// The name of the preset.
	optional func id() -> NSString
// The unique identifier of the preset.
}
extension SBObject: QuicktimePlayerScreenCompressionPreset{}
@objc protocol QuicktimePlayerApplication {
	optional func videoRecordingDevices() -> SBElementArray<QuicktimePlayerVideoRecordingDevice *>
	optional func audioRecordingDevices() -> SBElementArray<QuicktimePlayerAudioRecordingDevice *>
	optional func audioCompressionPresets() -> SBElementArray<QuicktimePlayerAudioCompressionPreset *>
	optional func movieCompressionPresets() -> SBElementArray<QuicktimePlayerMovieCompressionPreset *>
	optional func screenCompressionPresets() -> SBElementArray<QuicktimePlayerScreenCompressionPreset *>
}
extension SBObject: QuicktimePlayerApplication{}
@objc protocol QuicktimePlayerDocument {
	optional var audioVolume: CDouble {get set}
// The volume of the movie from 0 to 1, where 1 is 100%.
	optional var currentTime: CDouble {get set}
// The current time of the movie in seconds.
	optional var dataRate: NSInteger {get}
// The data rate of the movie in bytes per second.
	optional var dataSize: NSInteger {get}
// The data size of the movie in bytes.
	optional var duration: CDouble {get}
// The duration of the movie in seconds.
	optional var looping: Bool {get set}
// Is the movie playing in a loop?
	optional var muted: Bool {get set}
// Is the movie muted?
	optional var naturalDimensions: NSPoint {get}
// The natural dimensions of the movie.
	optional var playing: Bool {get}
// Is the movie playing?
	optional var rate: CDouble {get set}
// The current rate of the movie.
	optional var presenting: Bool {get set}
// Is the movie presented in full screen?
	optional var currentMicrophone: QuicktimePlayerAudioRecordingDevice {get set}
// The currently previewing audio device.
	optional var currentCamera: QuicktimePlayerVideoRecordingDevice {get set}
// The currently previewing video device.
	optional var currentAudioCompression: QuicktimePlayerAudioCompressionPreset {get set}
// The current audio compression preset.
	optional var currentMovieCompression: QuicktimePlayerMovieCompressionPreset {get set}
// The current movie compression preset.
	optional var currentScreenCompression: QuicktimePlayerScreenCompressionPreset {get set}
// The current screen compression preset.
}
extension SBObject: QuicktimePlayerDocument{}
