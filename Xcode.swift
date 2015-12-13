/*
 * Xcode.h
 */
import AppKit
import ScriptingBridge
@objc enum XcodeSaveOptions: NSInteger {
	case XcodeSaveOptionsYes = 0x79657320 /* Save the file. */
	case XcodeSaveOptionsNo = 0x6e6f2020 /* Do not save the file. */
	case XcodeSaveOptionsAsk = 0x61736b20 /* Ask the user whether or not to save the file. */
};
@objc enum XcodePrintingErrorHandling: NSInteger {
	case XcodePrintingErrorHandlingStandard = 0x6c777374 /* Standard PostScript error handling */
	case XcodePrintingErrorHandlingDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};
@objc enum XcodePwpa: NSInteger {
	case XcodePwpaExecutablesDirectory = 0x70777065
	case XcodePwpaFrameworks = 0x70777066
	case XcodePwpaJavaResources = 0x7077706a
	case XcodePwpaPluginsDirectory = 0x7077706c
	case XcodePwpaProductsDirectory = 0x70777070
	case XcodePwpaResources = 0x70777265
	case XcodePwpaRootVolume = 0x7077706e
	case XcodePwpaSharedFrameworks = 0x70777366
	case XcodePwpaSharedSupport = 0x70777373
	case XcodePwpaWrapper = 0x70777072
};
@objc enum XcodeBmte: NSInteger {
	case XcodeBmteAnalyzerResult = 0x626d7461
	case XcodeBmteError = 0x626d7465
	case XcodeBmteNone = 0x626d746e
	case XcodeBmteNotice = 0x626d746f
	case XcodeBmteWarning = 0x626d7477
};
@objc enum XcodeLied: NSInteger {
	case XcodeLiedCR = 0x63726c65
	case XcodeLiedCRLF = 0x63726c66
	case XcodeLiedLF = 0x6c666c65
	case XcodeLiedPreserveExisting = 0x70656c65
};
@objc enum XcodeFenc: NSInteger {
	case XcodeFencIso2022Japanese = 0x69736a70
	case XcodeFencIsoLatin1 = 0x696c6131
	case XcodeFencIsoLatin2 = 0x696c6132
	case XcodeFencJapaneseEUC = 0x6a657563
	case XcodeFencMacosRoman = 0x6d6f7372
	case XcodeFencNextstep = 0x6e657874
	case XcodeFencNonlossyAscii = 0x6e6c6173
	case XcodeFencShiftJisString = 0x736a6973
	case XcodeFencSymbolString = 0x73796d73
	case XcodeFencUnicode = 0x756e6963
	case XcodeFencUtf8 = 0x75746638
	case XcodeFencWindowsCyrillic = 0x77636f31
	case XcodeFencWindowsGreek = 0x77637033
	case XcodeFencWindowsLatin1 = 0x77637032
	case XcodeFencWindowsLatin2 = 0x77637030
	case XcodeFencWindowsTurkish = 0x77637034
};
@objc enum XcodeReft: NSInteger {
	case XcodeReftAbsolute = 0x61737274
	case XcodeReftBuildProductRelative = 0x62707274
	case XcodeReftCurrentSDKRelative = 0x73647274
	case XcodeReftGroupRelative = 0x67727274
	case XcodeReftOther = 0x6f726674
	case XcodeReftProjectRelative = 0x70727274
	case XcodeReftXcodeFolderRelative = 0x78727274
};
@objc enum XcodeAsms: NSInteger {
	case XcodeAsmsHasConflict = 0x73636373
	case XcodeAsmsLocallyAdded = 0x736c6173
	case XcodeAsmsLocallyModified = 0x736c6d73
	case XcodeAsmsLocallyRemoved = 0x736c7273
	case XcodeAsmsNeedsMerge = 0x736e6d73
	case XcodeAsmsNeedsUpdate = 0x736e6373
	case XcodeAsmsUnknown = 0x73637573
	case XcodeAsmsUpToDate = 0x73756473
};
@objc enum XcodeSaveableFileFormat: NSInteger {
	case XcodeSaveableFileFormatText = 0x63747874 /* Text File Format */
};
@objc enum XcodeXdel: NSInteger {
	case XcodeXdelCPlusPlus = 0x78646570
	case XcodeXdelJava = 0x7864656a
	case XcodeXdelObjectiveC = 0x7864656f
};
@objc enum XcodeXdeh: NSInteger {
	case XcodeXdehAlwaysHide = 0x78646561
	case XcodeXdehAlwaysShow = 0x78646573
	case XcodeXdehHidePerFilter = 0x78646566
};
	optional func closeSaving(saving: XcodeSaveOptions, savingIn: NSURL)
// Close a document.
	optional func saveIn(`in`: NSURL, `as`: XcodeSaveableFileFormat)
// Save a document.
	optional func printPrintDialog(printDialog: Bool)
// Print a document.
	optional func delete()
// Delete an object.
	optional func duplicateTo(to: SBObject, withProperties: NSDictionary)
// Copy an object.
	optional func moveTo(to: SBObject)
// Move an object to a new location.
	optional func buildStaticAnalysis(staticAnalysis: Bool, transcript: Bool, using: XcodeBuildConfigurationType) -> NSString
// Build the indicated target or project in Xcode. If the project is asked to build, then the active target is built.
	optional func cleanRemovingPrecompiledHeaders(removingPrecompiledHeaders: Bool, transcript: Bool, using: XcodeBuildConfigurationType) -> NSString
// Clean the indicated target or project in Xcode. If the project is asked to build, then the active target is cleaned.
	optional func addTo(to: SBObject)
// Adds an existing object to the container specified.
	optional func removeFrom(from: AnyObject)
// Removes the object from the designated container without deleting it.
/*
 * Standard Suite
 */
// The application"s top-level scripting object.
@objc protocol XcodeApplication {
	optional func documents() -> SBElementArray<XcodeDocument *>
	optional func windows() -> SBElementArray<XcodeWindow *>
	optional var name: NSString {get}
// The name of the application.
	optional var frontmost: Bool {get}
// Is this the active application?
	optional var version: NSString {get}
// The version number of the application.
	optional func open(x: AnyObject) -> AnyObject
// Open a document.
	optional func print(x: AnyObject, printDialog: Bool)
// Print a document.
	optional func quitSaving(saving: XcodeSaveOptions)
// Quit the application.
	optional func exists(x: AnyObject) -> Bool
// Verify that an object exists.
	optional func loadDocumentationSetWithPath(x: NSString, display: Bool) -> Bool
// Load documentation set at supplied path.
	optional func pathForApple_ref(x: NSString) -> NSString
// Return path of document containing apple_ref.
	optional func urlstringForDocumentWithUUID(x: NSString) -> NSString
// Return URL of document identified by UUID.
	optional func urlstringForDocumentWithApple_ref(x: NSString) -> NSString
// Return URL of document identified by apple_ref.
	optional func pathForDocumentWithUUID(x: NSString) -> NSString
// Return path of document identified by UUID.
	optional func select(x: AnyObject)
// Sets the selection to the object(s).
	optional func showDocumentWithApple_ref(x: NSString) -> Bool
// Show document containing supplied apple_ref in the documentation window.
	optional func showDocumentWithUUID(x: NSString) -> Bool
// Show document identified by supplied UUID in the documentation window.
	optional func upgradeProjectFile(x: NSURL, `as`: NSString)
// Upgrade the given project file to the latest project file format. This will open the project if the upgrade succeeds.
}
extension SBApplication: XcodeApplication{}
// A document.
@objc protocol XcodeDocument {
	optional var name: NSString {get}
// Its name.
	optional var modified: Bool {get}
// Has it been modified since the last save?
	optional var file: NSURL {get}
// Its location on disk, if it has one.
}
extension SBObject: XcodeDocument{}
// A window.
@objc protocol XcodeWindow {
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
	optional var document: XcodeDocument {get}
// The document whose contents are displayed in the window.
}
extension SBObject: XcodeWindow{}
/*
 * Text Suite
 */
// Rich (styled) text.
@objc protocol XcodeRichText {
	optional func characters() -> SBElementArray<XcodeCharacter *>
	optional func paragraphs() -> SBElementArray<XcodeParagraph *>
	optional func words() -> SBElementArray<XcodeWord *>
	optional func attributeRuns() -> SBElementArray<XcodeAttributeRun *>
	optional func attachments() -> SBElementArray<XcodeAttachment *>
	optional var color: NSColor {get set}
// The color of the text"s first character.
	optional var font: NSString {get set}
// The name of the font of the text"s first character.
	optional var size: NSInteger {get set}
// The size in points of the text"s first character.
}
extension SBObject: XcodeRichText{}
// One of some text"s characters.
@objc protocol XcodeCharacter {
	optional func characters() -> SBElementArray<XcodeCharacter *>
	optional func paragraphs() -> SBElementArray<XcodeParagraph *>
	optional func words() -> SBElementArray<XcodeWord *>
	optional func attributeRuns() -> SBElementArray<XcodeAttributeRun *>
	optional func attachments() -> SBElementArray<XcodeAttachment *>
	optional var color: NSColor {get set}
// Its color.
	optional var font: NSString {get set}
// The name of its font.
	optional var size: NSInteger {get set}
// Its size, in points.
}
extension SBObject: XcodeCharacter{}
// One of some text"s paragraphs.
@objc protocol XcodeParagraph {
	optional func characters() -> SBElementArray<XcodeCharacter *>
	optional func paragraphs() -> SBElementArray<XcodeParagraph *>
	optional func words() -> SBElementArray<XcodeWord *>
	optional func attributeRuns() -> SBElementArray<XcodeAttributeRun *>
	optional func attachments() -> SBElementArray<XcodeAttachment *>
	optional var color: NSColor {get set}
// The color of the paragraph"s first character.
	optional var font: NSString {get set}
// The name of the font of the paragraph"s first character.
	optional var size: NSInteger {get set}
// The size in points of the paragraph"s first character.
}
extension SBObject: XcodeParagraph{}
// One of some text"s words.
@objc protocol XcodeWord {
	optional func characters() -> SBElementArray<XcodeCharacter *>
	optional func paragraphs() -> SBElementArray<XcodeParagraph *>
	optional func words() -> SBElementArray<XcodeWord *>
	optional func attributeRuns() -> SBElementArray<XcodeAttributeRun *>
	optional func attachments() -> SBElementArray<XcodeAttachment *>
	optional var color: NSColor {get set}
// The color of the word"s first character.
	optional var font: NSString {get set}
// The name of the font of the word"s first character.
	optional var size: NSInteger {get set}
// The size in points of the word"s first character.
}
extension SBObject: XcodeWord{}
// A chunk of text that all has the same attributes.
@objc protocol XcodeAttributeRun {
	optional func characters() -> SBElementArray<XcodeCharacter *>
	optional func paragraphs() -> SBElementArray<XcodeParagraph *>
	optional func words() -> SBElementArray<XcodeWord *>
	optional func attributeRuns() -> SBElementArray<XcodeAttributeRun *>
	optional func attachments() -> SBElementArray<XcodeAttachment *>
	optional var color: NSColor {get set}
// Its color.
	optional var font: NSString {get set}
// The name of its font.
	optional var size: NSInteger {get set}
// Its size, in points.
}
extension SBObject: XcodeAttributeRun{}
// A file embedded in text. This is just for use when embedding a file using the make command.
@objc protocol XcodeAttachment: XcodeRichText {
	optional var fileName: NSString {get set}
// The path to the embedded file.
}
extension SBObject: XcodeAttachment{}
/*
 * Xcode Build Phase Suite
 */
// An object that represents a input path that is used by a run script phase.
@objc protocol XcodeInputPath {
	optional var path: NSString {get set}
// The path of the input file.
	optional var runScriptPhase: XcodeRunScriptPhase {get}
// The run script phase that contains this input path.
}
extension SBObject: XcodeInputPath{}
// An object that represents a output path that is used by a run script phase.
@objc protocol XcodeOutputPath {
	optional var path: NSString {get set}
// The path of the output file.
	optional var runScriptPhase: XcodeRunScriptPhase {get}
// The run script phase that contains this output path.
}
extension SBObject: XcodeOutputPath{}
/*
 * Xcode Project Suite
 */
// A type of build configuration available for a project and all its targets. Build configuration types can only be created by duplicating an existing build configuration type.
@objc protocol XcodeBuildConfigurationType {
	optional func id() -> NSString
// The unique identifier for the build configuration type.
	optional var name: NSString {get set}
// The name of this build configuration type.
}
extension SBObject: XcodeBuildConfigurationType{}
// A message generated during a build that usually points to a warning or error in the associated build file.
@objc protocol XcodeBuildMessage {
	optional var buildFile: XcodeBuildFile {get set}
// The build file that contains this build message
	optional var kind: XcodeBmte {get set}
// Indicates the kind of build message.
	optional var location: NSInteger {get set}
// The line number in the file that the build message corresponds to.
	optional var message: NSString {get set}
// The text of the build message.
	optional var path: NSString {get set}
// The absolute path to the file that the build message is referencing.
}
extension SBObject: XcodeBuildMessage{}
// The abstract class for any container.
@objc protocol XcodeContainer {
	optional var fullPath: NSString {get}
// The full path to the project file on disk.
	optional var name: NSString {get}
// The name of this project.
	optional var path: NSString {get}
// The path to the project file on disk.
	optional var readOnly: Bool {get}
// Is the project only open for reading?
	optional var realPath: NSString {get}
// The fully resolved path to the project file on disk. Specifically, all symlinks in the path have been resolved.
	optional var rootGroup: XcodeGroup {get}
// The root of the files & groups hierarchy in the project.
}
extension SBObject: XcodeContainer{}
// The abstract class for any item in a container, one of which is a project.
@objc protocol XcodeContainerItem {
	optional func id() -> NSString
// The unique identifier for the project item.
	optional var comments: NSString {get set}
// Comments about this project item.
	optional var container: XcodeContainer {get}
// The container for this item.
	optional var project: XcodeProject {get}
// The project that contains this item.
}
extension SBObject: XcodeContainerItem{}
// The model for an Xcode project. Note that the item references, file references, and groups elements are read-only. Changing the contents of these element relationships is unsupported.
@objc protocol XcodeProject: XcodeContainer {
	optional func buildConfigurations() -> SBElementArray<XcodeBuildConfiguration *>
	optional func buildConfigurationTypes() -> SBElementArray<XcodeBuildConfigurationType *>
	optional func fileReferences() -> SBElementArray<XcodeFileReference *>
	optional func groups() -> SBElementArray<XcodeGroup *>
	optional func itemReferences() -> SBElementArray<XcodeItemReference *>
	optional func schemes() -> SBElementArray<XcodeScheme *>
	optional func targets() -> SBElementArray<XcodeTarget *>
	optional func Xcode3Groups() -> SBElementArray<XcodeXcode3Group *>
	optional func Xcode3FileReferences() -> SBElementArray<XcodeXcode3FileReference *>
	optional var defaultBuildConfigurationType: XcodeBuildConfigurationType {get set}
// The default build configuration type used when building with xcodebuild if no -configuration option is supplied.
	optional func id() -> NSString
// The unique identifier for the project.
	optional var organizationName: NSString {get set}
// The name to use in the header file of new files created with project templates.  Defaults to Apple Inc.
	optional var projectDirectory: NSString {get}
// The full path to the folder that contains the project file.
	optional var projectFileReference: XcodeFileReference {get}
// A file reference to the core project.pbxproj file itself.
	optional var userFileReference: XcodeFileReference {get}
// A file reference to the current user"s pbxuser file.
}
extension SBObject: XcodeProject{}
// The abstract class for any item in a project.
@objc protocol XcodeProjectItem: XcodeContainerItem {
	optional func id() -> NSString
// The unique identifier for the project item.
	optional func moveTo(to: SBObject)
// Moves an existing object to the container specified.
}
extension SBObject: XcodeProjectItem{}
/*
 * Xcode Build Phase Suite
 */
// A build phase represents a stage in the build of a target.  Each build phase contains a set of build files and information about how to process those files.
@objc protocol XcodeBuildPhase: XcodeProjectItem {
	optional func buildFiles() -> SBElementArray<XcodeBuildFile *>
	optional var name: NSString {get}
// The name of this build phase.
	optional var target: XcodeTarget {get}
// The target that contains this build phase.
}
extension SBObject: XcodeBuildPhase{}
// A build phase that archives its contained items into a class hierarchy or archive file (.jar or .zip file).
@objc protocol XcodeBuildJavaResourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeBuildJavaResourcesPhase{}
// A build file that rezzes any contained .r files into a .rsrc file.
@objc protocol XcodeBuildResourceManagerResourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeBuildResourceManagerResourcesPhase{}
// A build phase that compiles the applescripts that it contains.
@objc protocol XcodeCompileApplescriptsPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCompileApplescriptsPhase{}
// A build phase that compiles its contained files into the target"s binary.
@objc protocol XcodeCompileSourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCompileSourcesPhase{}
// A build phase that copies its contained items into the Resources directory of the target"s wrapped product. Localized files are copied into the proper sub-directory of Resources.
@objc protocol XcodeCopyBundleResourcesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCopyBundleResourcesPhase{}
// A build phase that copies its contained items to a location on disk. 
@objc protocol XcodeCopyFilesPhase: XcodeBuildPhase {
	optional var destinationDirectory: XcodePwpa {get set}
// The base location to copy items relative to. If "root volume" is chosen then "path" is an absolute path. Otherwise "path" is relative to the base location.
	optional var path: NSString {get set}
// The path relative to the destination to copy items to
	optional var runOnlyWhenInstalling: Bool {get set}
// Indicates if the build phase should only be run when performing an install build.
}
extension SBObject: XcodeCopyFilesPhase{}
// A build phase that copies its contained items into the proper locations for public and private headers.
@objc protocol XcodeCopyHeadersPhase: XcodeBuildPhase {
}
extension SBObject: XcodeCopyHeadersPhase{}
// A build phase that links its contained items into the binary produced by the containing target.
@objc protocol XcodeLinkBinaryWithLibrariesPhase: XcodeBuildPhase {
}
extension SBObject: XcodeLinkBinaryWithLibrariesPhase{}
@objc protocol XcodeRunScriptPhase: XcodeBuildPhase {
	optional func inputPaths() -> SBElementArray<XcodeInputPath *>
	optional func outputPaths() -> SBElementArray<XcodeOutputPath *>
	optional var runOnlyWhenInstalling: Bool {get set}
// Indicates if the build phase should only be run when performing an install build.
	optional var shellPath: NSString {get set}
// The absolute path to the shell used by the shell script.
	optional var shellScript: NSString {get set}
// The actual shell script to run during this build phase.
	optional var showEnvironmentVariables: Bool {get set}
// Indicates if shell environment variables should be output to the build log.
}
extension SBObject: XcodeRunScriptPhase{}
/*
 * Xcode Project Suite
 */
// An abstract class that represents a generic breakpoint that is used by the debugger to stop execution in a program. If you want to create breakpoints, use file breakpoints or symbolic breakpoints.
@objc protocol XcodeBreakpoint: XcodeProjectItem {
	optional var automaticallyContinue: Bool {get set}
// Should the debugger automatically continue when it hits this breakpoint after performing any associated breakpoint actions?
	optional var condition: NSString {get set}
// Condition in which breakpoint should stop.
	optional var enabled: Bool {get set}
// Is the breakpoint enabled?
	optional var name: NSString {get}
// The name of this breakpoint.
}
extension SBObject: XcodeBreakpoint{}
// A set of build settings for a target or project. Each target and project has one build configuration for each build configuration type in the project. New build configurations are created automatically when a new build configuration type is created.
@objc protocol XcodeBuildConfiguration: XcodeProjectItem {
	optional func baseBuildSettings() -> SBElementArray<XcodeBaseBuildSetting *>
	optional func buildSettings() -> SBElementArray<XcodeBuildSetting *>
	optional func flattenedBuildSettings() -> SBElementArray<XcodeFlattenedBuildSetting *>
	optional var buildConfigurationType: XcodeBuildConfigurationType {get}
// The associated build configuration type.
	optional var configurationSettingsFile: XcodeFileReference {get set}
// The optional configuration settings file this configuration is based on. May be "missing value".
	optional var name: NSString {get}
// The name of the associated build configuration type.
}
extension SBObject: XcodeBuildConfiguration{}
// A "build file" represents an association between a target and a file reference and tracks any target-specific settings for that file reference.
@objc protocol XcodeBuildFile: XcodeProjectItem {
	optional func buildMessages() -> SBElementArray<XcodeBuildMessage *>
	optional var buildPhase: XcodeBuildPhase {get}
// The build phase that this build file is contained by.
	optional var compiledCodeSize: NSInteger {get}
// The size of the object file generated when compiling the associated file.
	optional var fileReference: XcodeFileReference {get}
// A file reference to the file on disk that this build file represents.
	optional var name: NSString {get}
// The name of this build file.
	optional var target: XcodeTarget {get}
// The target that contains this build file.
}
extension SBObject: XcodeBuildFile{}
// A breakpoint that is defined by a file name:line location.
@objc protocol XcodeFileBreakpoint: XcodeBreakpoint {
	optional var fileReference: XcodeFileReference {get set}
// A reference to the file that contains the breakpoint.
	optional var lineNumber: NSInteger {get set}
// The line number the breakpoint is set on.
}
extension SBObject: XcodeFileBreakpoint{}
// A set of files and options from which to form a project.
@objc protocol XcodeProjectTemplate {
	optional var name: NSString {get}
// The name for the project template.
	optional var objectDescription: NSString {get}
// A description of the project template.
}
extension SBObject: XcodeProjectTemplate{}
// A set of parameters for building, testing, launching or distributing the products of a workspace
@objc protocol XcodeScheme: XcodeContainerItem {
}
extension SBObject: XcodeScheme{}
// A breakpoint that is defined using a symbol name.
@objc protocol XcodeSymbolicBreakpoint: XcodeBreakpoint {
	optional var symbolName: NSString {get set}
// The name of the symbol that the breakpoint stops at.
}
extension SBObject: XcodeSymbolicBreakpoint{}
/*
 * Xcode Reference Suite
 */
// This class represents references to files and folders on disk and to groups in the project model. The item reference does not contain the referred-to item itself@objc protocol XcodeItemReference: XcodeContainerItem {
	optional var buildProductsRelativePath: NSString {get}
// The path to the item referenced relative to the build products folder.
	optional var contents: *> {get}
// A list of the immediate contents of this reference.
	optional var entireContents: *> {get}
// A list of the contents of this reference, including the entire contents of its children.
	optional var fileEncoding: XcodeFenc {get set}
// The file encoding used to display the contents of any text files referenced by this item. In the case of a group or folder reference, this encoding is used for the items contained by this item.
	optional var fullPath: NSString {get}
// The full path to the item referenced.
	optional var group: XcodeGroup {get}
// The group that this reference is contained in.
	optional var indentWidth: NSInteger {get set}
// The number of spaces to indent wrapped lines in the referenced item. In the case of a group or folder reference, this indent width is used for any contained items.
	optional var leaf: Bool {get}
// Indicates if this reference cannot contain other references.
	optional var lineEnding: XcodeLied {get set}
// The style of line endings to use for the referenced item. In the case of a group or folder reference, this style is used for any contained items.
	optional var localized: Bool {get}
// Indicates if this reference refers to a localized item.
	optional var name: NSString {get set}
// The name of this item reference.
	optional var path: NSString {get}
// Returns the path to the item referenced. The format of this path depends on the path type.
	optional var pathType: XcodeReft {get set}
// Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
	optional var projectRelativePath: NSString {get}
// The project relative path to the item referenced.
	optional var realPath: NSString {get}
// The fully resolved path to the item referenced. Specifically, all symlinks in the path have been resolved.
	optional var tabWidth: NSInteger {get set}
// The number of spaces to use for a tab for the referenced item. In the case of a group or folder reference, this value is used for any contained items.
	optional var usesTabs: Bool {get set}
// Indicates if tabs characters should be used instead of spaces when entering tabs. In the case of a group or folder reference, this value is used for any contained items.
}
extension SBObject: XcodeItemReference{}
@objc protocol XcodeFileReference: XcodeItemReference {
	optional var fileKind: NSString {get}
// The identifier for the file type used when referencing the file.
	optional var headRevisionNumber: NSString {get}
// The current SCM head revision for the referenced file. If the file is on a branch this is the top of the branch, not the top of the tree.
	optional var revisionNumber: NSString {get}
// The current SCM revision for the referenced file.
	optional var status: XcodeAsms {get}
// The current SCM status for the referenced file.
	optional var tag: NSString {get}
// The current SCM tag for the referenced file.
}
extension SBObject: XcodeFileReference{}
// A group is a container of references in a project"s group hierarchy.  A group does not represent a specific file or path on disk, but is internal to the project"s structure.
@objc protocol XcodeGroup: XcodeItemReference {
	optional func fileReferences() -> SBElementArray<XcodeFileReference *>
	optional func groups() -> SBElementArray<XcodeGroup *>
	optional func itemReferences() -> SBElementArray<XcodeItemReference *>
}
extension SBObject: XcodeGroup{}
@objc protocol XcodeXcode3FileReference: XcodeFileReference {
	optional func Xcode3FileReferences() -> SBElementArray<XcodeXcode3FileReference *>
	optional var path: NSString {get set}
// Returns the path to the item referenced. The format of this path depends on the path type.
	optional var pathType: XcodeReft {get set}
// Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
}
extension SBObject: XcodeXcode3FileReference{}
// A group is a container of references in a project"s group hierarchy.  A group does not represent a specific file or path on disk, but is internal to the project"s structure.
@objc protocol XcodeXcode3Group: XcodeGroup {
	optional func Xcode3FileReferences() -> SBElementArray<XcodeXcode3FileReference *>
	optional func Xcode3Groups() -> SBElementArray<XcodeXcode3Group *>
	optional var path: NSString {get set}
// Returns the path to the item referenced. The format of this path depends on the path type.
	optional var pathType: XcodeReft {get set}
// Specifies how the reference tries to locate the item it refers to. Xcode does not provide full scripting support to user-defined source trees, and will report such reference types as "other".
}
extension SBObject: XcodeXcode3Group{}
/*
 * Xcode Target Suite
 */
// An object that represents a build setting.
@objc protocol XcodeBuildSetting {
	optional var container: XcodeProjectItem {get}
// The build configuration that contains this build setting.
	optional var name: NSString {get set}
// The unlocalized build setting name (e.g. DSTROOT).
	optional var value: NSString {get set}
// A string value for the build setting.
}
extension SBObject: XcodeBuildSetting{}
// An object that represents the value defined for a build setting in the Configuration Settings File.
@objc protocol XcodeBaseBuildSetting: XcodeBuildSetting {
}
extension SBObject: XcodeBaseBuildSetting{}
// An object that represents the highest precedence value for a build setting.
@objc protocol XcodeFlattenedBuildSetting: XcodeBuildSetting {
}
extension SBObject: XcodeFlattenedBuildSetting{}
// A target is a blueprint for building a product. Besides specifying the type of product to build, a target consists of an ordered list of build phases, a record of "build settings", an Info.plist record (the "product settings"), a list of build rules, and 
@objc protocol XcodeTarget: XcodeProjectItem {
	optional func buildConfigurations() -> SBElementArray<XcodeBuildConfiguration *>
	optional func buildFiles() -> SBElementArray<XcodeBuildFile *>
	optional func buildPhases() -> SBElementArray<XcodeBuildPhase *>
	optional func compileApplescriptsPhases() -> SBElementArray<XcodeCompileApplescriptsPhase *>
	optional func copyFilesPhases() -> SBElementArray<XcodeCopyFilesPhase *>
	optional func runScriptPhases() -> SBElementArray<XcodeRunScriptPhase *>
	optional func targetDependencies() -> SBElementArray<XcodeTargetDependency *>
	optional var buildJavaResourcesPhase: XcodeBuildJavaResourcesPhase {get}
// The "Build Java Resources" build phase for this target if it exists.
	optional var buildResourceManagerResourcesPhase: XcodeBuildResourceManagerResourcesPhase {get}
// The "Build Resource Manager Resources" build phase for this target if it exists.
	optional var compileSourcesPhase: XcodeCompileSourcesPhase {get}
// The "Compile Sources" build phase for this target if it exists.
	optional var copyBundleResourcesPhase: XcodeCopyBundleResourcesPhase {get}
// The "Copy Bundle Resources" build phase for this target if it exists.
	optional var copyHeadersPhase: XcodeCopyHeadersPhase {get}
// The "Copy Headers" build phase for this target if it exists.
	optional var linkBinaryWithLibrariesPhase: XcodeLinkBinaryWithLibrariesPhase {get}
// The "Link Binary with Libraries" build phase for this target if it exists.
	optional var name: NSString {get set}
// The name of this target.
	optional var native: Bool {get}
// Does this target use the native build system?
	optional var productReference: XcodeFileReference {get}
// An item reference to the generated product on disk.
	optional var targetType: NSString {get}
// The type of target. Usually this is related to the type of product the target produces.
}
extension SBObject: XcodeTarget{}
// A target dependency provides a link between a target and another target upon which the first target depends.
@objc protocol XcodeTargetDependency: XcodeProjectItem {
	optional var target: XcodeTarget {get}
// The target that the containing target depends on.
}
extension SBObject: XcodeTargetDependency{}
/*
 * Xcode Application Suite
 */
// The Xcode application.
@objc protocol XcodeApplication {
	optional func breakpoints() -> SBElementArray<XcodeBreakpoint *>
	optional func dataModelDocuments() -> SBElementArray<XcodeDataModelDocument *>
	optional func fileBreakpoints() -> SBElementArray<XcodeFileBreakpoint *>
	optional func fileDocuments() -> SBElementArray<XcodeFileDocument *>
	optional func projects() -> SBElementArray<XcodeProject *>
	optional func projectTemplates() -> SBElementArray<XcodeProjectTemplate *>
	optional func sourceDocuments() -> SBElementArray<XcodeSourceDocument *>
	optional func symbolicBreakpoints() -> SBElementArray<XcodeSymbolicBreakpoint *>
	optional func workspaceDocuments() -> SBElementArray<XcodeWorkspaceDocument *>
	optional var activeWorkspaceDocument: XcodeWorkspaceDocument {get set}
// The active workspace document in Xcode.
}
extension SBObject: XcodeApplication{}
// This subdivides the text into chunks that all have the same attributes.
@objc protocol XcodeAttributeRun {
	optional func richText() -> SBElementArray<XcodeRichText *>
	optional func insertionPoints() -> SBElementArray<XcodeInsertionPoint *>
}
extension SBObject: XcodeAttributeRun{}
// This subdivides the text into characters.
@objc protocol XcodeCharacter {
	optional func richText() -> SBElementArray<XcodeRichText *>
	optional func insertionPoints() -> SBElementArray<XcodeInsertionPoint *>
}
extension SBObject: XcodeCharacter{}
// The insertion point in a document, which is either empty or has an associated text selection.
@objc protocol XcodeInsertionPoint {
	optional var contents: NSString {get set}
// The contents at the insertion point.
}
extension SBObject: XcodeInsertionPoint{}
// This subdivides the text into paragraphs.
@objc protocol XcodeParagraph {
	optional func richText() -> SBElementArray<XcodeRichText *>
	optional func insertionPoints() -> SBElementArray<XcodeInsertionPoint *>
}
extension SBObject: XcodeParagraph{}
// An object that represents a block of text.
@objc protocol XcodeRichText {
	optional func richText() -> SBElementArray<XcodeRichText *>
	optional func insertionPoints() -> SBElementArray<XcodeInsertionPoint *>
}
extension SBObject: XcodeRichText{}
// This subdivides the text into words.
@objc protocol XcodeWord {
	optional func richText() -> SBElementArray<XcodeRichText *>
	optional func insertionPoints() -> SBElementArray<XcodeInsertionPoint *>
}
extension SBObject: XcodeWord{}
/*
 * Xcode Document Suite
 */
// An Xcode 3.2 compatible document.
@objc protocol XcodeDocument {
	optional var path: NSString {get set}
// The document"s path.
}
extension SBObject: XcodeDocument{}
// A document that represents a file on disk. It also provides access to the window it appears in.
@objc protocol XcodeFileDocument: XcodeDocument {
}
extension SBObject: XcodeFileDocument{}
// A document that represents a text file on disk. It also provides access to the window it appears in.
@objc protocol XcodeTextDocument: XcodeFileDocument {
	optional var contents: NSString {get set}
// The contents of the text file.
	optional var notifiesWhenClosing: Bool {get set}
// Should Xcode notify other apps when this document is closed?
	optional var selectedCharacterRange: *> {get set}
// The first and last character positions in the selection.
	optional var selectedParagraphRange: *> {get set}
// The first and last paragraph positions that contain the selection.
	optional var selection: SBObject {get set}
// The current selection in the text document.
	optional var text: NSString {get set}
// The text of the text file referenced.
}
extension SBObject: XcodeTextDocument{}
// A document that represents a source file on disk. It also provides access to the window it appears in.
@objc protocol XcodeSourceDocument: XcodeTextDocument {
	optional var editorSettings: NSDictionary {get set}
// A record of source editor settings and values.
}
extension SBObject: XcodeSourceDocument{}
// A document that represents a workspace on disk. It also provides access to the window it appears in.
@objc protocol XcodeWorkspaceDocument: XcodeDocument {
	optional func breakpoints() -> SBElementArray<XcodeBreakpoint *>
	optional func buildMessages() -> SBElementArray<XcodeBuildMessage *>
	optional func fileBreakpoints() -> SBElementArray<XcodeFileBreakpoint *>
	optional func fileReferences() -> SBElementArray<XcodeFileReference *>
	optional func groups() -> SBElementArray<XcodeGroup *>
	optional func itemReferences() -> SBElementArray<XcodeItemReference *>
	optional func projects() -> SBElementArray<XcodeProject *>
	optional func schemes() -> SBElementArray<XcodeScheme *>
	optional func symbolicBreakpoints() -> SBElementArray<XcodeSymbolicBreakpoint *>
	optional func Xcode3Groups() -> SBElementArray<XcodeXcode3Group *>
	optional func Xcode3FileReferences() -> SBElementArray<XcodeXcode3FileReference *>
	optional var breakpointsEnabled: Bool {get set}
// Are breakpoints enabled in this workspace?
	optional var intermediatesDirectory: NSString {get set}
// The full path to the folder that contains all intermediate files for the project.
	optional var productDirectory: NSString {get set}
// The full path to the folder that contains any built products.
}
extension SBObject: XcodeWorkspaceDocument{}
/*
 * Xcode Design Tools Suite
 */
// Data model attributes of the entity
@objc protocol XcodeAttribute {
	optional var attributeType: NSString {get}
// The CoreData type of the attribute
	optional var defaultValue: NSString {get}
// Default value of the attribute
	optional var name: NSString {get set}
// Attribute name
	optional var optional: Bool {get set}
// Is the attribute optional?
	optional var transient: Bool {get set}
// Is the attribute transient?
	optional var userInfo: NSDictionary {get set}
// User info dictionary for the attribute
}
extension SBObject: XcodeAttribute{}
// Document containing a Data Model for generating Core Data schema
@objc protocol XcodeDataModelDocument: XcodeFileDocument {
	optional func entities() -> SBElementArray<XcodeEntity *>
	optional var name: NSString {get}
// The name of the document
}
extension SBObject: XcodeDataModelDocument{}
// Entity in a data model
@objc protocol XcodeEntity {
	optional func attributes() -> SBElementArray<XcodeAttribute *>
	optional func fetchRequests() -> SBElementArray<XcodeFetchRequest *>
	optional func fetchedProperties() -> SBElementArray<XcodeFetchedProperty *>
	optional func relationships() -> SBElementArray<XcodeRelationship *>
	optional var abstract: Bool {get set}
// Is the entity abstract?
	optional var name: NSString {get set}
// Name of the entity
	optional var objectClass: NSString {get set}
// The Objective C class of the object backing this entity
	optional var parent: XcodeEntity {get}
// Parent from which the entity inherits
	optional var userInfo: NSDictionary {get set}
// User info dictionary for the entity
}
extension SBObject: XcodeEntity{}
// Fetch Requests of the schema associated with this entity
@objc protocol XcodeFetchRequest {
	optional var name: NSString {get set}
// Fetch Request name
	optional var predicate: NSString {get set}
// Text form of the predicate for the Fetch Request
}
extension SBObject: XcodeFetchRequest{}
// Entity attribute whose value is fetched from the database dynamically
@objc protocol XcodeFetchedProperty {
	optional var destination: XcodeEntity {get set}
// The destination entity of the fetched property
	optional var name: NSString {get set}
// Fetched Property attribute name
	optional var optional: Bool {get set}
// Is the attribute optional?
	optional var predicate: NSString {get set}
// Text form of the predicate that selects the property
	optional var transient: Bool {get set}
// Is the attribute transient?
	optional var userInfo: NSDictionary {get set}
// User info dictionary for the attribute
}
extension SBObject: XcodeFetchedProperty{}
// A relationship from a data model entity to another
@objc protocol XcodeRelationship {
	optional var destinationEntity: XcodeEntity {get set}
// The other entity related to this one.
	optional var inverseRelationship: XcodeRelationship {get set}
// The relationship that the related element has to this one.
	optional var maximumCount: NSInteger {get set}
// Maximum number of related data objects
	optional var minimumCount: NSInteger {get set}
// Minimum number of related data objects
	optional var name: NSString {get set}
// Name of the relationship
	optional var optional: Bool {get set}
// Is the relationship optional?
	optional var toMany: Bool {get set}
// Is the relationship a “to-many” relationship?
	optional var transient: Bool {get set}
// Is the relationship transient?
	optional var userInfo: NSDictionary {get set}
// User information dictionary for the relationship
}
extension SBObject: XcodeRelationship{}
