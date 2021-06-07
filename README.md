# RedRandom
Plays Pokemon Red Randomly in BizHawk Emulator. For an example of the program in action, see https://youtu.be/Ar0CQFvYDbs.

## Requirements
- Pokemon Red ROM
- [Bizhawk Emulator 2.6.1](https://github.com/TASVideos/BizHawk/releases/) (No guarantee it will work on previous or subsequent versions of Bizhawk, or any other emulator.)
- Windows, probably (I don't think Lua Console is available on the Mac version of Bizhawk, though I'm not sure.)

## Instructions
### Downloading
1. You should have downloaded all the requirements, as well as the files in this git.
2. Put the files in this git somewhere in the Bizhawk folder (I use "\Lua", the Lua folder)
3. Create a folder called "Savestates" in that folder (So that's "\Lua\Savestates" for me).
### Running
4. Edit the editable variables in RedRandom5.LUA
5. Open Tools -> Lua Console.
6. In the Lua Console window, go to Script -> Open Script
7. The program will now play Pokemon Red Randomly!
### Additional
- Config -> Speed/Skip -> Skip 0 (never). I'm not exactly sure if this matters, but it might. It probably doesn't.
- Config -> Hotkeys, Pause. Setting the Pause Hotkey to something like Escape is super helpful. I use it a lot.
### Speed Settings
The following settings will help the program run as fast as it can.
- Config -> Speed/Skip -> Unthrottled. This will remove the restriction on emulation speed.
- Config -> Sound -> Sound Master Enable. Disabling sound will make the program go faster.
- Config -> Display -> Misc -> Absolute Zero. Displaying nothing make the program go even faster.
