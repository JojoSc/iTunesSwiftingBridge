//
//  iTunesFix.swift
//  PartyMasterMac
//
//  Created by Johannes Schreiber on 10/12/15.
//  Copyright © 2015 Johannes Schreiber. All rights reserved.
//

import Foundation
import ScriptingBridge



/**
    This Extension provides some useful methods for iTunes which are either 
    not available or not easy to use via ScriptingBridge
*/
extension iTunesApplication {


    /**
        This function may produce some weird log statements (wtf Apple?!), 
        but it gets the job done. I wonder how long this will last...
     */
    func createPlayList(name:String) {

        let script = "tell application \"iTunes\"\n    make new playlist with properties  {name:\"\(name)\"}\nend tell"
        let scriptObject = NSAppleScript(source: script)
        _ = scriptObject?.executeAndReturnError(nil)
    }


    func playPlayList(name:String) {
        let script = "tell application \"iTunes\"\n    play user playlist \"\(name)\"\nend tell"
        let scriptObject = NSAppleScript(source: script)
        _ = scriptObject?.executeAndReturnError(nil)
    }



    /** 
        Returns nil when either the iTunes Library or the Playlist couldn't be found
    */
    func getPlaylistWithName(name:String) -> iTunesPlaylist? {

        var library:iTunesSource?
        var desiredPlaylist:iTunesPlaylist?

        // Attempt to get the users library
        let sourceArrayOpt = sources?()
        if let sourceArray = sourceArrayOpt {
            for source in sourceArray {
                if source.kind == .iTunesESrcLibrary {
                    library = source
                    break
                }
            }
        }

        // Try to find a playlist with the specified name
        if let lib = library, playListsOpt = lib.playlists?() {
            for playList in playListsOpt {
                if playList.name == name {
                    desiredPlaylist = playList
                    break
                }
            }
        }

        return desiredPlaylist
    }




    /** 
        Add a song to a playlist (which you can get via 'getPlaylistWithName(...)'.
        Pass an URL which points to the file on your harddrive for 'url'. 
     */
    func addSong(url:NSURL, toPlaylist list:iTunesPlaylist) {

        if let castedList = list as? SBObject {
            let track = add?([url], to: castedList)

            if let _ = track {
                // Add Method was called
            } else {
                // Add Method was not implemented. Should'nt happen, but who knows how Apple implemented this...
            }
        }
    }



    /**
        Works like 'addSong(...)', but you can pass an array of file URLs
    */
    func addSongs(urls:[NSURL], toPlaylist list:iTunesPlaylist) {
        let x = list as? SBObject
        add!(urls, to: x!)
    }

}