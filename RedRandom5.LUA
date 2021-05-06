---- INFORMATION -----------------------------------------------
-- Created: May 5, 2021
-- Last updated: May 5, 2021
-- By: Willow
-- Description: This script will play Pokemon Red Randomly until the parcel is gotten from Professor Oak. 
-- Game information is saved in save files, which are updated periodically.

---- DATA STORAGE ----
-- These files help the program function properly. 
-- Save files can be loaded, and saved, in order to record information about the game.
-- State files (States) are files that are loaded to return to an emulator state.

-- SAVE FILES --
-- buttons_{save_file_name}.txt
---- The first line contains the number of frames in the recording so far.
---- The next 8 lines contain the number of frames the associated button has been pressed.
---- The buttons are in this order: Up, Down, Left, Right, Start, Select, A, B.

-- STATES --
-- blank.state
---- Blank state. No saved files. Default settings. Used for initializing.

---- TO DO ----
-- Add Positions save file.
----------------------------------------------------------------

---- VARIABLES TO EDIT FOR EACH RUN ----
end_frame = 1000 -- Set to -1 for forever
update_multiple = 1000
save_file_name = "Test1"
start_new = false -- Set to true if starting a new run with the same name. Set to false if continuing a run.

---- FUNCTIONS ----
function create_file_names()
	buttons_name = save_file_name.."_buttons.txt"
	temp_name = save_file_name.."_temp.txt"
end
function create_new_update_variables()
	new_buttons = {0,0,0,0,0,0,0,0}
end
function initialize_savefiles()
	save_new_buttons(new_buttons)
end

function update_buttons()
	local file = io.open(buttons_name,"r")
	local temp = io.open(temp_name,"w")
	io.input(file)
	io.output(temp)
	io.read("*line")
	io.write(frame.."\n")
	for i=1,8 do
		local get = io.read("*line") + new_buttons[i]
		io.write(get.."\n")
	end
	file:close()
	temp:close()
	transfer_buttons(temp_name,buttons_name)
end
function transfer_buttons(from_name,to_name)
	local from_file = io.open(from_name,"r")
	local to_file = io.open(to_name,"w")
	io.input(from_file)
	io.output(to_file)
	for i=1,9 do
		io.write((io.read("*line")).."\n")
	end
	from_file:close()
	to_file:close()
end
function save_new_buttons(buttons_array)
	local file = io.open(buttons_name,"w")
	io.output(file)
	io.write(frame.."\n")
	for n=1,8 do
		io.write(buttons_array[n].."\n")
	end
	file:close()
end

function set_random_button()
	button = math.random(1,8)
	in_string = BUTTONS[button]
	joypad.setfrommnemonicstr(in_string)
end
function update_update_variables()
	new_buttons[button] = new_buttons[button] + 1
end
function update_savefiles()
	update_buttons()
	create_new_update_variables()
end

function try_opening_savefiles()
	buttons_file = io.open(buttons_name,"r")
	buttons_file:close()
end
function check_savefiles()
	return true
end
function get_frame_from_save(file_name)
	file = io.open(file_name,"r")
	io.input(file)
	get = io.read("*line")
	file:close()
	return get
end
function fix_rng(frames)
	for i=1,frames do
		math.random(1,8)
	end
end

function load_saves()
	create_file_names()
	create_new_update_variables()
	if (pcall(try_opening_savefiles) and check_savefiles() and not start_new) then
		print("Red")
		frame = get_frame_from_save(buttons_name)
		fix_rng(frame)
		savestate.load("Savestates/"..save_file_name.."-Frame"..frame..".state")
	else
		print("Blue")
		initialize_savefiles()
	end
end

---- STATIC VARIABLES ----
BUTTONS = {"U........",".D.......","..L......","...R.....","....S....",".....s...","......B..",".......A."}

---- MAIN ----
-- INITIALIZATION --
frame = 0
start_time = os.clock()
math.randomseed(1)
savestate.load("blank.state")
load_saves()
print(string.format("Loaded in %.2f seconds",os.clock()-start_time))

-- MAIN LOOP --
while true do
	if frame%update_multiple == 0 then
		savestate.save("Savestates/"..save_file_name.."-Frame"..frame..".state")
		update_savefiles()
	end
	if frame == end_frame then
		break
	end
	set_random_button()
	update_update_variables()
	gui.text(100,0,"mnemonic:"..in_string)
	emu.frameadvance()
	frame = frame + 1
end

-- ENDING --
client.pause()
print(string.format("elapsed time: %.4f\n", os.clock() - start_time))
