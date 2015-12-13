/*
 * Messages.h
 */
import AppKit
import ScriptingBridge
@objc enum MessagesSaveOptions: NSInteger {
	case MessagesSaveOptionsYes = 0x79657320 /* Save the file. */
	case MessagesSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case MessagesSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum MessagesInviteType: NSInteger {
	case MessagesInviteTypeAudioInvitation = 0x61636f6e
	case MessagesInviteTypeTextChatInvitation = 0x74636f6e
	case MessagesInviteTypeVideoInvitation = 0x76636f6e
};
@objc enum MessagesAccountStatus: NSInteger {
	case MessagesAccountStatusAvailable = 0x6176616c
	case MessagesAccountStatusAway = 0x61776179
	case MessagesAccountStatusOffline = 0x6f66666c
	case MessagesAccountStatusInvisible = 0x696e7673
	case MessagesAccountStatusIdle = 0x69646c65
	case MessagesAccountStatusUnknown = 0x756e6b6e
};
@objc enum MessagesMyStatus: NSInteger {
	case MessagesMyStatusAway = 0x61776179
	case MessagesMyStatusAvailable = 0x6176616c
	case MessagesMyStatusOffline = 0x6f66666c
	case MessagesMyStatusInvisible = 0x696e7673
};
@objc enum MessagesConnectionStatus: NSInteger {
	case MessagesConnectionStatusDisconnecting = 0x64636e67
	case MessagesConnectionStatusConnected = 0x636f6e6e
	case MessagesConnectionStatusConnecting = 0x636f6e67
	case MessagesConnectionStatusDisconnected = 0x64636f6e
};
@objc enum MessagesCapabilities: NSInteger {
	case MessagesCapabilitiesVideoChat = 0x76636f6e
	case MessagesCapabilitiesAudioChat = 0x61636f6e
	case MessagesCapabilitiesMultipersonVideo = 0x6d777663
	case MessagesCapabilitiesMultipersonAudio = 0x6d776163
};
@objc enum MessagesServiceType: NSInteger {
	case MessagesServiceTypeAIM = 0x7361696d
	case MessagesServiceTypeBonjour = 0x73737562
	case MessagesServiceTypeJabber = 0x736a6162
	case MessagesServiceTypeIMessage = 0x73696d73
};
@objc enum MessagesDirection: NSInteger {
	case MessagesDirectionIncoming = 0x46546963
	case MessagesDirectionOutgoing = 0x46546f67
};
@objc enum MessagesTransferStatus: NSInteger {
	case MessagesTransferStatusPreparing = 0x46547370
	case MessagesTransferStatusWaiting = 0x46547377
	case MessagesTransferStatusTransferring = 0x46547367
	case MessagesTransferStatusFinalizing = 0x4654737a
	case MessagesTransferStatusFinished = 0x46547366
	case MessagesTransferStatusFailed = 0x46547365
};
@objc enum MessagesAvType: NSInteger {
	case MessagesAvTypeAudio = 0x49434161
	case MessagesAvTypeVideo = 0x49434176
};
@objc enum MessagesChatType: NSInteger {
	case MessagesChatTypeInstantMessage = 0x4943696d
	case MessagesChatTypeDirectInstantMessage = 0x49436469
	case MessagesChatTypeChatRoom = 0x49436372
};
@objc enum MessagesJoinState: NSInteger {
	case MessagesJoinStateNotJoined = 0x49434a63
	case MessagesJoinStateJoining = 0x49434a67
	case MessagesJoinStateJoined = 0x49434a6a
};
@objc enum MessagesAvConnectionStatus: NSInteger {
	case MessagesAvConnectionStatusInvited = 0x49434169
	case MessagesAvConnectionStatusWaiting = 0x49434177
	case MessagesAvConnectionStatusConnecting = 0x49434178
	case MessagesAvConnectionStatusConnected = 0x49434163
	case MessagesAvConnectionStatusEnded = 0x4943416e
};
	optional func closeSaving(saving: MessagesSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL, `as`: NSString)
// Save a document.
	optional func delete()
// Delete an object.
	optional func duplicateTo(to: SBObject, withProperties: NSDictionary) -> SBObject
// Copy object(s) and put the copies at a new location.
	optional func exists() -> Bool
// Verify if an object exists.
	optional func moveTo(to: SBObject) -> SBObject
// Move object(s) to a new location.
/*
 * Standard Suite
 */
// A scriptable object.
@objc protocol MessagesItem {
	optional var properties: NSDictionary {get set}
// All of the object"s properties.
}
extension SBObject: MessagesItem{}
// The application"s top-level scripting object.
@objc protocol MessagesApplication {
	optional func documents() -> SBElementArray<MessagesDocument *>
	optional func windows() -> SBElementArray<MessagesWindow *>
	optional var name: NSString {get}
// The name of the application.
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var version: NSString {get}
// The version of the application.
	optional func open(x: NSArray<NSURL *>)
// Open a document.
	optional func print(x: NSURL)
// Print an object.
	optional func quitSaving(saving: MessagesSaveOptions)
// Quit the application.
	optional func invite(x: NSArray<MessagesBuddy *>, to: AnyObject, withMessage: NSString)
// Invites a buddy to join an existing chat.
	optional func logIn()
// Log in to the specified service, or all services if none is specified. If the account password is not in the keychain the user will be prompted to enter one.
	optional func logOut()
// Logs out of a service, or all services if none is specified.
	optional func send(x: AnyObject, to: AnyObject)
// Sends a message or file to a buddy or to a chat.
	optional func storeRecentPicture()
// Stores the currently set buddy picture into your recent pictures.
	optional func showChatChooserFor(`for`: MessagesBuddy)
// displays a dialog in Messages to start a new chat with the specified buddy
}
extension SBApplication: MessagesApplication{}
// A color.
@objc protocol MessagesColor {
}
extension SBObject: MessagesColor{}
// An Messages document.
@objc protocol MessagesDocument {
	optional var name: NSString {get}
// The document"s name.
	optional var modified: Bool {get}
// Has the document been modified since the last save?
	optional var file: NSURL {get}
// The document"s location on disk.
}
extension SBObject: MessagesDocument{}
// A window.
@objc protocol MessagesWindow {
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
	optional var minimizable: Bool {get}
// Whether the window can be minimized.
	optional var minimized: Bool {get set}
// Whether the window is currently minimized.
	optional var resizable: Bool {get}
// Whether the window can be resized.
	optional var visible: Bool {get set}
// Whether the window is currently visible.
	optional var zoomable: Bool {get}
// Whether the window can be zoomed.
	optional var zoomed: Bool {get set}
// Whether the window is currently zoomed.
	optional var document: MessagesDocument {get}
// The document whose contents are being displayed in the window.
}
extension SBObject: MessagesWindow{}
/*
 * Text Suite
 */
// Rich (styled) text
@objc protocol MessagesRichText {
	optional func characters() -> SBElementArray<MessagesCharacter *>
	optional func paragraphs() -> SBElementArray<MessagesParagraph *>
	optional func words() -> SBElementArray<MessagesWord *>
	optional func attributeRuns() -> SBElementArray<MessagesAttributeRun *>
	optional func attachments() -> SBElementArray<MessagesAttachment *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: CDouble {get set}
// The size in points of the first character.
}
extension SBObject: MessagesRichText{}
// This subdivides the text into characters.
@objc protocol MessagesCharacter {
	optional func characters() -> SBElementArray<MessagesCharacter *>
	optional func paragraphs() -> SBElementArray<MessagesParagraph *>
	optional func words() -> SBElementArray<MessagesWord *>
	optional func attributeRuns() -> SBElementArray<MessagesAttributeRun *>
	optional func attachments() -> SBElementArray<MessagesAttachment *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: MessagesCharacter{}
// This subdivides the text into paragraphs.
@objc protocol MessagesParagraph {
	optional func characters() -> SBElementArray<MessagesCharacter *>
	optional func paragraphs() -> SBElementArray<MessagesParagraph *>
	optional func words() -> SBElementArray<MessagesWord *>
	optional func attributeRuns() -> SBElementArray<MessagesAttributeRun *>
	optional func attachments() -> SBElementArray<MessagesAttachment *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: MessagesParagraph{}
// This subdivides the text into words.
@objc protocol MessagesWord {
	optional func characters() -> SBElementArray<MessagesCharacter *>
	optional func paragraphs() -> SBElementArray<MessagesParagraph *>
	optional func words() -> SBElementArray<MessagesWord *>
	optional func attributeRuns() -> SBElementArray<MessagesAttributeRun *>
	optional func attachments() -> SBElementArray<MessagesAttachment *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: MessagesWord{}
// This subdivides the text into chunks that all have the same attributes.
@objc protocol MessagesAttributeRun {
	optional func characters() -> SBElementArray<MessagesCharacter *>
	optional func paragraphs() -> SBElementArray<MessagesParagraph *>
	optional func words() -> SBElementArray<MessagesWord *>
	optional func attributeRuns() -> SBElementArray<MessagesAttributeRun *>
	optional func attachments() -> SBElementArray<MessagesAttachment *>
	optional var color: NSColor {get set}
// The color of the first character.
	optional var font: NSString {get set}
// The name of the font of the first character.
	optional var size: NSInteger {get set}
// The size in points of the first character.
}
extension SBObject: MessagesAttributeRun{}
// Represents an inline text attachment. This class is used mainly for make commands.
@objc protocol MessagesAttachment: MessagesRichText {
	optional var file: NSURL {get}
// The path to the file for the attachment
}
extension SBObject: MessagesAttachment{}
/*
 * Messages Suite
 */
// Messages application.
@objc protocol MessagesApplication {
	optional func buddies() -> SBElementArray<MessagesBuddy *>
	optional func services() -> SBElementArray<MessagesService *>
	optional func fileTransfers() -> SBElementArray<MessagesFileTransfer *>
	optional func chats() -> SBElementArray<MessagesChat *>
	optional func textChats() -> SBElementArray<MessagesTextChat *>
	optional func audioChats() -> SBElementArray<MessagesAudioChat *>
	optional func videoChats() -> SBElementArray<MessagesVideoChat *>
	optional func authorizationRequests() -> SBElementArray<MessagesAuthorizationRequest *>
	optional var idleTime: NSInteger {get}
// Time in seconds that I have been idle.
	optional var image: NSImage {get set}
// My image as it appears in all services.
	optional var status: MessagesMyStatus {get set}
// My status on all services.
	optional var statusMessage: NSString {get set}
// My status message, visible to other people while I am online.
	optional var activeAvChat: MessagesAudioChat {get set}
// The currently active audio or video chat.
}
extension SBObject: MessagesApplication{}
// A buddy on a service.
@objc protocol MessagesBuddy: MessagesItem {
	optional func id() -> NSString
// The buddy"s service and handle. For example: AIM:JohnDoe007
	optional var service: MessagesService {get}
// The service on which this buddy exists.
	optional var name: NSString {get}
// The buddy"s name as it appears in the buddy list.
	optional var handle: NSString {get}
// The buddy"s online account name.
	optional var status: MessagesAccountStatus {get}
// The buddy"s current status.
	optional var statusMessage: NSString {get}
// The buddy"s current status message.
	optional var idleTime: NSInteger {get}
// The time in seconds the buddy has been idle.
	optional var capabilities: *> {get}
// The buddy"s messaging capabilities.
	optional var image: NSImage {get}
// The buddy"s custom image.
	optional var firstName: NSString {get}
// The first name from this buddy"s Contacts card, if available
	optional var lastName: NSString {get}
// The last name from this buddy"s Contacts card, if available
	optional var fullName: NSString {get}
// The full name from this buddy"s Contacts card, if available
}
extension SBObject: MessagesBuddy{}
// A service that can be logged in from this system
@objc protocol MessagesService: MessagesItem {
	optional func buddies() -> SBElementArray<MessagesBuddy *>
	optional func chats() -> SBElementArray<MessagesChat *>
	optional func id() -> NSString
// A guid identifier for this service.
	optional var name: NSString {get set}
// The name of this service as defined in Account preferences description field
	optional var enabled: Bool {get set}
// Is the service enabled?
	optional var connectionStatus: MessagesConnectionStatus {get}
// The connection status for this account.
	optional var status: MessagesMyStatus {get set}
// My status on this service.
	optional var statusMessage: NSString {get set}
// My status message, visible to other people on this service while I am online.
	optional var serviceType: MessagesServiceType {get}
// The type of protocol for this service
	optional func logIn()
// Log in to the specified service, or all services if none is specified. If the account password is not in the keychain the user will be prompted to enter one.
	optional func logOut()
// Logs out of a service, or all services if none is specified.
}
extension SBObject: MessagesService{}
// An audio, video, or text chat.
@objc protocol MessagesChat {
	optional func id() -> NSString
// A guid identifier for this chat.
	optional var service: MessagesService {get}
// The service which is participating in this chat.
	optional var participants: *> {get}
// Other participants of this chat. This property may be specified at time of creation.
	optional var secure: Bool {get}
// Is this chat secure?
	optional var invitation: Bool {get}
// Is this an invitation to a chat?
	optional var active: Bool {get}
// Is this chat currently active?
	optional var started: NSDate {get}
// The date on which this chat started.
	optional var updated: NSDate {get}
// The date when this chat was last updated.
	optional func accept()
// Accepts an incoming text, audio, or video chat invitation, or file transfer
	optional func decline()
// Declines an incoming text, audio, or video chat invitation, or file transfer
}
extension SBObject: MessagesChat{}
// A text chat.
@objc protocol MessagesTextChat: MessagesChat {
	optional var subject: NSString {get}
// The subject of this chat, if available.
	optional var invitationMessage: NSString {get}
// An invitation message. This may only be specified at the time of creation. This message will be sent to chat participants when the chat is created.
	optional var joinState: MessagesJoinState {get}
// How you are joined to this chat
	optional var name: NSString {get}
// The address or room name of this chat. This property may be specified at time of creation.
	optional var chatType: MessagesChatType {get}
// The type of this chat.
}
extension SBObject: MessagesTextChat{}
// An audio or video chat.
@objc protocol MessagesAudioChat: MessagesChat {
	optional var muted: Bool {get set}
// Is the chat muted?
	optional var avConnectionStatus: MessagesAvConnectionStatus {get}
// The connection state for this av chat.
	optional func requestRecording()
// Sends a recording request to all participants of an audio or video chat. Recording will not start until all participants have agreed to allow recording.
	optional func stopRecording()
// Ends recording of an audio or video chat.
}
extension SBObject: MessagesAudioChat{}
@objc protocol MessagesVideoChat: MessagesAudioChat {
	optional var paused: Bool {get set}
// Is the chat paused?
	optional var showingFullScreen: Bool {get set}
// Is the chat being displayed in full screen mode?
	optional var showingLocalVideo: Bool {get set}
// Is the local video preview being displayed?
	optional func takeSnapshot()
// Takes a snapshot of a video chat and saves it to a desktop.
}
extension SBObject: MessagesVideoChat{}
// A request to be added to someone else"s buddy list
@objc protocol MessagesAuthorizationRequest: MessagesItem {
	optional func id() -> NSString
// The guid for this authorization request
	optional var service: MessagesService {get}
// The service on which authorization was requested.
	optional var buddy: MessagesBuddy {get}
// The buddy requesting authorization
}
extension SBObject: MessagesAuthorizationRequest{}
// A file being sent or received
@objc protocol MessagesFileTransfer: MessagesItem {
	optional func id() -> NSString
// The guid for this file transfer
	optional var name: NSString {get}
// The name of this file
	optional var file: NSURL {get}
// The local path to this file transfer
	optional var direction: MessagesDirection {get}
// The direction in which this file is being sent
	optional var service: MessagesService {get}
// The service on which this file transfer is taking place
	optional var buddy: MessagesBuddy {get}
// The account participating in this file transfer
	optional var secure: Bool {get}
// Is this file transfer secure?
	optional var fileSize: NSInteger {get}
// The total size in bytes of the completed file transfer
	optional var fileProgress: NSInteger {get}
// The number of bytes that have been transferred
	optional var transferStatus: MessagesTransferStatus {get}
// The current status of this file transfer
	optional var started: NSDate {get}
// The date that this file transfer started
	optional func accept()
// Accepts an incoming text, audio, or video chat invitation, or file transfer
	optional func decline()
// Declines an incoming text, audio, or video chat invitation, or file transfer
}
extension SBObject: MessagesFileTransfer{}
