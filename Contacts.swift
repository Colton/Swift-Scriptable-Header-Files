/*
 * Contacts.h
 */
import AppKit
import ScriptingBridge
@objc enum ContactsSaveOptions: NSInteger {
	case ContactsSaveOptionsYes = 0x79657320 /* Save the file. */
	case ContactsSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case ContactsSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum ContactsPrintingErrorHandling: NSInteger {
	case ContactsPrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case ContactsPrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
@objc enum ContactsSaveableFileFormat: NSInteger {
	case ContactsSaveableFileFormatArchive = 0x61626275 /* The native Address Book file format */
};
@objc enum ContactsInstantMessageServiceType: NSInteger {
	case ContactsInstantMessageServiceTypeAIM = 0x617a3835
	case ContactsInstantMessageServiceTypeFacebook = 0x617a3934
	case ContactsInstantMessageServiceTypeGaduGadu = 0x617a3836
	case ContactsInstantMessageServiceTypeGoogleTalk = 0x617a3837
	case ContactsInstantMessageServiceTypeICQ = 0x617a3838
	case ContactsInstantMessageServiceTypeJabber = 0x617a3839
	case ContactsInstantMessageServiceTypeMSN = 0x617a3930
	case ContactsInstantMessageServiceTypeQQ = 0x617a3931
	case ContactsInstantMessageServiceTypeSkype = 0x617a3932
	case ContactsInstantMessageServiceTypeYahoo = 0x617a3933
};
	optional func closeSaving(saving: ContactsSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL, `as`: ContactsSaveableFileFormat)
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
@objc protocol ContactsApplication {
	optional func documents() -> SBElementArray<ContactsDocument *>
	optional func windows() -> SBElementArray<ContactsWindow *>
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
	optional func quitSaving(saving: ContactsSaveOptions)
// Quit the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
	optional func save() -> AnyObject
// Save all Address Book changes. Also see the unsaved property for the application class.
	optional func actionProperty() -> NSString
// RollOver - Which property this roll over is associated with (Properties can be one of maiden name, phone, email, url, birth date, custom date, related name, aim, icq, jabber, msn, yahoo, address.)
	optional func actionTitleWith(with: AnyObject, `for`: ContactsPerson) -> NSString
// RollOver - Returns the title that will be placed in the menu for this roll over
	optional func performActionWith(with: AnyObject, `for`: ContactsPerson) -> Bool
// RollOver - Performs the action on the given person and value
	optional func shouldEnableActionWith(with: AnyObject, `for`: ContactsPerson) -> Bool
// RollOver - Determines if the rollover action should be enabled for the given person and value
}
extension SBApplication: ContactsApplication{}
// A document.
@objc protocol ContactsDocument {
	optional var name: NSString {get}
// Its name.
	optional var modified: Bool {get}
// Has it been modified since the last save?
	optional var file: NSURL {get}
// Its location on disk, if it has one.
}
extension SBObject: ContactsDocument{}
// A window.
@objc protocol ContactsWindow {
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
	optional var document: ContactsDocument {get}
// The document whose contents are displayed in the window.
}
extension SBObject: ContactsWindow{}
/*
 * Address Book Script Suite
 */
@objc protocol ContactsApplication {
	optional func groups() -> SBElementArray<ContactsGroup *>
	optional func people() -> SBElementArray<ContactsPerson *>
	optional var myCard: ContactsPerson {get set}
// Returns my Address Book card.
	optional var unsaved: Bool {get}
// Does Address Book have any unsaved changes?
	optional var selection: *> {get set}
// Currently selected entries
	optional var defaultCountryCode: AnyObject {get}
// Returns the default country code for addresses.
}
extension SBObject: ContactsApplication{}
// Address for the given record.
@objc protocol ContactsAddress {
	optional var city: AnyObject {get set}
// City part of the address.
	optional var formattedAddress: AnyObject {get}
// properly formatted string for this address.
	optional var street: AnyObject {get set}
// Street part of the address, multiple lines separated by carriage returns.
	optional func id() -> NSString
// unique identifier for this address.
	optional func setId(): NSString)
	optional var zip: AnyObject {get set}
// Zip or postal code of the address.
	optional var country: AnyObject {get set}
// Country part of the address.
	optional var label: AnyObject {get set}
// Label.
	optional var countryCode: AnyObject {get set}
// Country code part of the address (should be a two character iso country code).
	optional var state: AnyObject {get set}
// State, Province, or Region part of the address.
}
extension SBObject: ContactsAddress{}
// Container object in the database, holds a key and a value
@objc protocol ContactsContactInfo {
	optional var label: AnyObject {get set}
// Label is the label associated with value like "work", "home", etc.
	optional var value: AnyObject {get set}
// Value.
	optional func id() -> NSString
// unique identifier for this entry, this is persistent, and stays with the record.
}
extension SBObject: ContactsContactInfo{}
// Arbitrary date associated with this person.
@objc protocol ContactsCustomDate: ContactsContactInfo {
}
extension SBObject: ContactsCustomDate{}
// Email address for a person.
@objc protocol ContactsEmail: ContactsContactInfo {
}
extension SBObject: ContactsEmail{}
// An entry in the address book database
@objc protocol ContactsEntry {
	optional var modificationDate: NSDate {get}
// when the contact was last modified.
	optional var creationDate: NSDate {get}
// when the contact was created.
	optional func id() -> NSString
// unique and persistent identifier for this record.
	optional var selected: Bool {get set}
// Is the entry selected?
	optional func addTo(to: SBObject) -> ContactsPerson
// Add a child object.
	optional func removeFrom(from: SBObject) -> ContactsPerson
// Remove a child object.
}
extension SBObject: ContactsEntry{}
// A Group Record in the address book database
@objc protocol ContactsGroup: ContactsEntry {
	optional func groups() -> SBElementArray<ContactsGroup *>
	optional func people() -> SBElementArray<ContactsPerson *>
	optional var name: NSString {get set}
// The name of this group.
}
extension SBObject: ContactsGroup{}
// Address for instant messaging.
@objc protocol ContactsInstantMessage: ContactsContactInfo {
	optional var serviceName: AnyObject {get}
// The service name of this instant message address.
	optional var serviceType: AnyObject {get set}
// The service type of this instant message address.
	optional var userName: AnyObject {get set}
// The user name of this instant message address.
}
extension SBObject: ContactsInstantMessage{}
// A person in the address book database.
@objc protocol ContactsPerson: ContactsEntry {
	optional func urls() -> SBElementArray<ContactsUrl *>
	optional func addresses() -> SBElementArray<ContactsAddress *>
	optional func phones() -> SBElementArray<ContactsPhone *>
	optional func groups() -> SBElementArray<ContactsGroup *>
	optional func customDates() -> SBElementArray<ContactsCustomDate *>
	optional func instantMessages() -> SBElementArray<ContactsInstantMessage *>
	optional func socialProfiles() -> SBElementArray<ContactsSocialProfile *>
	optional func relatedNames() -> SBElementArray<ContactsRelatedName *>
	optional func emails() -> SBElementArray<ContactsEmail *>
	optional var nickname: AnyObject {get set}
// The Nickname of this person.
	optional var organization: AnyObject {get set}
// Organization that employs this person.
	optional var maidenName: AnyObject {get set}
// The Maiden name of this person.
	optional var suffix: AnyObject {get set}
// The Suffix of this person.
	optional var vcard: AnyObject {get}
// Person information in vCard format, this always returns a card in version 3.0 format.
	optional var homePage: AnyObject {get set}
// The home page of this person.
	optional var birthDate: AnyObject {get set}
// The birth date of this person.
	optional var phoneticLastName: AnyObject {get set}
// The phonetic version of the Last name of this person.
	optional var title: AnyObject {get set}
// The title of this person.
	optional var phoneticMiddleName: AnyObject {get set}
// The Phonetic version of the Middle name of this person.
	optional var department: AnyObject {get set}
// Department that this person works for.
	optional var image: AnyObject {get set}
// Image for person.
	optional var name: NSString {get}
// First/Last name of the person, uses the name display order preference setting in Address Book.
	optional var note: AnyObject {get set}
// Notes for this person.
	optional var company: Bool {get set}
// Is the current record a company or a person.
	optional var middleName: AnyObject {get set}
// The Middle name of this person.
	optional var phoneticFirstName: AnyObject {get set}
// The phonetic version of the First name of this person.
	optional var jobTitle: AnyObject {get set}
// The job title of this person.
	optional var lastName: AnyObject {get set}
// The Last name of this person.
	optional var firstName: AnyObject {get set}
// The First name of this person.
}
extension SBObject: ContactsPerson{}
// Phone number for a person.
@objc protocol ContactsPhone: ContactsContactInfo {
}
extension SBObject: ContactsPhone{}
// Other names related to this person.
@objc protocol ContactsRelatedName: ContactsContactInfo {
}
extension SBObject: ContactsRelatedName{}
// Profile for social networks.
@objc protocol ContactsSocialProfile {
	optional func id() -> NSString
// The persistent unique identifier for this profile.
	optional var serviceName: AnyObject {get set}
// The service name of this social profile.
	optional var userName: AnyObject {get set}
// The username used with this social profile.
	optional var userIdentifier: AnyObject {get set}
// A service-specific identifier used with this social profile.
	optional var url: AnyObject {get set}
// The URL of this social profile.
}
extension SBObject: ContactsSocialProfile{}
// URLs for this person.
@objc protocol ContactsUrl: ContactsContactInfo {
}
extension SBObject: ContactsUrl{}
