/*
 * iTunes.h
 */


import AppKit
import ScriptingBridge


// MARK: Enum Definitions -

@objc enum iTunesEKnd: NSInteger {
	case iTunesEKndTrackListing = 0x6b54726b /* a basic listing of tracks within a playlist */
	case iTunesEKndAlbumListing = 0x6b416c62 /* a listing of a playlist grouped by album */
	case iTunesEKndCdInsert = 0x6b434469 /* a printout of the playlist for jewel case inserts */
};


@objc enum iTunesEnum: NSInteger {
	case iTunesEnumStandard = 0x6c777374 /* Standard PostScript error handling */
	case iTunesEnumDetailed = 0x6c776474 /* print a detailed report of PostScript errors */
};


@objc enum iTunesEPlS: NSInteger {
	case iTunesEPlSStopped = 0x6b505353
	case iTunesEPlSPlaying = 0x6b505350
	case iTunesEPlSPaused = 0x6b505370
	case iTunesEPlSFastForwarding = 0x6b505346
	case iTunesEPlSRewinding = 0x6b505352
};


@objc enum iTunesERpt: NSInteger {
	case iTunesERptOff = 0x6b52704f
	case iTunesERptOne = 0x6b527031
	case iTunesERptAll = 0x6b416c6c
};


@objc enum iTunesEVSz: NSInteger {
	case iTunesEVSzSmall = 0x6b565353
	case iTunesEVSzMedium = 0x6b56534d
	case iTunesEVSzLarge = 0x6b56534c
};


@objc enum iTunesESrc: NSInteger {
	case iTunesESrcLibrary = 0x6b4c6962
	case iTunesESrcIPod = 0x6b506f64
	case iTunesESrcAudioCD = 0x6b414344
	case iTunesESrcMP3CD = 0x6b4d4344
	case iTunesESrcRadioTuner = 0x6b54756e
	case iTunesESrcSharedLibrary = 0x6b536864
	case iTunesESrcUnknown = 0x6b556e6b
};


@objc enum iTunesESrA: NSInteger {
	case iTunesESrAAlbums = 0x6b53724c /* albums only */
	case iTunesESrAAll = 0x6b416c6c /* all text fields */
	case iTunesESrAArtists = 0x6b537252 /* artists only */
	case iTunesESrAComposers = 0x6b537243 /* composers only */
	case iTunesESrADisplayed = 0x6b537256 /* visible text fields */
	case iTunesESrASongs = 0x6b537253 /* song names only */
};


@objc enum iTunesESpK: NSInteger {
	case iTunesESpKNone = 0x6b4e6f6e
	case iTunesESpKBooks = 0x6b537041
	case iTunesESpKFolder = 0x6b537046
	case iTunesESpKGenius = 0x6b537047
	case iTunesESpKITunesU = 0x6b537055
	case iTunesESpKLibrary = 0x6b53704c
	case iTunesESpKMovies = 0x6b537049
	case iTunesESpKMusic = 0x6b53705a
	case iTunesESpKPodcasts = 0x6b537050
	case iTunesESpKPurchasedMusic = 0x6b53704d
	case iTunesESpKTVShows = 0x6b537054
};


@objc enum iTunesEVdK: NSInteger {
	case iTunesEVdKNone = 0x6b4e6f6e /* not a video or unknown video kind */
	case iTunesEVdKHomeVideo = 0x6b566448 /* home video track */
	case iTunesEVdKMovie = 0x6b56644d /* movie track */
	case iTunesEVdKMusicVideo = 0x6b566456 /* music video track */
	case iTunesEVdKTVShow = 0x6b566454 /* TV show track */
};


@objc enum iTunesERtK: NSInteger {
	case iTunesERtKUser = 0x6b527455 /* user-specified rating */
	case iTunesERtKComputed = 0x6b527443 /* iTunes-computed rating */
};


@objc enum iTunesEAPD: NSInteger {
	case iTunesEAPDComputer = 0x6b415043
	case iTunesEAPDAirPortExpress = 0x6b415058
	case iTunesEAPDAppleTV = 0x6b415054
	case iTunesEAPDAirPlayDevice = 0x6b41504f
	case iTunesEAPDUnknown = 0x6b415055
};


@objc protocol iTunesGenericMethods {

	optional func printPrintDialog(printDialog: Bool, withProperties: iTunesPrintSettings, kind: iTunesEKnd, theme: NSString)
// Print the specified object(s)
	optional func close()
// Close an object
	optional func delete()
// Delete an element from an object
	optional func duplicateTo(to: SBObject) -> SBObject
// Duplicate one or more object(s)
	optional func exists() -> Bool
// Verify if an object exists
	optional func open()
// open the specified object(s)
	optional func playOnce(once: Bool)
// play the current track or the specified track or file.

}


/*
 * Standard Suite
 */
@objc protocol iTunesPrintSettings {

	optional var copies: NSInteger {get}
// the number of copies of a document to be printed

	optional var collating: Bool {get}
// Should printed copies be collated?

	optional var startingPage: NSInteger {get}
// the first page of the document to be printed

	optional var endingPage: NSInteger {get}
// the last page of the document to be printed

	optional var pagesAcross: NSInteger {get}
// number of logical pages laid across a physical page

	optional var pagesDown: NSInteger {get}
// number of logical pages laid out down a physical page

	optional var errorHandling: iTunesEnum {get}
// how errors are handled

	optional var requestedPrintTime: NSDate {get}
// the time at which the desktop printer should print the document

	optional var printerFeatures: NSArray {get}
// printer specific options

	optional var faxNumber: NSString {get}
// for fax number

	optional var targetPrinter: NSString {get}
// for target printer

}


extension SBObject: iTunesPrintSettings{}




// MARK: - iTunes Application

// The application program
@objc protocol iTunesApplication {

	optional func AirPlayDevices() -> [iTunesAirPlayDevice]
	optional func browserWindows() -> [iTunesBrowserWindow]
	optional func encoders() -> [iTunesEncoder]
	optional func EQPresets() -> [iTunesEQPreset]
    optional func EQWindows() -> [iTunesEQWindow]
    optional func playlistWindows() -> [iTunesPlaylistWindow]
    optional func sources() -> [iTunesSource]
    optional func visuals() -> [iTunesVisual]
    optional func windows() -> [iTunesWindow]

    // is AirPlay currently enabled?
    optional var AirPlayEnabled: Bool {get}

    // is a track currently being converted?
    optional var converting: Bool {get}

    // the currently selected AirPlay device(s)
    optional var currentAirPlayDevices: [iTunesAirPlayDevice] {get set}

    // the currently selected encoder (MP3, AIFF, WAV, etc.)
    optional var currentEncoder: iTunesEncoder {get set}

    // the currently selected equalizer preset
    optional var currentEQPreset: iTunesEQPreset {get set}

    // the playlist containing the currently targeted track
    optional var currentPlaylist: iTunesPlaylist {get}

    // the name of the current song in the playing stream (provided by streaming server)
    optional var currentStreamTitle: NSString {get}

    // the URL of the playing stream or streaming web site (provided by streaming server)
    optional var currentStreamURL: NSString {get}

    // the current targeted track
    optional var currentTrack: iTunesTrack {get}

    // the currently selected visual plug-in
    optional var currentVisual: iTunesVisual {get set}

    // is the equalizer enabled?
    optional var EQEnabled: Bool {get set}

    // true if all AppleScript track indices should be independent of the play order of the owning playlist.
    optional var fixedIndexing: Bool {get set}

    // is iTunes the frontmost application?
    optional var frontmost: Bool {get set}

    // are visuals displayed using the entire screen?
    optional var fullScreen: Bool {get set}

    // the name of the application
    optional var name: NSString {get}

    // has the sound output been muted?
    optional var mute: Bool {get set}

    // the player’s position within the currently playing track in seconds.
    optional var playerPosition: CDouble {get set}

    // is iTunes stopped, paused, or playing?
    optional var playerState: iTunesEPlS {get}

    // the selection visible to the user
    optional var selection: SBObject {get}

    // the sound output volume (0 = minimum, 100 = maximum)
    optional var soundVolume: NSInteger {get set}

    // the version of iTunes
    optional var version: NSString {get}

    // are visuals currently being displayed?
    optional var visualsEnabled: Bool {get set}

    // the size of the displayed visual
    optional var visualSize: iTunesEVSz {get set}

    // the iAd identifier
    optional var iAdIdentifier: NSString {get}

    // Print the specified object(s)
    optional func printPrintDialog(printDialog: Bool, withProperties: iTunesPrintSettings, kind: iTunesEKnd, theme: NSString)

    // run iTunes
    optional func run()

    // quit iTunes
	optional func quit()

    // add one or more files to a playlist
	optional func add(x: [NSURL], to: SBObject) -> iTunesTrack

    // reposition to beginning of current track or go to previous track if already at start of current track
    optional func backTrack()

    // convert one or more files or tracks
    optional func convert(x: [SBObject]) -> iTunesTrack

    // skip forward in a playing track
    optional func fastForward()

    // advance to the next track in the current playlist
    optional func nextTrack()

    // pause playback
    optional func pause()

    // play the current track or the specified track or file.
    optional func playOnce(once: Bool)

    // toggle the playing/paused state of the current track
    optional func playpause()

    // return to the previous track in the current playlist
    optional func previousTrack()

    // disable fast forward/rewind and resume playback, if playing.
    optional func resume()

    // skip backwards in a playing track
    optional func rewind()

    // stop playback
    optional func stop()

    // update the specified iPod
    optional func update()

    // eject the specified iPod
    optional func eject()

    // subscribe to a podcast feed
    optional func subscribe(x: NSString)

    // update all subscribed podcast feeds
    optional func updateAllPodcasts()

    // update podcast feed
    optional func updatePodcast()

    // Opens a Music Store or audio stream URL
    optional func openLocation(x: NSString)
}


extension SBApplication: iTunesApplication{}


// an item
@objc protocol iTunesItem {
	optional var container: SBObject {get}
// the container of the item
	optional func id() -> NSInteger
// the id of the item
	optional var index: NSInteger {get}
// The index of the item in internal application order.
	optional var name: NSString {get set}
// the name of the item
	optional var persistentID: NSString {get}
// the id of the item as a hexadecimal string. This id does not change over time.
	optional var properties: NSDictionary {get set}
// every property of the item
	optional func reveal()
// reveal and select a track or playlist
}


extension SBObject: iTunesItem{}


// an AirPlay device
@objc protocol iTunesAirPlayDevice: iTunesItem {
	optional var active: Bool {get}
// is the device currently being played to?
	optional var available: Bool {get}
// is the device currently available?
	optional var kind: iTunesEAPD {get}
// the kind of the device
	optional var networkAddress: NSString {get}
// the network (MAC) address of the device
	optional func protected() -> Bool
// is the device password- or passcode-protected?
	optional var selected: Bool {get set}
// is the device currently selected?
	optional var supportsAudio: Bool {get}
// does the device support audio playback?
	optional var supportsVideo: Bool {get}
// does the device support video playback?
	optional var soundVolume: NSInteger {get set}
// the output volume for the device (0 = minimum, 100 = maximum)
}


extension SBObject: iTunesAirPlayDevice{}


// a piece of art within a track
@objc protocol iTunesArtwork: iTunesItem {

    // data for this artwork, in the form of a picture
	optional var data: NSImage {get set}

    // description of artwork as a string
    optional var objectDescription: NSString {get set}

    // was this artwork downloaded by iTunes?
    optional var downloaded: Bool {get}

    // the data format for this piece of artwork
    optional var format: NSNumber {get}

    // kind or purpose of this piece of artwork
    optional var kind: NSInteger {get set}

    // data for this artwork, in original format
    optional var rawData: NSData {get set}
}


extension SBObject: iTunesArtwork{}


// converts a track to a specific file format
@objc protocol iTunesEncoder: iTunesItem {
	optional var format: NSString {get}
// the data format created by the encoder
}


extension SBObject: iTunesEncoder{}



// equalizer preset configuration
@objc protocol iTunesEQPreset: iTunesItem {

	optional var band1: CDouble {get set}
// the equalizer 32 Hz band level (-12.0 dB to +12.0 dB)

    optional var band2: CDouble {get set}
// the equalizer 64 Hz band level (-12.0 dB to +12.0 dB)

    optional var band3: CDouble {get set}
// the equalizer 125 Hz band level (-12.0 dB to +12.0 dB)

    optional var band4: CDouble {get set}
// the equalizer 250 Hz band level (-12.0 dB to +12.0 dB)

    optional var band5: CDouble {get set}
// the equalizer 500 Hz band level (-12.0 dB to +12.0 dB)

    optional var band6: CDouble {get set}
// the equalizer 1 kHz band level (-12.0 dB to +12.0 dB)

    optional var band7: CDouble {get set}
// the equalizer 2 kHz band level (-12.0 dB to +12.0 dB)

    optional var band8: CDouble {get set}
// the equalizer 4 kHz band level (-12.0 dB to +12.0 dB)

    optional var band9: CDouble {get set}
// the equalizer 8 kHz band level (-12.0 dB to +12.0 dB)

    optional var band10: CDouble {get set}
// the equalizer 16 kHz band level (-12.0 dB to +12.0 dB)

    optional var modifiable: Bool {get}
// can this preset be modified?

    optional var preamp: CDouble {get set}
// the equalizer preamp level (-12.0 dB to +12.0 dB)

    optional var updateTracks: Bool {get set}
// should tracks which refer to this preset be updated when the preset is renamed or deleted?
}



extension SBObject: iTunesEQPreset{}
// a list of songs/streams
@objc protocol iTunesPlaylist: iTunesItem {
	optional func tracks() -> [iTunesTrack]
	optional var duration: NSInteger {get}
// the total length of all songs (in seconds)
	optional var name: NSString {get set}
// the name of the playlist
	optional var loved: Bool {get set}
// is this playlist loved?
	optional var parent: iTunesPlaylist {get}
// folder which contains this playlist (if any)
	optional var shuffle: Bool {get set}
// play the songs in this playlist in random order?
	optional var size: NSInteger {get}
// the total size of all songs (in bytes)
	optional var songRepeat: iTunesERpt {get set}
// playback repeat mode
	optional var specialKind: iTunesESpK {get}
// special playlist kind
	optional var time: NSString {get}
// the length of all songs in MM:SS format
	optional var visible: Bool {get}
// is this playlist visible in the Source list?
	optional func moveTo(to: SBObject)
// Move playlist(s) to a new location
	optional func searchFor(`for`: NSString, only: iTunesESrA) -> iTunesTrack
// search a playlist for tracks matching the search string. Identical to entering search text in the Search field in iTunes.
}



extension SBObject: iTunesPlaylist{}

@objc protocol iTunesAudioCDPlaylist: iTunesPlaylist {

    // a playlist representing an audio CD
	optional func audioCDTracks() -> [iTunesAudioCDTrack]

    // the artist of the CD
	optional var artist: NSString {get set}

    // is this CD a compilation album?
    optional var compilation: Bool {get set}

    // the composer of the CD
    optional var composer: NSString {get set}

    // the total number of discs in this CD’s album
    optional var discCount: NSInteger {get set}

    // the index of this CD disc in the source album
    optional var discNumber: NSInteger {get set}

    // the genre of the CD
    optional var genre: NSString {get set}

    // the year the album was recorded/released
    optional var year: NSInteger {get set}
}



extension SBObject: iTunesAudioCDPlaylist{}


// the master music library playlist
@objc protocol iTunesLibraryPlaylist: iTunesPlaylist {
	optional func fileTracks() -> [iTunesFileTrack]
	optional func URLTracks() -> [iTunesURLTrack]
	optional func sharedTracks() -> [iTunesSharedTrack]
}


extension SBObject: iTunesLibraryPlaylist{}

// the radio tuner playlist
@objc protocol iTunesRadioTunerPlaylist: iTunesPlaylist {
	optional func URLTracks() -> [iTunesURLTrack]
}


extension SBObject: iTunesRadioTunerPlaylist{}


// a music source (music library, CD, device, etc.)
@objc protocol iTunesSource: iTunesItem {

	optional func audioCDPlaylists() -> [iTunesAudioCDPlaylist]
	optional func libraryPlaylists() -> [iTunesLibraryPlaylist]
    optional func playlists() -> [iTunesPlaylist]
	optional func radioTunerPlaylists() -> [iTunesRadioTunerPlaylist]
	optional func userPlaylists() -> [iTunesUserPlaylist]

	optional var capacity: CLong {get}
// the total size of the source if it has a fixed size

    optional var freeSpace: CLong {get}
// the free space on the source if it has a fixed size

    optional var kind: iTunesESrc {get}

    optional func update()
// update the specified iPod

    optional func eject()
// eject the specified iPod
}

extension SBObject: iTunesSource{}


// playable audio source
@objc protocol iTunesTrack: iTunesItem {

	optional func artworks() -> [iTunesArtwork]

	optional var album: NSString {get set}
// the album name of the track
	optional var albumArtist: NSString {get set}
// the album artist of the track
	optional var albumLoved: Bool {get set}
// is the album for this track loved?
	optional var albumRating: NSInteger {get set}
// the rating of the album for this track (0 to 100)
	optional var albumRatingKind: iTunesERtK {get}
// the rating kind of the album rating for this track
	optional var artist: NSString {get set}
// the artist/source of the track
	optional var bitRate: NSInteger {get}
// the bit rate of the track (in kbps)
	optional var bookmark: CDouble {get set}
// the bookmark time of the track in seconds
	optional var bookmarkable: Bool {get set}
// is the playback position for this track remembered?
	optional var bpm: NSInteger {get set}
// the tempo of this track in beats per minute
	optional var category: NSString {get set}
// the category of the track
	optional var comment: NSString {get set}
// freeform notes about the track
	optional var compilation: Bool {get set}
// is this track from a compilation album?
	optional var composer: NSString {get set}
// the composer of the track
	optional var databaseID: NSInteger {get}
// the common, unique ID for this track. If two tracks in different playlists have the same database ID, they are sharing the same data.
	optional var dateAdded: NSDate {get}
// the date the track was added to the playlist
	optional var objectDescription: NSString {get set}
// the description of the track
	optional var discCount: NSInteger {get set}
// the total number of discs in the source album
	optional var discNumber: NSInteger {get set}
// the index of the disc containing this track on the source album
	optional var duration: CDouble {get}
// the length of the track in seconds
	optional var enabled: Bool {get set}
// is this track checked for playback?
	optional var episodeID: NSString {get set}
// the episode ID of the track
	optional var episodeNumber: NSInteger {get set}
// the episode number of the track
	optional var EQ: NSString {get set}
// the name of the EQ preset of the track
	optional var finish: CDouble {get set}
// the stop time of the track in seconds
	optional var gapless: Bool {get set}
// is this track from a gapless album?
	optional var genre: NSString {get set}
// the music/audio genre (category) of the track
	optional var grouping: NSString {get set}
// the grouping (piece) of the track. Generally used to denote movements within a classical work.
	optional var iTunesU: Bool {get}
// is this track an iTunes U episode?
	optional var kind: NSString {get}
// a text description of the track
	optional var longDescription: NSString {get set}
	optional var loved: Bool {get set}
// is this track loved?
	optional var lyrics: NSString {get set}
// the lyrics of the track
	optional var modificationDate: NSDate {get}
// the modification date of the content of this track
	optional var playedCount: NSInteger {get set}
// number of times this track has been played
	optional var playedDate: NSDate {get set}
// the date and time this track was last played
	optional var podcast: Bool {get}
// is this track a podcast episode?
	optional var rating: NSInteger {get set}
// the rating of this track (0 to 100)
	optional var ratingKind: iTunesERtK {get}
// the rating kind of this track
	optional var releaseDate: NSDate {get}
// the release date of this track
	optional var sampleRate: NSInteger {get}
// the sample rate of the track (in Hz)
	optional var seasonNumber: NSInteger {get set}
// the season number of the track
	optional var shufflable: Bool {get set}
// is this track included when shuffling?
	optional var skippedCount: NSInteger {get set}
// number of times this track has been skipped
	optional var skippedDate: NSDate {get set}
// the date and time this track was last skipped
	optional var show: NSString {get set}
// the show name of the track
	optional var sortAlbum: NSString {get set}
// override string to use for the track when sorting by album
	optional var sortArtist: NSString {get set}
// override string to use for the track when sorting by artist
	optional var sortAlbumArtist: NSString {get set}
// override string to use for the track when sorting by album artist
	optional var sortName: NSString {get set}
// override string to use for the track when sorting by name
	optional var sortComposer: NSString {get set}
// override string to use for the track when sorting by composer
	optional var sortShow: NSString {get set}
// override string to use for the track when sorting by show name
	optional var size: CLong {get}
// the size of the track (in bytes)
	optional var start: CDouble {get set}
// the start time of the track in seconds
	optional var time: NSString {get}
// the length of the track in MM:SS format
	optional var trackCount: NSInteger {get set}
// the total number of tracks on the source album
	optional var trackNumber: NSInteger {get set}
// the index of the track on the source album
	optional var unplayed: Bool {get set}
// is this track unplayed?
	optional var videoKind: iTunesEVdK {get set}
// kind of video track
	optional var volumeAdjustment: NSInteger {get set}
// relative volume adjustment of the track (-100% to 100%)
	optional var year: NSInteger {get set}
// the year the track was recorded/released
}



extension SBObject: iTunesTrack{}


// a track on an audio CD
@objc protocol iTunesAudioCDTrack: iTunesTrack {
	optional var location: NSURL {get}
// the location of the file represented by this track
}

extension SBObject: iTunesAudioCDTrack{}


// a track representing an audio file (MP3, AIFF, etc.)
@objc protocol iTunesFileTrack: iTunesTrack {
	optional var location: NSURL {get set}
// the location of the file represented by this track
	optional func refresh()
// update file track information from the current information in the track’s file
}

extension SBObject: iTunesFileTrack{}


// a track residing in a shared library
@objc protocol iTunesSharedTrack: iTunesTrack {
}

extension SBObject: iTunesSharedTrack{}

// a track representing a network stream
@objc protocol iTunesURLTrack: iTunesTrack {
	optional var address: NSString {get set}
// the URL for this track
	optional func download()
// download podcast episode
}



extension SBObject: iTunesURLTrack{}

// custom playlists created by the user
@objc protocol iTunesUserPlaylist: iTunesPlaylist {
	optional func fileTracks() -> [iTunesFileTrack]
	optional func URLTracks() -> [iTunesURLTrack]
	optional func sharedTracks() -> [iTunesSharedTrack]

	optional var shared: Bool {get set}
// is this playlist shared?
	optional var smart: Bool {get}
// is this a Smart Playlist?
	optional var genius: Bool {get}
// is this a Genius Playlist?
}


extension SBObject: iTunesUserPlaylist{}


// a folder that contains other playlists
@objc protocol iTunesFolderPlaylist: iTunesUserPlaylist {
}

extension SBObject: iTunesFolderPlaylist{}

// a visual plug-in
@objc protocol iTunesVisual: iTunesItem {
}

extension SBObject: iTunesVisual{}


// any window
@objc protocol iTunesWindow: iTunesItem {
	optional var bounds: NSRect {get set}
// the boundary rectangle for the window
	optional var closeable: Bool {get}
// does the window have a close box?
	optional var collapseable: Bool {get}
// does the window have a collapse (windowshade) box?
	optional var collapsed: Bool {get set}
// is the window collapsed?
	optional var position: NSPoint {get set}
// the upper left position of the window
	optional var resizable: Bool {get}
// is the window resizable?
	optional var visible: Bool {get set}
// is the window visible?
	optional var zoomable: Bool {get}
// is the window zoomable?
	optional var zoomed: Bool {get set}
// is the window zoomed?
}



extension SBObject: iTunesWindow{}

// the main iTunes window
@objc protocol iTunesBrowserWindow: iTunesWindow {
	optional var minimized: Bool {get set}
// is the small player visible?
	optional var selection: SBObject {get}
// the selected songs
	optional var view: iTunesPlaylist {get set}
// the playlist currently displayed in the window
}



extension SBObject: iTunesBrowserWindow{}

// the iTunes equalizer window
@objc protocol iTunesEQWindow: iTunesWindow {
	optional var minimized: Bool {get set}
// is the small EQ window visible?
}



extension SBObject: iTunesEQWindow{}

// a sub-window showing a single playlist
@objc protocol iTunesPlaylistWindow: iTunesWindow {
	optional var selection: SBObject {get}
// the selected songs
	optional var view: iTunesPlaylist {get}
// the playlist displayed in the window
}



extension SBObject: iTunesPlaylistWindow{}
