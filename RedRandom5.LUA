---- INFORMATION -----------------------------------------------
-- Created: May 5, 2021
-- Last updated: May 7, 2021
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
-- positions_{save_file_name}.txt
---- The first line contains the number of frames in the recording so far.
---- The next line contains the number of positions that will be listed.
---- The next line is just "x y map frames".
---- The next lines contain the corresponding value of each of the previous.

-- UPDATE ARRAYS --
-- These arrays are stored in Lua, and are added to save files when the save files are updated.
-- new_buttons (default: {0,0,0,0,0,0,0,0})
---- Each element is the number of frames the corresponding button has been pressed.
-- new_positions (default: {})
---- Each element is an array of length 4. The first three are values for map, x, and y.
---- The fourth value is the number of frames the character has been in that position.

-- STATES --
-- blank.state
---- Blank state. No saved files. Default settings. Used for initializing.

---- TO DO ----
-- Add Positions save file.
-- Add more graphics
----------------------------------------------------------------

---- VARIABLES TO EDIT FOR EACH RUN ----
end_frame = -1 -- Set to -1 for forever
update_multiple = 1000000 -- If this is too small, then there will be too many savestates in the Savestates folder. If it's too big, it won't save often enough.
save_file_name = "RedRandom" -- Identifies each run.
start_new = false -- Set to false if continuing a run (Will start a new run if no savefiles detected or if savefiles are corrupted). Set to true if starting a new run with the same name.

---- FUNCTIONS ----
function create_file_names()
	buttons_name = save_file_name.."_buttons.txt"
	positions_name = save_file_name.."_positions.txt"
	savestate_name = "Savestates/"..save_file_name..".state"
	temp_name = save_file_name.."_temp.txt"
end
function create_new_update_variables()
	new_buttons = {0,0,0,0,0,0,0,0}
	new_positions = {}
end
function initialize_savefiles()
	save_new_buttons(new_buttons)
	save_new_positions(new_positions)
end

function update_buttons()
	local buttons_file = io.open(buttons_name,"r")
	local temp_file = io.open(temp_name,"w")
	io.input(buttons_file)
	io.output(temp_file)
	io.read("*line")
	io.write(frame.."\n")
	for i=1,8 do
		local get = io.read("*line") + new_buttons[i]
		io.write(get.."\n")
	end
	buttons_file:close()
	temp_file:close()
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
	local buttons_file = io.open(buttons_name,"w")
	io.output(buttons_file)
	io.write(frame.."\n")
	for n=1,8 do
		io.write(buttons_array[n].."\n")
	end
	buttons_file:close()
end
function update_buttons_variable()
	new_buttons[button] = new_buttons[button] + 1
end

function save_new_positions(positions_array)
	local positions_file = io.open(positions_name,"w")
	io.output(positions_file)
	io.write(frame.."\n")
	io.write(#positions_array.."\n")
	for i=1,#positions_array do
		io.write(positions_array[i][1].." "..positions_array[i][2].." "..positions_array[i][3].." "..positions_array[i][4].."\n")
	end
	positions_file:close()
end
function transfer_positions(from_name,to_name,length)
	local from_file = io.open(from_name,"r")
	local to_file = io.open(to_name,"w")
	io.input(from_file)
	io.output(to_file)
	io.write((io.read("*line")).."\n") -- read and write frame
	-- Note: The transfer_positions function is only used in the function update_positions. 
	-- That function creates a half-finished positions file with no length indicator - that is stored and changed locally. 
	-- A proper transfer_positions function may be added later.
	io.write(length.."\n")
	for i=1,length do
		io.write((io.read("*line")).."\n")
	end
	from_file:close()
	to_file:close()
end
function update_positions_variable()
	local found = false
	for i=1,#new_positions do
		if (new_positions[i][1] == current_position[1]) and 
		(new_positions[i][2] == current_position[2]) and 
		(new_positions[i][3] == current_position[3]) then
			new_positions[i][4] = new_positions[i][4] + 1
			found = true
			break
		end
	end
	if not found then
		table.insert(new_positions,{current_map,current_position[2],current_position[3],1})
	end
end
function update_positions()
	local positions_file = io.open(positions_name,"r")
	local temp_file = io.open(temp_name,"w")
	io.input(positions_file)
	io.output(temp_file)
	io.read("*line")
	io.write(frame.."\n")
	local read_length = io.read("*line")
	for i=1,read_length do
		read_position = {io.read("*number"),io.read("*number"),io.read("*number")}
		read_position_frames = io.read("*number")
		for j=1,#new_positions do
			if (read_position[1] == new_positions[j][1]) and 
			(read_position[2] == new_positions[j][2]) and 
			(read_position[3] == new_positions[j][3]) then
				read_position_frames = read_position_frames + new_positions[j][4]
				table.remove(new_positions,j)
				break
			end
		end
		io.write(read_position[1].." "..read_position[2].." "..read_position[3].." "..read_position_frames.."\n")
	end
	local new_positions_added = 0
	for i=1,#new_positions do
		io.write(new_positions[i][1].." "..new_positions[i][2].." "..new_positions[i][3].." "..new_positions[i][4].."\n")
		new_positions_added = new_positions_added + 1
	end
	positions_file:close()
	temp_file:close()
	transfer_positions(temp_name,positions_name,read_length+new_positions_added)
end

function set_random_button()
	button = math.random(1,8)
	in_string = BUTTONS[button]
	joypad.setfrommnemonicstr(in_string)
end
function update_variables()
	current_map = memory.readbyte(54110)
	current_position = {current_map,memory.readbyte(54114),memory.readbyte(54113)}
	update_buttons_variable()
	update_positions_variable()
end
function update_savefiles()
	update_buttons()
	update_positions()
	create_new_update_variables()
end

function try_opening_savefiles()
	print("Checking if savefiles exist...")
	local buttons_file = io.open(buttons_name,"r")
	buttons_file:close()
	local positions_file = io.open(positions_name,"r")
	positions_file:close()
	local savestate_file = io.open(savestate_name,"r")
	savestate_file:close()
	print("Success!")
end
function check_savefiles()
	print("Checking savefiles...")
	
	local buttons_file = io.open(buttons_name,"r")
	io.input(buttons_file)
	check_frames = io.read("*line")
	buttons_file:close()
	
	local positions_file = io.open(positions_name,"r")
	io.input(positions_file)
	check_frames_temp = io.read("*line")
	positions_file:close()
	
	if check_frames ~= check_frames_temp then
		print("Save files corrupted...")
		return false
	end
	print("Success!")
	return true
end
function get_frame_from_save(file_name)
	local file = io.open(file_name,"r")
	io.input(file)
	get = io.read("*line")
	file:close()
	return get
end
function fix_rng(frames)
	rng_start_time = os.clock()
	for i=1,frames do
		math.random(1,8)
	end
	print(string.format("RNG fixed in %.2f seconds",os.clock()-rng_start_time))
end

function load_saves()
	create_file_names()
	create_new_update_variables()
	if (not start_new and pcall(try_opening_savefiles) and check_savefiles()) then
		print("Loading savefiles!")
		frame = get_frame_from_save(buttons_name)
		fix_rng(frame)
		savestate.load(savestate_name)
	else
		print("Initializing savefiles!")
		initialize_savefiles()
	end
end

---- STATIC VARIABLES ----
BUTTONS = {"U........",".D.......","..L......","...R.....","....S....",".....s...","......B..",".......A."}

---- MAIN ----
-- INITIALIZATION --
console.clear()
print("--RedRandom5 by Willow--")
frame = 0
start_time = os.clock()
math.randomseed(1)
savestate.load("blank.state")
load_saves()
print(string.format("Loaded in %.2f seconds",os.clock()-start_time))
print("Beginning to play!")
-- MAIN LOOP --
while true do
	if frame%update_multiple == 0 and emu.framecount() ~= 0 then
		savestate.save(savestate_name)
		update_savefiles()
	end
	if frame == end_frame then
		break
	end
	set_random_button()
	update_variables()
	emu.frameadvance()
	frame = frame + 1
end

-- ENDING --
client.pause()
print(string.format("elapsed time: %.4f\n", os.clock() - start_time))
