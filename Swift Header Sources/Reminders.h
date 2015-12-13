/*
 * Reminders.h
 */

#import <AppKit/AppKit.h>
#import <ScriptingBridge/ScriptingBridge.h>


@class RemindersApplication, RemindersDocument, RemindersWindow, RemindersAccount, RemindersList, RemindersReminder;

enum RemindersSaveOptions {
	RemindersSaveOptionsYes = 'yes ' /* Save the file. */,
	RemindersSaveOptionsNo = 'no  ' /* Do not save the file. */,
	RemindersSaveOptionsAsk = 'ask ' /* Ask the user whether or not to save the file. */
};
typedef enum RemindersSaveOptions RemindersSaveOptions;

enum RemindersPrintingErrorHandling {
	RemindersPrintingErrorHandlingStandard = 'lwst' /* Standard PostScript error handling */,
	RemindersPrintingErrorHandlingDetailed = 'lwdt' /* print a detailed report of PostScript errors */
};
typedef enum RemindersPrintingErrorHandling RemindersPrintingErrorHandling;

enum RemindersSaveableFileFormat {
	RemindersSaveableFileFormatText = 'ctxt' /* Text File Format */
};
typedef enum RemindersSaveableFileFormat RemindersSaveableFileFormat;

@protocol RemindersGenericMethods

- (void) closeSaving:(RemindersSaveOptions)saving savingIn:(NSURL *)savingIn;  // Close a document.
- (void) saveIn:(NSURL *)in_ as:(RemindersSaveableFileFormat)as;  // Save a document.
- (void) printWithProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) delete;  // Delete an object.
- (void) duplicateTo:(SBObject *)to withProperties:(NSDictionary *)withProperties;  // Copy an object.
- (void) moveTo:(SBObject *)to;  // Move an object to a new location.

@end



/*
 * Standard Suite
 */

// The application's top-level scripting object.
@interface RemindersApplication : SBApplication

- (SBElementArray<RemindersDocument *> *) documents;
- (SBElementArray<RemindersWindow *> *) windows;

@property (copy, readonly) NSString *name;  // The name of the application.
@property (readonly) BOOL frontmost;  // Is this the active application?
@property (copy, readonly) NSString *version;  // The version number of the application.

- (id) open:(id)x;  // Open a document.
- (void) print:(id)x withProperties:(NSDictionary *)withProperties printDialog:(BOOL)printDialog;  // Print a document.
- (void) quitSaving:(RemindersSaveOptions)saving;  // Quit the application.
- (BOOL) exists:(id)x;  // Verify that an object exists.

@end

// A document.
@interface RemindersDocument : SBObject <RemindersGenericMethods>

@property (copy, readonly) NSString *name;  // Its name.
@property (readonly) BOOL modified;  // Has it been modified since the last save?
@property (copy, readonly) NSURL *file;  // Its location on disk, if it has one.


@end

// A window.
@interface RemindersWindow : SBObject <RemindersGenericMethods>

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
@property (copy, readonly) RemindersDocument *document;  // The document whose contents are displayed in the window.


@end



/*
 * Reminders Suite
 */

// the Reminders application
@interface RemindersApplication (RemindersSuite)

- (SBElementArray<RemindersAccount *> *) accounts;
- (SBElementArray<RemindersList *> *) lists;
- (SBElementArray<RemindersReminder *> *) reminders;

@property (copy, readonly) RemindersAccount *defaultAccount;  // the account currently active in the Reminders application
@property (copy, readonly) RemindersList *defaultList;  // the list currently active in the Reminders application

@end

// an account in the Notes application
@interface RemindersAccount : SBObject <RemindersGenericMethods>

- (SBElementArray<RemindersList *> *) lists;

@property (copy, readonly) NSString *name;  // the name of the account
- (NSString *) id;  // the unique identifier of the account


@end

// a list in the Reminders application
@interface RemindersList : SBObject <RemindersGenericMethods>

- (SBElementArray<RemindersReminder *> *) reminders;

@property (copy) NSString *name;  // the name of the list
- (NSString *) id;  // the unique identifier of the list
@property (copy, readonly) RemindersAccount *container;  // the container of the list

- (id) show;  // Show an object in the UI

@end

// a reminder in the Reminders application
@interface RemindersReminder : SBObject <RemindersGenericMethods>

@property (copy) NSString *name;  // the name of the reminder
- (NSString *) id;  // the unique identifier of the reminder
@property (copy) NSString *body;  // the notes attached to the reminder
@property BOOL completed;  // Is the reminder completed?
@property (copy) NSDate *completionDate;  // the completion date of the reminder
@property (copy, readonly) RemindersList *container;  // the container of the reminder
@property (copy, readonly) NSDate *creationDate;  // the creation date of the reminder
@property (copy) NSDate *dueDate;  // the due date of the reminder
@property (copy, readonly) NSDate *modificationDate;  // the modification date of the reminder
@property (copy) NSDate *remindMeDate;  // the remind date of the reminder
@property NSInteger priority;  // the priority of the reminder

- (id) show;  // Show an object in the UI

@end

