/*
 * Finder.h
 */
import AppKit
import ScriptingBridge
@objc enum FinderPriv: NSInteger {
	case FinderPrivReadOnly = 0x72656164
	case FinderPrivReadWrite = 0x72647772
	case FinderPrivWriteOnly = 0x77726974
	case FinderPrivNone = 0x6e6f6e65
};
@objc enum FinderEdfm: NSInteger {
	case FinderEdfmMacOSFormat = 0x64666866
	case FinderEdfmMacOSExtendedFormat = 0x6466682b
	case FinderEdfmUFSFormat = 0x64667566
	case FinderEdfmNFSFormat = 0x64666e66
	case FinderEdfmAudioFormat = 0x64666175
	case FinderEdfmProDOSFormat = 0x64667072
	case FinderEdfmMSDOSFormat = 0x64666d73
	case FinderEdfmNTFSFormat = 0x64666e74
	case FinderEdfmISO9660Format = 0x64663936
	case FinderEdfmHighSierraFormat = 0x64666873
	case FinderEdfmQuickTakeFormat = 0x64667174
	case FinderEdfmApplePhotoFormat = 0x64667068
	case FinderEdfmAppleShareFormat = 0x64666173
	case FinderEdfmUDFFormat = 0x64667564
	case FinderEdfmWebDAVFormat = 0x64667764
	case FinderEdfmFTPFormat = 0x64666674
	case FinderEdfmPacketWrittenUDFFormat = 0x64667075
	case FinderEdfmXsanFormat = 0x64666163
	case FinderEdfmUnknownFormat = 0x64665c3f5c3f
};
@objc enum FinderIpnl: NSInteger {
	case FinderIpnlGeneralInformationPanel = 0x67706e6c
	case FinderIpnlSharingPanel = 0x73706e6c
	case FinderIpnlMemoryPanel = 0x6d706e6c
	case FinderIpnlPreviewPanel = 0x76706e6c
	case FinderIpnlApplicationPanel = 0x61706e6c
	case FinderIpnlLanguagesPanel = 0x706b6c67
	case FinderIpnlPluginsPanel = 0x706b7067
	case FinderIpnlNameExtensionPanel = 0x6e706e6c
	case FinderIpnlCommentsPanel = 0x63706e6c
	case FinderIpnlContentIndexPanel = 0x63696e6c
	case FinderIpnlBurningPanel = 0x62706e6c
	case FinderIpnlMoreInfoPanel = 0x6d696e6c
	case FinderIpnlSimpleHeaderPanel = 0x73686e6c
};
@objc enum FinderPple: NSInteger {
	case FinderPpleGeneralPreferencesPanel = 0x70676e70
	case FinderPpleLabelPreferencesPanel = 0x706c6270
	case FinderPpleSidebarPreferencesPanel = 0x70736964
	case FinderPpleAdvancedPreferencesPanel = 0x70616476
};
@objc enum FinderEcvw: NSInteger {
	case FinderEcvwIconView = 0x69636e76
	case FinderEcvwListView = 0x6c737677
	case FinderEcvwColumnView = 0x636c7677
	case FinderEcvwGroupView = 0x67727677
	case FinderEcvwFlowView = 0x666c7677
};
@objc enum FinderEarr: NSInteger {
	case FinderEarrNotArranged = 0x6e617272
	case FinderEarrSnapToGrid = 0x67726461
	case FinderEarrArrangedByName = 0x6e616d61
	case FinderEarrArrangedByModificationDate = 0x6d647461
	case FinderEarrArrangedByCreationDate = 0x63647461
	case FinderEarrArrangedBySize = 0x73697a61
	case FinderEarrArrangedByKind = 0x6b696e61
	case FinderEarrArrangedByLabel = 0x6c616261
};
@objc enum FinderEpos: NSInteger {
	case FinderEposRight = 0x6c726774
	case FinderEposBottom = 0x6c626f74
};
@objc enum FinderSodr: NSInteger {
	case FinderSodrNormal = 0x736e726d
	case FinderSodrReversed = 0x73727673
};
@objc enum FinderElsv: NSInteger {
	case FinderElsvNameColumn = 0x656c736e
	case FinderElsvModificationDateColumn = 0x656c736d
	case FinderElsvCreationDateColumn = 0x656c7363
	case FinderElsvSizeColumn = 0x656c7373
	case FinderElsvKindColumn = 0x656c736b
	case FinderElsvLabelColumn = 0x656c736c
	case FinderElsvVersionColumn = 0x656c7376
	case FinderElsvCommentColumn = 0x656c7343
};
@objc enum FinderLvic: NSInteger {
	case FinderLvicSmallIcon = 0x736d6963
	case FinderLvicLargeIcon = 0x6c676963
};
	optional func openUsing(using: SBObject, withProperties: NSDictionary)
// Open the specified object(s)
	optional func printWithProperties(withProperties: NSDictionary)
// Print the specified object(s)
	optional func activate()
// Activate the specified window (or the Finder)
	optional func close()
// Close an object
	optional func dataSizeAs(`as`: NSNumber) -> NSInteger
// Return the size in bytes of an object
	optional func delete() -> SBObject
// Move an item from its container to the trash
	optional func duplicateTo(to: SBObject, replacing: Bool, routingSuppressed: Bool, exactCopy: Bool) -> SBObject
// Duplicate one or more object(s)
	optional func exists() -> Bool
// Verify if an object exists
	optional func moveTo(to: SBObject, replacing: Bool, positionedAt: NSArray, routingSuppressed: Bool) -> SBObject
// Move object(s) to a new location
	optional func select()
// Select the specified object(s)
	optional func sortBy(by: SEL) -> SBObject
// Return the specified object(s) in a sorted list
	optional func cleanUpBy(by: SEL)
// Arrange items in window nicely (only applies to open windows in icon view that are not kept arranged)
	optional func eject()
// Eject the specified disk(s)
	optional func emptySecurity(security: Bool)
// Empty the trash
	optional func erase()
// (NOT AVAILABLE) Erase the specified disk(s)
	optional func reveal()
// Bring the specified object(s) into view
	optional func updateNecessity(necessity: Bool, registeringApplications: Bool)
// Update the display of the specified object(s) to match their on-disk representation
/*
 * Finder Basics
 */
// The Finder
@objc protocol FinderApplication {
	optional func items() -> SBElementArray<FinderItem *>
	optional func containers() -> SBElementArray<FinderContainer *>
	optional func disks() -> SBElementArray<FinderDisk *>
	optional func folders() -> SBElementArray<FinderFolder *>
	optional func files() -> SBElementArray<FinderFile *>
	optional func aliasFiles() -> SBElementArray<FinderAliasFile *>
	optional func applicationFiles() -> SBElementArray<FinderApplicationFile *>
	optional func documentFiles() -> SBElementArray<FinderDocumentFile *>
	optional func internetLocationFiles() -> SBElementArray<FinderInternetLocationFile *>
	optional func clippings() -> SBElementArray<FinderClipping *>
	optional func packages() -> SBElementArray<FinderPackage *>
	optional func windows() -> SBElementArray<FinderWindow *>
	optional func FinderWindows() -> SBElementArray<FinderFinderWindow *>
	optional func clippingWindows() -> SBElementArray<FinderClippingWindow *>
	optional var clipboard: SBObject {get}
// (NOT AVAILABLE YET) the Finder’s clipboard window
	optional var name: NSString {get}
// the Finder’s name
	optional var visible: Bool {get set}
// Is the Finder’s layer visible?
	optional var frontmost: Bool {get set}
// Is the Finder the frontmost process?
	optional var selection: SBObject {get set}
// the selection in the frontmost Finder window
	optional var insertionLocation: SBObject {get}
// the container in which a new folder would appear if “New Folder” was selected
	optional var productVersion: NSString {get}
// the version of the System software running on this computer
	optional var version: NSString {get}
// the version of the Finder
	optional var startupDisk: FinderDisk {get}
// the startup disk
	optional var desktop: FinderDesktopObject {get}
// the desktop
	optional var trash: FinderTrashObject {get}
// the trash
	optional var home: FinderFolder {get}
// the home directory
	optional var computerContainer: FinderComputerObject {get}
// the computer location (as in Go > Computer)
	optional var FinderPreferences: FinderPreferences {get}
// Various preferences that apply to the Finder as a whole
	optional func quit()
// Quit the Finder
	optional func activate()
// Activate the specified window (or the Finder)
	optional func copy NS_RETURNS_NOT_RETAINED()
// (NOT AVAILABLE YET) Copy the selected items to the clipboard (the Finder must be the front application)
	optional func eject()
// Eject the specified disk(s)
	optional func emptySecurity(security: Bool)
// Empty the trash
	optional func restart()
// Restart the computer
	optional func shutDown()
// Shut Down the computer
	optional func sleep()
// Put the computer to sleep
}
extension SBApplication: FinderApplication{}
/*
 * Finder items
 */
// An item
@objc protocol FinderItem {
	optional var name: NSString {get set}
// the name of the item
	optional var displayedName: NSString {get}
// the user-visible name of the item
	optional var nameExtension: NSString {get set}
// the name extension of the item (such as “txt”)
	optional var extensionHidden: Bool {get set}
// Is the item"s extension hidden from the user?
	optional var index: NSInteger {get}
// the index in the front-to-back ordering within its container
	optional var container: SBObject {get}
// the container of the item
	optional var disk: SBObject {get}
// the disk on which the item is stored
	optional var position: NSPoint {get set}
// the position of the item within its parent window (can only be set for an item in a window viewed as icons or buttons)
	optional var desktopPosition: NSPoint {get set}
// the position of the item on the desktop
	optional var bounds: NSRect {get set}
// the bounding rectangle of the item (can only be set for an item in a window viewed as icons or buttons)
	optional var labelIndex: NSInteger {get set}
// the label of the item
	optional var locked: Bool {get set}
// Is the file locked?
	optional var kind: NSString {get}
// the kind of the item
	optional var objectDescription: NSString {get}
// a description of the item
	optional var comment: NSString {get set}
// the comment of the item, displayed in the “Get Info” window
	optional var size: CLong {get}
// the logical size of the item
	optional var physicalSize: CLong {get}
// the actual space used by the item on disk
	optional var creationDate: NSDate {get}
// the date on which the item was created
	optional var modificationDate: NSDate {get set}
// the date on which the item was last modified
	optional var icon: FinderIconFamily {get set}
// the icon bitmap of the item
	optional var URL: NSString {get}
// the URL of the item
	optional var owner: NSString {get set}
// the user that owns the container
	optional var group: NSString {get set}
// the user or group that has special access to the container
	optional var ownerPrivileges: FinderPriv {get set}
	optional var groupPrivileges: FinderPriv {get set}
	optional var everyonesPrivileges: FinderPriv {get set}
	optional var informationWindow: SBObject {get}
// the information window for the item
	optional var properties: NSDictionary {get set}
// every property of an item
}
extension SBObject: FinderItem{}
/*
 * Containers and folders
 */
// An item that contains other items
@objc protocol FinderContainer: FinderItem {
	optional func items() -> SBElementArray<FinderItem *>
	optional func containers() -> SBElementArray<FinderContainer *>
	optional func folders() -> SBElementArray<FinderFolder *>
	optional func files() -> SBElementArray<FinderFile *>
	optional func aliasFiles() -> SBElementArray<FinderAliasFile *>
	optional func applicationFiles() -> SBElementArray<FinderApplicationFile *>
	optional func documentFiles() -> SBElementArray<FinderDocumentFile *>
	optional func internetLocationFiles() -> SBElementArray<FinderInternetLocationFile *>
	optional func clippings() -> SBElementArray<FinderClipping *>
	optional func packages() -> SBElementArray<FinderPackage *>
	optional var entireContents: SBObject {get}
// the entire contents of the container, including the contents of its children
	optional var expandable: Bool {get}
// (NOT AVAILABLE YET) Is the container capable of being expanded as an outline?
	optional var expanded: Bool {get set}
// (NOT AVAILABLE YET) Is the container opened as an outline? (can only be set for containers viewed as lists)
	optional var completelyExpanded: Bool {get set}
// (NOT AVAILABLE YET) Are the container and all of its children opened as outlines? (can only be set for containers viewed as lists)
	optional var containerWindow: SBObject {get}
// the container window for this folder
}
extension SBObject: FinderContainer{}
// the Computer location (as in Go > Computer)
@objc protocol FinderComputerObject: FinderItem {
}
extension SBObject: FinderComputerObject{}
// A disk
@objc protocol FinderDisk: FinderContainer {
	optional func items() -> SBElementArray<FinderItem *>
	optional func containers() -> SBElementArray<FinderContainer *>
	optional func folders() -> SBElementArray<FinderFolder *>
	optional func files() -> SBElementArray<FinderFile *>
	optional func aliasFiles() -> SBElementArray<FinderAliasFile *>
	optional func applicationFiles() -> SBElementArray<FinderApplicationFile *>
	optional func documentFiles() -> SBElementArray<FinderDocumentFile *>
	optional func internetLocationFiles() -> SBElementArray<FinderInternetLocationFile *>
	optional func clippings() -> SBElementArray<FinderClipping *>
	optional func packages() -> SBElementArray<FinderPackage *>
	optional func id() -> NSInteger
// the unique id for this disk (unchanged while disk remains connected and Finder remains running)
	optional var capacity: CLong {get}
// the total number of bytes (free or used) on the disk
	optional var freeSpace: CLong {get}
// the number of free bytes left on the disk
	optional var ejectable: Bool {get}
// Can the media be ejected (floppies, CDs, and so on)?
	optional var localVolume: Bool {get}
// Is the media a local volume (as opposed to a file server)?
	optional var startup: Bool {get}
// Is this disk the boot disk?
	optional var format: FinderEdfm {get}
// the filesystem format of this disk
	optional var journalingEnabled: Bool {get}
// Does this disk do file system journaling?
	optional var ignorePrivileges: Bool {get set}
// Ignore permissions on this disk?
}
extension SBObject: FinderDisk{}
// A folder
@objc protocol FinderFolder: FinderContainer {
	optional func items() -> SBElementArray<FinderItem *>
	optional func containers() -> SBElementArray<FinderContainer *>
	optional func folders() -> SBElementArray<FinderFolder *>
	optional func files() -> SBElementArray<FinderFile *>
	optional func aliasFiles() -> SBElementArray<FinderAliasFile *>
	optional func applicationFiles() -> SBElementArray<FinderApplicationFile *>
	optional func documentFiles() -> SBElementArray<FinderDocumentFile *>
	optional func internetLocationFiles() -> SBElementArray<FinderInternetLocationFile *>
	optional func clippings() -> SBElementArray<FinderClipping *>
	optional func packages() -> SBElementArray<FinderPackage *>
}
extension SBObject: FinderFolder{}
// Desktop-object is the class of the “desktop” object
@objc protocol FinderDesktopObject: FinderContainer {
	optional func items() -> SBElementArray<FinderItem *>
	optional func containers() -> SBElementArray<FinderContainer *>
	optional func disks() -> SBElementArray<FinderDisk *>
	optional func folders() -> SBElementArray<FinderFolder *>
	optional func files() -> SBElementArray<FinderFile *>
	optional func aliasFiles() -> SBElementArray<FinderAliasFile *>
	optional func applicationFiles() -> SBElementArray<FinderApplicationFile *>
	optional func documentFiles() -> SBElementArray<FinderDocumentFile *>
	optional func internetLocationFiles() -> SBElementArray<FinderInternetLocationFile *>
	optional func clippings() -> SBElementArray<FinderClipping *>
	optional func packages() -> SBElementArray<FinderPackage *>
}
extension SBObject: FinderDesktopObject{}
// Trash-object is the class of the “trash” object
@objc protocol FinderTrashObject: FinderContainer {
	optional func items() -> SBElementArray<FinderItem *>
	optional func containers() -> SBElementArray<FinderContainer *>
	optional func folders() -> SBElementArray<FinderFolder *>
	optional func files() -> SBElementArray<FinderFile *>
	optional func aliasFiles() -> SBElementArray<FinderAliasFile *>
	optional func applicationFiles() -> SBElementArray<FinderApplicationFile *>
	optional func documentFiles() -> SBElementArray<FinderDocumentFile *>
	optional func internetLocationFiles() -> SBElementArray<FinderInternetLocationFile *>
	optional func clippings() -> SBElementArray<FinderClipping *>
	optional func packages() -> SBElementArray<FinderPackage *>
	optional var warnsBeforeEmptying: Bool {get set}
// Display a dialog when emptying the trash?
}
extension SBObject: FinderTrashObject{}
/*
 * Files
 */
// A file
@objc protocol FinderFile: FinderItem {
	optional var fileType: NSNumber {get set}
// the OSType identifying the type of data contained in the item
	optional var creatorType: NSNumber {get set}
// the OSType identifying the application that created the item
	optional var stationery: Bool {get set}
// Is the file a stationery pad?
	optional var productVersion: NSString {get}
// the version of the product (visible at the top of the “Get Info” window)
	optional var version: NSString {get}
// the version of the file (visible at the bottom of the “Get Info” window)
}
extension SBObject: FinderFile{}
// An alias file (created with “Make Alias”)
@objc protocol FinderAliasFile: FinderFile {
	optional var originalItem: SBObject {get set}
// the original item pointed to by the alias
}
extension SBObject: FinderAliasFile{}
// An application"s file on disk
@objc protocol FinderApplicationFile: FinderFile {
	optional func id() -> NSString
// the bundle identifier or creator type of the application
	optional var suggestedSize: NSInteger {get}
// (AVAILABLE IN 10.1 TO 10.4) the memory size with which the developer recommends the application be launched
	optional var minimumSize: NSInteger {get set}
// (AVAILABLE IN 10.1 TO 10.4) the smallest memory size with which the application can be launched
	optional var preferredSize: NSInteger {get set}
// (AVAILABLE IN 10.1 TO 10.4) the memory size with which the application will be launched
	optional var acceptsHighLevelEvents: Bool {get}
// Is the application high-level event aware? (OBSOLETE: always returns true)
	optional var hasScriptingTerminology: Bool {get}
// Does the process have a scripting terminology, i.e., can it be scripted?
	optional var opensInClassic: Bool {get set}
// (AVAILABLE IN 10.1 TO 10.4) Should the application launch in the Classic environment?
}
extension SBObject: FinderApplicationFile{}
// A document file
@objc protocol FinderDocumentFile: FinderFile {
}
extension SBObject: FinderDocumentFile{}
// A file containing an internet location
@objc protocol FinderInternetLocationFile: FinderFile {
	optional var location: NSString {get}
// the internet location
}
extension SBObject: FinderInternetLocationFile{}
// A clipping
@objc protocol FinderClipping: FinderFile {
	optional var clippingWindow: SBObject {get}
// (NOT AVAILABLE YET) the clipping window for this clipping
}
extension SBObject: FinderClipping{}
// A package
@objc protocol FinderPackage: FinderItem {
}
extension SBObject: FinderPackage{}
/*
 * Window classes
 */
// A window
@objc protocol FinderWindow {
	optional func id() -> NSInteger
// the unique id for this window
	optional var position: NSPoint {get set}
// the upper left position of the window
	optional var bounds: NSRect {get set}
// the boundary rectangle for the window
	optional var titled: Bool {get}
// Does the window have a title bar?
	optional var name: NSString {get}
// the name of the window
	optional var index: NSInteger {get set}
// the number of the window in the front-to-back layer ordering
	optional var closeable: Bool {get}
// Does the window have a close box?
	optional var floating: Bool {get}
// Does the window have a title bar?
	optional var modal: Bool {get}
// Is the window modal?
	optional var resizable: Bool {get}
// Is the window resizable?
	optional var zoomable: Bool {get}
// Is the window zoomable?
	optional var zoomed: Bool {get set}
// Is the window zoomed?
	optional var visible: Bool {get}
// Is the window visible (always true for open Finder windows)?
	optional var collapsed: Bool {get set}
// Is the window collapsed
	optional var properties: NSDictionary {get set}
// every property of a window
}
extension SBObject: FinderWindow{}
// A file viewer window
@objc protocol FinderFinderWindow: FinderWindow {
	optional var target: SBObject {get set}
// the container at which this file viewer is targeted
	optional var currentView: FinderEcvw {get set}
// the current view for the container window
	optional var iconViewOptions: FinderIconViewOptions {get}
// the icon view options for the container window
	optional var listViewOptions: FinderListViewOptions {get}
// the list view options for the container window
	optional var columnViewOptions: FinderColumnViewOptions {get}
// the column view options for the container window
	optional var toolbarVisible: Bool {get set}
// Is the window"s toolbar visible?
	optional var statusbarVisible: Bool {get set}
// Is the window"s status bar visible?
	optional var sidebarWidth: NSInteger {get set}
// the width of the sidebar for the container window
}
extension SBObject: FinderFinderWindow{}
// the desktop window
@objc protocol FinderDesktopWindow: FinderFinderWindow {
}
extension SBObject: FinderDesktopWindow{}
// An inspector window (opened by “Show Info”)
@objc protocol FinderInformationWindow: FinderWindow {
	optional var item: SBObject {get}
// the item from which this window was opened
	optional var currentPanel: FinderIpnl {get set}
// the current panel in the information window
}
extension SBObject: FinderInformationWindow{}
// The Finder Preferences window
@objc protocol FinderPreferencesWindow: FinderWindow {
	optional var currentPanel: FinderPple {get set}
// The current panel in the Finder preferences window
}
extension SBObject: FinderPreferencesWindow{}
// The window containing a clipping
@objc protocol FinderClippingWindow: FinderWindow {
}
extension SBObject: FinderClippingWindow{}
/*
 * Legacy suite
 */
// The Finder
@objc protocol FinderApplication {
	optional var desktopPicture: FinderFile {get set}
// the desktop picture of the main monitor
}
extension SBObject: FinderApplication{}
// A process running on this computer
@objc protocol FinderProcess {
	optional var name: NSString {get}
// the name of the process
	optional var visible: Bool {get set}
// Is the process" layer visible?
	optional var frontmost: Bool {get set}
// Is the process the frontmost process?
	optional var file: SBObject {get}
// the file from which the process was launched
	optional var fileType: NSNumber {get}
// the OSType of the file type of the process
	optional var creatorType: NSNumber {get}
// the OSType of the creator of the process (the signature)
	optional var acceptsHighLevelEvents: Bool {get}
// Is the process high-level event aware (accepts open application, open document, print document, and quit)?
	optional var acceptsRemoteEvents: Bool {get}
// Does the process accept remote events?
	optional var hasScriptingTerminology: Bool {get}
// Does the process have a scripting terminology, i.e., can it be scripted?
	optional var totalPartitionSize: NSInteger {get}
// the size of the partition with which the process was launched
	optional var partitionSpaceUsed: NSInteger {get}
// the number of bytes currently used in the process" partition
}
extension SBObject: FinderProcess{}
// A process launched from an application file
@objc protocol FinderApplicationProcess: FinderProcess {
	optional var applicationFile: FinderApplicationFile {get}
// the application file from which this process was launched
}
extension SBObject: FinderApplicationProcess{}
// A process launched from a desk accessory file
@objc protocol FinderDeskAccessoryProcess: FinderProcess {
	optional var deskAccessoryFile: SBObject {get}
// the desk accessory file from which this process was launched
}
extension SBObject: FinderDeskAccessoryProcess{}
/*
 * Type Definitions
 */
// The Finder Preferences
@objc protocol FinderPreferences {
	optional var window: FinderPreferencesWindow {get}
// the window that would open if Finder preferences was opened
	optional var iconViewOptions: FinderIconViewOptions {get}
// the default icon view options
	optional var listViewOptions: FinderListViewOptions {get}
// the default list view options
	optional var columnViewOptions: FinderColumnViewOptions {get}
// the column view options for all windows
	optional var foldersSpringOpen: Bool {get set}
// Spring open folders after the specified delay?
	optional var delayBeforeSpringing: CDouble {get set}
// the delay before springing open a container in seconds (from 0.167 to 1.169)
	optional var desktopShowsHardDisks: Bool {get set}
// Hard disks appear on the desktop?
	optional var desktopShowsExternalHardDisks: Bool {get set}
// External hard disks appear on the desktop?
	optional var desktopShowsRemovableMedia: Bool {get set}
// CDs, DVDs, and iPods appear on the desktop?
	optional var desktopShowsConnectedServers: Bool {get set}
// Connected servers appear on the desktop?
	optional var newWindowTarget: SBObject {get set}
// target location for a newly-opened Finder window
	optional var foldersOpenInNewWindows: Bool {get set}
// Folders open into new windows?
	optional var foldersOpenInNewTabs: Bool {get set}
// Folders open into new tabs?
	optional var newWindowsOpenInColumnView: Bool {get set}
// Open new windows in column view?
	optional var allNameExtensionsShowing: Bool {get set}
// Show name extensions, even for items whose “extension hidden” is true?
}
extension SBObject: FinderPreferences{}
// (NOT AVAILABLE YET) A Finder label (name and color)
@objc protocol FinderLabel {
	optional var name: NSString {get set}
// the name associated with the label
	optional var index: NSInteger {get set}
// the index in the front-to-back ordering within its container
	optional var color: NSColor {get set}
// the color associated with the label
}
extension SBObject: FinderLabel{}
// (NOT AVAILABLE YET) A family of icons
@objc protocol FinderIconFamily {
	optional var largeMonochromeIconAndMask: AnyObject {get}
// the large black-and-white icon and the mask for large icons
	optional var large8BitMask: AnyObject {get}
// the large 8-bit mask for large 32-bit icons
	optional var large32BitIcon: AnyObject {get}
// the large 32-bit color icon
	optional var large8BitIcon: AnyObject {get}
// the large 8-bit color icon
	optional var large4BitIcon: AnyObject {get}
// the large 4-bit color icon
	optional var smallMonochromeIconAndMask: AnyObject {get}
// the small black-and-white icon and the mask for small icons
	optional var small8BitMask: AnyObject {get}
// the small 8-bit mask for small 32-bit icons
	optional var small32BitIcon: AnyObject {get}
// the small 32-bit color icon
	optional var small8BitIcon: AnyObject {get}
// the small 8-bit color icon
	optional var small4BitIcon: AnyObject {get}
// the small 4-bit color icon
}
extension SBObject: FinderIconFamily{}
// the icon view options
@objc protocol FinderIconViewOptions {
	optional var arrangement: FinderEarr {get set}
// the property by which to keep icons arranged
	optional var iconSize: NSInteger {get set}
// the size of icons displayed in the icon view
	optional var showsItemInfo: Bool {get set}
// additional info about an item displayed in icon view
	optional var showsIconPreview: Bool {get set}
// displays a preview of the item in icon view
	optional var textSize: NSInteger {get set}
// the size of the text displayed in the icon view
	optional var labelPosition: FinderEpos {get set}
// the location of the label in reference to the icon
	optional var backgroundPicture: FinderFile {get set}
// the background picture of the icon view
	optional var backgroundColor: NSColor {get set}
// the background color of the icon view
}
extension SBObject: FinderIconViewOptions{}
// the column view options
@objc protocol FinderColumnViewOptions {
	optional var textSize: NSInteger {get set}
// the size of the text displayed in the column view
	optional var showsIcon: Bool {get set}
// displays an icon next to the label in column view
	optional var showsIconPreview: Bool {get set}
// displays a preview of the item in column view
	optional var showsPreviewColumn: Bool {get set}
// displays the preview column in column view
	optional var disclosesPreviewPane: Bool {get set}
// discloses the preview pane of the preview column in column view
}
extension SBObject: FinderColumnViewOptions{}
// the list view options
@objc protocol FinderListViewOptions {
	optional func columns() -> SBElementArray<FinderColumn *>
	optional var calculatesFolderSizes: Bool {get set}
// Are folder sizes calculated and displayed in the window?
	optional var showsIconPreview: Bool {get set}
// displays a preview of the item in list view
	optional var iconSize: FinderLvic {get set}
// the size of icons displayed in the list view
	optional var textSize: NSInteger {get set}
// the size of the text displayed in the list view
	optional var sortColumn: FinderColumn {get set}
// the column that the list view is sorted on
	optional var usesRelativeDates: Bool {get set}
// Are relative dates (e.g., today, yesterday) shown in the list view?
}
extension SBObject: FinderListViewOptions{}
// a column of a list view
@objc protocol FinderColumn {
	optional var index: NSInteger {get set}
// the index in the front-to-back ordering within its container
	optional var name: FinderElsv {get}
// the column name
	optional var sortDirection: FinderSodr {get set}
// The direction in which the window is sorted
	optional var width: NSInteger {get set}
// the width of this column
	optional var minimumWidth: NSInteger {get}
// the minimum allowed width of this column
	optional var maximumWidth: NSInteger {get}
// the maximum allowed width of this column
	optional var visible: Bool {get set}
// is this column visible
}
extension SBObject: FinderColumn{}
// A list of aliases.  Use ‘as alias list’ when a list of aliases is needed (instead of a list of file system item references).
@objc protocol FinderAliasList {
}
extension SBObject: FinderAliasList{}
