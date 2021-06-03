---- INFORMATION -----------------------------------------------
-- Created: May 5, 2021
-- By: Vivian
-- Description: This script will play Pokemon Red Randomly. 
----------------------------------------------------------------

---- VARIABLES TO EDIT FOR EACH RUN ----
end_frame = -1 -- Frame to end on. If this frame is passed over (less than the beginning frame) then it will never stop.
update_multiple = 100000 -- How many frames before each update to save files.
save_file_name = "RedRandom" -- Identifies each run.
start_new = false -- Set to false if continuing a run (Will start a new run if no savefiles detected or if savefiles are corrupted). Set to true if starting a new run with the same name.
starting_random_seed = {22945,14972,8468} -- Should be three random integers from 1 to 30000.
end_condition = "parcel" -- Set alternative end condition. If it doesn't exist, then there is no alternative end condition. "parcel" for when Oak Parcel is obtained for the first time.
sort_files = true -- Set to true to sort the save files. Here so that if anything goes horribly wrong I can turn it off.

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
	io.write(frame.."\n") -- Write new frame
	io.read("*line")
	io.write(random_seed[1].." "..random_seed[2].." "..random_seed[3].."\n") -- Write new random seed
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
	for i=1,10 do
		io.write((io.read("*line")).."\n")
	end
	from_file:close()
	to_file:close()
end
function save_new_buttons(buttons_array)
	local buttons_file = io.open(buttons_name,"w")
	io.output(buttons_file)
	io.write(frame.."\n")
	io.write(random_seed[1].." "..random_seed[2].." "..random_seed[3].."\n")
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
	io.write(random_seed[1].." "..random_seed[2].." "..random_seed[3].."\n")
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
	io.write((io.read("*line")).."\n") -- read and write random seed
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
	io.read("*line")
	io.write(random_seed[1].." "..random_seed[2].." "..random_seed[3].."\n")
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
function sort_positions()
	local positions_file = io.open(positions_name,"r")
	io.input(positions_file)
	local read_frame = io.read("*line")
	local read_seed = io.read("*line")
	local read_number = io.read("*line")
	local read_positions = {}
	for i=1,read_number do
		table.insert(read_positions,{io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")})
	end
	positions_file:close()
	table.sort(read_positions, compare_positions)
	save_new_positions(read_positions)
end
function compare_positions(position_a, position_b)
	return (position_a[4] > position_b[4])
end

function set_joypad_button(in_button)
	if in_button == 1 then
		joypad.set({Up=true,Down=false,Left=false,Right=false,Start=false,Select=false,A=false,B=false,Power=false})
		return
	end
	if in_button == 2 then
		joypad.set({Up=false,Down=true,Left=false,Right=false,Start=false,Select=false,A=false,B=false,Power=false})
		return
	end
	if in_button == 3 then
		joypad.set({Up=false,Down=false,Left=true,Right=false,Start=false,Select=false,A=false,B=false,Power=false})
		return
	end
	if in_button == 4 then
		joypad.set({Up=false,Down=false,Left=false,Right=true,Start=false,Select=false,A=false,B=false,Power=false})
		return
	end
	if in_button == 5 then
		joypad.set({Up=false,Down=false,Left=false,Right=false,Start=true,Select=false,A=false,B=false,Power=false})
		return
	end
	if in_button == 6 then
		joypad.set({Up=false,Down=false,Left=false,Right=false,Start=false,Select=true,A=false,B=false,Power=false})
		return
	end
	if in_button == 7 then
		joypad.set({Up=false,Down=false,Left=false,Right=false,Start=false,Select=false,A=true,B=false,Power=false})
		return
	end
	if in_button == 8 then
		joypad.set({Up=false,Down=false,Left=false,Right=false,Start=false,Select=false,A=false,B=true,Power=false})
		return
	end
end
function set_random_button() -- Wichmann-Hill PRNG, because it's easy.
	random_seed[1] = (171*random_seed[1])%30269
	random_seed[2] = (172*random_seed[2])%30307
	random_seed[3] = (170*random_seed[3])%30323
	local rand_result = (random_seed[1]/30269 + random_seed[2]/30307 + random_seed[3]/30323)%1
	button = math.floor(rand_result*8 + 1)
	in_string = BUTTONS[button]
	set_joypad_button(button)
	--joypad.setfrommnemonicstr(in_string)
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
	if sort_files then
		sort_positions()
	end
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
function get_info_from_save(file_name)
	local file = io.open(file_name,"r")
	io.input(file)
	frame = io.read("*line")
	random_seed = {io.read("*number"),io.read("*number"),io.read("*number")}
	file:close()
end

function check_end_conditions() -- returns true if program should stop
	if frame == end_frame then
		print("Ending frame reached")
		return true
	end
	if end_condition == "parcel" then
	 	if (memory.readbyte(54797) ~= 0) then
			print("Oak's Parcel received")
			return true
		end
	end
	return false
end
function load_saves()
	create_file_names()
	create_new_update_variables()
	if tastudio.engaged() then
		error("Close TASStudio!")
	end
	if (not start_new and pcall(try_opening_savefiles) and check_savefiles()) then
		print("Loading savefiles!")
		get_info_from_save(buttons_name)
		savestate.load(savestate_name)
	else
		savestate.load("blank.state")
		print("Initializing savefiles!")
		random_seed = starting_random_seed
		initialize_savefiles()
	end
end


---- STATIC VARIABLES ----
BUTTONS = {"U........",".D.......","..L......","...R.....","....S....",".....s...","......B..",".......A."}

---- MAIN ----
-- INITIALIZATION --
console.clear()
print("--RedRandom5 by Vivian--")
frame = 0
start_time = os.clock()
load_saves()
print(string.format("Loaded in %.2f seconds",os.clock()-start_time))
print("Beginning to play!")
-- MAIN LOOP --
while true do
	if frame%update_multiple == 0 and emu.framecount() ~= 0 then
		savestate.save(savestate_name)
		update_savefiles()
	end
	if check_end_conditions() then
		break
	end
	set_random_button()
	update_variables()
	emu.frameadvance()
	frame = frame + 1
end

-- ENDING --
client.pause()
print("Program Ending.")
print(string.format("Elapsed time: %.2f seconds", os.clock() - start_time))
