---- INFORMATION -----------------------------------------------
-- Created: May 5, 2021
-- By: Vivian
-- Description: This script will play Pokemon Red Randomly. 
----------------------------------------------------------------

---- FUNCTIONS ----
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

function save_info()
	local info_file = io.open(info_name,"w")
	io.output(info_file)
	io.write(frame.."\n")
	io.write(random_seed[1].." "..random_seed[2].." "..random_seed[3].."\n")
	if save_buttons then
		io.write("1".."\n")
	else
		io.write("0".."\n")
	end
	if save_positions then
		io.write("1".."\n")
	else
		io.write("0".."\n")
	end
	if load_events then
		io.write("1".."\n")
	else
		io.write("0".."\n")
	end
	io.write(current_map or memory.readbyte(54110))
	info_file:close()
end
function load_info()
	local info_file = io.open(info_name,"r")
	io.input(info_file)
	frame = io.read("*number")
	random_seed = {io.read("*number"),io.read("*number"),io.read("*number")}
	save_buttons   = io.read("*number")
	save_positions = io.read("*number")
	log_events     = io.read("*number")
	if save_buttons == 1 then
		save_buttons = true
	else
		save_buttons = false
	end
	if save_positions == 1 then
		save_positions = true
	else
		save_positions = false
	end
	if log_events == 1 then
		log_events = true
	else
		log_events = false
	end
	if log_events then
		new_events["map"] = io.read("*number")
	end
	info_file:close()
end


function create_new_events_file()
	local events_file = io.open(events_name,"w")
	events_file:close()
end
function create_events_file(events_array)
	local events_file = io.open(events_name,"w")
	io.output(events_file)
	for i=1,#events_array do
		io.write(events_array[i].."\n")
	end
	for i=1,5-#events_array do
		io.write(" ".."\n")
	end
	events_file:close()
end
function load_events()
	local events_file = io.open(events_name,"r")
	io.input(events_file)
	for i=1,5 do
		local line = io.read("*line")
		if line == " " then
			break
		end
		new_events[i] = line
	end	
	events_file:close()
end
function update_events_variable()
	if new_events["map"] ~= current_map then
		new_events["map"] = current_map
		table.insert(new_events,1,frame..": Entered map "..current_map)
		table.remove(new_events,max_events+1)
		create_events_file(new_events)
	end
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
	if save_buttons then
		update_buttons_variable()
	end
	if save_positions then
		update_positions_variable()
	end
	if log_events then
		update_events_variable()
	end
end
function update_savefiles()
	if save_buttons then
		update_buttons()
	end
	if save_positions then
		update_positions()
	end
	if sort_files then
		sort_positions()
	end
	create_new_update_variables()
end

function try_opening_savefiles()
	if save_buttons then
		local buttons_file = io.open(buttons_name,"r")
		buttons_file:close()
	end
	if save_positions then
		local positions_file = io.open(positions_name,"r")
		positions_file:close()
	end
	
end
function try_opening_important_files()
	local settings_file = io.open(settings_name,"r")
	settings_file:close()
	local savestate_file = io.open(savestate_name,"r")
	savestate_file:close()
end

function create_file_names()
	buttons_name = save_file_name.."_buttons.txt"
	positions_name = save_file_name.."_positions.txt"
	info_name = save_file_name.."_info.txt"
	events_name = save_file_name.."_events.txt"
	savestate_name = "Savestates/"..save_file_name..".state"
	temp_name = save_file_name.."_temp.txt"
end
function create_new_update_variables()
	new_buttons = {0,0,0,0,0,0,0,0}
	new_positions = {}
	if new_events == nil then
		new_events = {}
	end
end
function initialize_savefiles()
	if save_buttons then
		save_new_buttons(new_buttons)
	end
	if save_positions then
		save_new_positions(new_positions)
	end
	if log_events then
		create_new_events_file()
	end
	save_info()
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
function initialize()
	frame = 0
	start_time = os.clock()
	create_file_names()
	create_new_update_variables()
	
	if tastudio.engaged() then
		error("Close TASStudio!")
	end
	if (not start_new and pcall(try_opening_important_files)) then
		load_info()
		if pcall(try_opening_savefiles) then
			savestate.load(savestate_name)
			return
		else 
			error("Save files corrupted :(")
		end
	end
	
	-- Start new
	savestate.load("Savestates/blank.state")
	print("Initializing savefiles!")
	random_seed = starting_random_seed
	initialize_savefiles()
	savestate.save(savestate_name)
end

---- VARIABLES TO EDIT FOR EACH RUN ----
end_frame = -1 -- Frame to end on. If this frame is passed over (less than the beginning frame) then it will never stop.
end_condition = "parcel" -- Set alternative end condition. If it doesn't exist, then there is no alternative end condition. "parcel" for when Oak Parcel is obtained for the first time.

update_multiple = 1000 -- How many frames before each update to save files.
save_file_name = "RedRandom" -- Identifies each run.
start_new = true -- Set to false if continuing a run (Will start a new run if no savefiles detected). Set to true if starting a new run with the same name.
sort_files = true -- Set to true to sort the save files. Here so that if anything goes horribly wrong I can turn it off.
max_events = 10

-- Note: These settings will not change if you have a saved file.
starting_random_seed = {1,1,1} -- Should be three random integers from 1 to 30000.
save_buttons = true
save_positions = true
log_events = true


---- STATIC VARIABLES ----
BUTTONS = {"U........",".D.......","..L......","...R.....","....S....",".....s...","......B..",".......A."}

---- MAIN ----
-- INITIALIZATION --
console.clear()
print("--RedRandom by Vivian--")
initialize()
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
