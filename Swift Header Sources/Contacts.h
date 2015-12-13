/*
 * Contacts.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class ContactsApplication, ContactsDocument, ContactsWindow, ContactsAddress, ContactsContactInfo, ContactsAIMHandle, ContactsCustomDate, ContactsEmail, ContactsEntry, ContactsGroup, ContactsICQHandle, ContactsInstantMessage, ContactsJabberHandle, ContactsMSNHandle, ContactsPerson, ContactsPhone, ContactsRelatedName, ContactsSocialProfile, ContactsUrl, ContactsYahooHandle;

enum ContactsSaveOptions {
	ContactsSaveOptionsYes = 'yes ' /* Save the file. */,
	ContactsSaveOptionsNo = 'no  ' /* Do not save the file. */,
	ContactsSaveOptionsAsk = 'ask ' /* Ask the user whether or not to save the file. */
};
typedef enum ContactsSaveOptions ContactsSaveOptions;

enum ContactsPrintingErrorHandling {
	ContactsPrintingErrorHandlingStandard = 'lwst' /* Standard PostScript error handling */,
	ContactsPrintingErrorHandlingDetailed = 'lwdt' /* print a detailed report of PostScript errors */
};
typedef enum ContactsPrintingErrorHandling ContactsPrintingErrorHandling;

enum ContactsSaveableFileFormat {
	ContactsSaveableFileFormatArchive = 'abbu' /* The native Address Book file format */
};
typedef enum ContactsSaveableFileFormat ContactsSaveableFileFormat;

enum ContactsInstantMessageServiceType {
	ContactsInstantMessageServiceTypeAIM = 'az85',
	ContactsInstantMessageServiceTypeFacebook = 'az94',
	ContactsInstantMessageServiceTypeGaduGadu = 'az86',
	ContactsInstantMessageServiceTypeGoogleTalk = 'az87',
	ContactsInstantMessageServiceTypeICQ = 'az88',
	ContactsInstantMessageServiceTypeJabber = 'az89',
	ContactsInstantMessageServiceTypeMSN = 'az90',
	ContactsInstantMessageServiceTypeQQ = 'az91',
	ContactsInstantMessageServiceTypeSkype = 'az92',
	ContactsInstantMessageServiceTypeYahoo = 'az93'
};
typedef enum ContactsInstantMessageServiceType ContactsInstantMessageServiceType;

@protocol ContactsGenericMethods

- (void) closeSaving:(ContactsSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_ as:(ContactsSaveableFileFormat)as;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (void) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy an object.
- (void) moveTo:(SBObject *)to;  // Move an object to a new location.

@end



/*
 * Standard Suite
 */

// The application's top-level scripting object.
@interface ContactsApplication : SBApplication

- (SBElementArray<ContactsDocument *> *) documents;
- (SBElementArray<ContactsWindow *> *) windows;

@property (copy, readonly) NSString *name;  // The name of the application.
@property (readonly) BOOL frontmost;  // Is this the active application?
@property (copy, readonly) NSString *version;  // The version number of the application.

- (id) open:(id)x;  // Open a document.
- (void) print:(id)x withProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) quitSaving:(ContactsSaveOptions)saving;  // Quit the application.
- (BOOL) exists:(id)x;  // Verify that an object exists.
- (id) save;  // Save all Address Book changes. Also see the unsaved property for the application class.
- (NSString *) actionProperty;  // RollOver - Which property this roll over is associated with (Properties can be one of maiden name, phone, email, url, birth date, custom date, related name, aim, icq, jabber, msn, yahoo, address.)
- (NSString *) actionTitleWith:(id)with for:(ContactsPerson *)for_;  // RollOver - Returns the title that will be placed in the menu for this roll over
- (BOOL) performActionWith:(id)with for:(ContactsPerson *)for_;  // RollOver - Performs the action on the given person and value
- (BOOL) shouldEnableActionWith:(id)with for:(ContactsPerson *)for_;  // RollOver - Determines if the rollover action should be enabled for the given person and value

@end

// A document.
@interface ContactsDocument : SBObject <ContactsGenericMethods>

@property (copy, readonly) NSString *name;  // Its name.
@property (readonly) BOOL modified;  // Has it been modified since the last save?
@property (copy, readonly) NSURL *file;  // Its location on disk, if it has one.


@end

// A window.
@interface ContactsWindow : SBObject <ContactsGenericMethods>

@property (copy, readonly) NSString *name;  // The title of the window.
- (NSInteger) id;  // The unique identifier of the window.
@property NSInteger index;  // The index of the window, ordered front to back.
@property NSRect bounds;  // The bounding rectangle of the window.
@property (readonly) BOOL closeable;  // Does the window have a close button?
@property (readonly) BOOL miniaturizable;  // Does the window have a minimize button?
@property BOOL miniaturized;  // Is the window minimized right now?
@property (readonly) BOOL resizable;  // Can the window be resized?
@property BOOL visible;  // Is the window visible right now?
@property (readonly) BOOL zoomable;  // Does the window have a zoom button?
@property BOOL zoomed;  // Is the window zoomed right now?
@property (copy, readonly) ContactsDocument *document;  // The document whose contents are displayed in the window.


@end



/*
 * Address Book Script Suite
 */

@interface ContactsApplication (AddressBookScriptSuite)

- (SBElementArray<ContactsGroup *> *) groups;
- (SBElementArray<ContactsPerson *> *) people;

@property (copy) ContactsPerson *myCard;  // Returns my Address Book card.
@property (readonly) BOOL unsaved;  // Does Address Book have any unsaved changes?
@property (copy) NSArray<ContactsPerson *> *selection;  // Currently selected entries
@property (copy, readonly) id defaultCountryCode;  // Returns the default country code for addresses.

@end

// Address for the given record.
@interface ContactsAddress : SBObject <ContactsGenericMethods>

@property (copy) id city;  // City part of the address.
@property (copy, readonly) id formattedAddress;  // properly formatted string for this address.
@property (copy) id street;  // Street part of the address, multiple lines separated by carriage returns.
- (NSString *) id;  // unique identifier for this address.
- (void) setId: (NSString *) id;
@property (copy) id zip;  // Zip or postal code of the address.
@property (copy) id country;  // Country part of the address.
@property (copy) id label;  // Label.
@property (copy) id countryCode;  // Country code part of the address (should be a two character iso country code).
@property (copy) id state;  // State, Province, or Region part of the address.


@end

// Container object in the database, holds a key and a value
@interface ContactsContactInfo : SBObject <ContactsGenericMethods>

@property (copy) id label;  // Label is the label associated with value like "work", "home", etc.
@property (copy) id value;  // Value.
- (NSString *) id;  // unique identifier for this entry, this is persistent, and stays with the record.


@end

// Arbitrary date associated with this person.
@interface ContactsCustomDate : ContactsContactInfo


@end

// Email address for a person.
@interface ContactsEmail : ContactsContactInfo


@end

// An entry in the address book database
@interface ContactsEntry : SBObject <ContactsGenericMethods>

@property (copy, readonly) NSDate *modificationDate;  // when the contact was last modified.
@property (copy, readonly) NSDate *creationDate;  // when the contact was created.
- (NSString *) id;  // unique and persistent identifier for this record.
@property BOOL selected;  // Is the entry selected?

- (ContactsPerson *) addTo:(SBObject *)to;  // Add a child object.
- (ContactsPerson *) removeFrom:(SBObject *)from;  // Remove a child object.

@end

// A Group Record in the address book database
@interface ContactsGroup : ContactsEntry

- (SBElementArray<ContactsGroup *> *) groups;
- (SBElementArray<ContactsPerson *> *) people;

@property (copy) NSString *name;  // The name of this group.


@end

// Address for instant messaging.
@interface ContactsInstantMessage : ContactsContactInfo

@property (copy, readonly) id serviceName;  // The service name of this instant message address.
@property (copy) id serviceType;  // The service type of this instant message address.
@property (copy) id userName;  // The user name of this instant message address.


@end

// A person in the address book database.
@interface ContactsPerson : ContactsEntry

- (SBElementArray<ContactsUrl *> *) urls;
- (SBElementArray<ContactsAddress *> *) addresses;
- (SBElementArray<ContactsPhone *> *) phones;
- (SBElementArray<ContactsGroup *> *) groups;
- (SBElementArray<ContactsCustomDate *> *) customDates;
- (SBElementArray<ContactsInstantMessage *> *) instantMessages;
- (SBElementArray<ContactsSocialProfile *> *) socialProfiles;
- (SBElementArray<ContactsRelatedName *> *) relatedNames;
- (SBElementArray<ContactsEmail *> *) emails;

@property (copy) id nickname;  // The Nickname of this person.
@property (copy) id organization;  // Organization that employs this person.
@property (copy) id maidenName;  // The Maiden name of this person.
@property (copy) id suffix;  // The Suffix of this person.
@property (copy, readonly) id vcard;  // Person information in vCard format, this always returns a card in version 3.0 format.
@property (copy) id homePage;  // The home page of this person.
@property (copy) id birthDate;  // The birth date of this person.
@property (copy) id phoneticLastName;  // The phonetic version of the Last name of this person.
@property (copy) id title;  // The title of this person.
@property (copy) id phoneticMiddleName;  // The Phonetic version of the Middle name of this person.
@property (copy) id department;  // Department that this person works for.
@property (copy) id image;  // Image for person.
@property (copy, readonly) NSString *name;  // First/Last name of the person, uses the name display order preference setting in Address Book.
@property (copy) id note;  // Notes for this person.
@property BOOL company;  // Is the current record a company or a person.
@property (copy) id middleName;  // The Middle name of this person.
@property (copy) id phoneticFirstName;  // The phonetic version of the First name of this person.
@property (copy) id jobTitle;  // The job title of this person.
@property (copy) id lastName;  // The Last name of this person.
@property (copy) id firstName;  // The First name of this person.


@end

// Phone number for a person.
@interface ContactsPhone : ContactsContactInfo


@end

// Other names related to this person.
@interface ContactsRelatedName : ContactsContactInfo


@end

// Profile for social networks.
@interface ContactsSocialProfile : SBObject <ContactsGenericMethods>

- (NSString *) id;  // The persistent unique identifier for this profile.
@property (copy) id serviceName;  // The service name of this social profile.
@property (copy) id userName;  // The username used with this social profile.
@property (copy) id userIdentifier;  // A service-specific identifier used with this social profile.
@property (copy) id url;  // The URL of this social profile.


@end

// URLs for this person.
@interface ContactsUrl : ContactsContactInfo


@end

