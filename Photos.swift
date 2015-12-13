/*
 * Photos.h
 */
import AppKit
import ScriptingBridge
/*
 * Standard Suite
 */
// The application"s top-level scripting object.
@objc protocol PhotosApplication {
	optional var name: NSString {get}
// The name of the application.
	optional var frontmost: Bool {get}
// Is this the active application?
	optional var version: NSString {get}
// The version number of the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
	optional func open(x: NSURL)
// Open a photo library
	optional func quit()
// Quit the application.
	optional func import(x: NSArray<NSURL *>, into: PhotosAlbum, skipCheckDuplicates: Bool)
// Import files into the library
	optional func export(x: NSArray<PhotosMediaItem *>, to: NSURL, usingOriginals: Bool)
// Export media items to the specified location as files
	optional func add(x: NSArray<PhotosMediaItem *>, to: PhotosAlbum)
// Add media items to an album.
	optional func startSlideshowUsing(using: NSArray<PhotosMediaItem *>)
// Display an ad-hoc slide show from a list of media items, an album, a folder, or a moment
	optional func stopSlideshow()
// End the currently-playing slideshow.
	optional func nextSlide()
// Skip to next slide in currently-playing slideshow.
	optional func previousSlide()
// Skip to previous slide in currently-playing slideshow.
	optional func pauseSlideshow()
// Pause the currently-playing slideshow.
	optional func resumeSlideshow()
// Resume the currently-playing slideshow.
	optional func spotlight(x: AnyObject)
// Show the image at path in the application, used to show spotlight search results
}
extension SBApplication: PhotosApplication{}
/*
 * Photos Suite
 */
// The top level scripting object for Photos.
@objc protocol PhotosApplication {
	optional func containers() -> SBElementArray<PhotosContainer *>
	optional func albums() -> SBElementArray<PhotosAlbum *>
	optional func folders() -> SBElementArray<PhotosFolder *>
	optional func mediaItems() -> SBElementArray<PhotosMediaItem *>
	optional func moments() -> SBElementArray<PhotosMoment *>
	optional var selection: *> {get}
// The currently selected media items in the application
	optional var favoritesAlbum: PhotosAlbum {get}
// Favorited media items album.
	optional var lastImportAlbum: PhotosAlbum {get}
// Last import album.
	optional var slideshowRunning: Bool {get}
// Returns true if a slideshow is currently running.
	optional var recentlyDeletedAlbum: PhotosAlbum {get}
// The set of recently deleted media items
}
extension SBObject: PhotosApplication{}
// A media item, such as a photo or video.
@objc protocol PhotosMediaItem {
	optional var keywords: *> {get set}
// A list of keywords to associate with a media item
	optional var name: NSString {get set}
// The name (title) of the media item.
	optional var objectDescription: NSString {get set}
// A description of the media item.
	optional var favorite: Bool {get set}
// Whether the media item has been favorited.
	optional var date: NSDate {get set}
// The date of the media item
	optional func id() -> NSString
// The unique ID of the media item
	optional var height: NSInteger {get}
// The height of the media item in pixels.
	optional var width: NSInteger {get}
// The width of the media item in pixels.
	optional var filename: NSString {get}
// The name of the file on disk.
	optional var altitude: CDouble {get}
// The GPS altitude in meters.
	optional var location: *> {get}
// The GPS latitude and longitude, in an ordered list of 2 numbers.  Latitude in range -90.0 to 90.0, longitude in range -180.0 to 180.0.
	optional func duplicate() -> PhotosMediaItem
// Duplicate an object.  Only media items can be duplicated
}
extension SBObject: PhotosMediaItem{}
// Base class for collections that contains other items, such as albums and folders
@objc protocol PhotosContainer {
	optional func id() -> NSString
// The unique ID of this container.
	optional var name: NSString {get set}
// The name of this container.
	optional var parent: PhotosFolder {get}
// This container"s parent folder, if any.
}
extension SBObject: PhotosContainer{}
// An album. A container that holds media items
@objc protocol PhotosAlbum: PhotosContainer {
	optional func mediaItems() -> SBElementArray<PhotosMediaItem *>
	optional func delete()
// Delete an object.  Only albums and folders can be deleted.
	optional func spotlight()
// Show the image at path in the application, used to show spotlight search results
}
extension SBObject: PhotosAlbum{}
// A folder. A container that holds albums and other folders, but not media items
@objc protocol PhotosFolder: PhotosContainer {
	optional func containers() -> SBElementArray<PhotosContainer *>
	optional func albums() -> SBElementArray<PhotosAlbum *>
	optional func folders() -> SBElementArray<PhotosFolder *>
	optional func delete()
// Delete an object.  Only albums and folders can be deleted.
}
extension SBObject: PhotosFolder{}
// A set of media items that represents a Moment.
@objc protocol PhotosMoment {
	optional func mediaItems() -> SBElementArray<PhotosMediaItem *>
	optional func id() -> NSString
// The unique ID of the Moment.
	optional var name: NSString {get}
// The name of the Moment.
}
extension SBObject: PhotosMoment{}
