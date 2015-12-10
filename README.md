# iTunesSwiftingBridge

## What is it?

Since the ScriptingBridge framework is a pain in the ass when you want to use it with Swift, I wanted to share my code for iTunes with the world.

<br>

## How to use it


**First steps**:

Drag both files into your project. Then create a variable for your iTunes object:

```
iTunes = SBApplication(bundleIdentifier:"com.apple.iTunes") as? iTunesApplication
```


**Create a playlist:**

```
iTunes?.createPlayList("SomeName")
```

**Add a song to a playlist:**

```
let fileUrl = NSURL(fileURLWithPath: "/Users/You/Desktop/foo.mp3")
let list = iTunes?.getPlaylistWithName("SomeName")
iTunes?.addSong(fileUrl, toPlaylist: list!)
 ```
 
 **Other stuff:**
 
 Of course you can also use all the other functionality that is defined in the *iTunes.swift* file. Some of it works, some of it doesn't. For example, you can get the volume through `let vol = iTunes?.soundVolume`, but if you want to set it, the compiler will give you an error message.
 
 <br>
 
 
### "Your code looks awful, doesn't work and is lacking functionality"

Yes, yes I know. I'm working on it. Until now I couldn't be bothered to manually refactor ~800 lines in the header file with functionality I don't need, some of which are not even valid Swift code. Also, ScriptingBridge is not really easy to work with and for some things I just haven't figured out how to make them work, yet. I will update the code as I'm fixing it.

<br>
<br>


*Thanks to SO user Garrett and his tool [SwiftingBridge](https://github.com/garrett-davidson/SwiftingBridge/) for sparing me the work of manually converting every single line from Objective-C to Swift*