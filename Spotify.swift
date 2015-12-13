/*
 * Spotify.h
 */
import AppKit
import ScriptingBridge
@objc enum SpotifyEPlS: NSInteger {
	case SpotifyEPlSStopped = 0x6b505353
	case SpotifyEPlSPlaying = 0x6b505350
	case SpotifyEPlSPaused = 0x6b505370
};
/*
 * Spotify Suite
 */
// The Spotify application.
@objc protocol SpotifyApplication {
	optional var currentTrack: SpotifyTrack {get}
// The current playing track.
	optional var soundVolume: NSInteger {get set}
// The sound output volume (0 = minimum, 100 = maximum)
	optional var playerState: SpotifyEPlS {get}
// Is Spotify stopped, paused, or playing?
	optional var playerPosition: CDouble {get set}
// The player’s position within the currently playing track in seconds.
	optional var repeatingEnabled: Bool {get}
// Is repeating enabled in the current playback context?
	optional var repeating: Bool {get set}
// Is repeating on or off?
	optional var shufflingEnabled: Bool {get}
// Is shuffling enabled in the current playback context?
	optional var shuffling: Bool {get set}
// Is shuffling on or off?
	optional func nextTrack()
// Skip to the next track.
	optional func previousTrack()
// Skip to the previous track.
	optional func playpause()
// Toggle play/pause.
	optional func pause()
// Pause playback.
	optional func play()
// Resume playback.
	optional func playTrack(x: NSString, inContext: NSString)
// Start playback of a track in the given context.
}
extension SBApplication: SpotifyApplication{}
// A Spotify track.
@objc protocol SpotifyTrack {
	optional var artist: NSString {get}
// The artist of the track.
	optional var album: NSString {get}
// The album of the track.
	optional var discNumber: NSInteger {get}
// The disc number of the track.
	optional var duration: NSInteger {get}
// The length of the track in seconds.
	optional var playedCount: NSInteger {get}
// The number of times this track has been played.
	optional var trackNumber: NSInteger {get}
// The index of the track in its album.
	optional var starred: Bool {get}
// Is the track starred?
	optional var popularity: NSInteger {get}
// How popular is this track? 0-100
	optional func id() -> NSString
// The ID of the item.
	optional var name: NSString {get}
// The name of the track.
	optional var artwork: NSImage {get}
// The track"s album cover.
	optional var albumArtist: NSString {get}
// That album artist of the track.
	optional var spotifyUrl: NSString {get set}
// The URL of the track.
}
extension SBObject: SpotifyTrack{}
/*
 * Standard Suite
 */
// The application"s top level scripting object.
@objc protocol SpotifyApplication {
	optional var name: NSString {get}
// The name of the application.
	optional var frontmost: Bool {get}
// Is this the frontmost (active) application?
	optional var version: NSString {get}
// The version of the application.
}
extension SBObject: SpotifyApplication{}
