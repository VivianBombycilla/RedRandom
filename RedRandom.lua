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
	io.write(frame.."\n")
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
	io.read("*line")
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
	io.write(starting_random_seed[1].." "..starting_random_seed[2].." "..starting_random_seed[3].."\n")
	io.write(random_seed[1].." "..random_seed[2].." "..random_seed[3].."\n")
	if save_buttons then
		io.write("1".."\n")
	else
		io.write("0".."\n")
	end
	if save_positions then
		io.write("1 ")
		if do_sort_positions then
			io.write("1\n")
		else
			io.write("0\n")
		end
	else
		io.write("0".."\n")
	end
	if log_events then
		io.write("1 "..max_events.." "..(current_map or memory.readbyte(54110)).."\n")
	else
		io.write("0".."\n")
	end
	
	info_file:close()
end
function load_info()
	local info_file = io.open(info_name,"r")
	io.input(info_file)
	frame = io.read("*number")
	starting_random_seed = {io.read("*number"),io.read("*number"),io.read("*number")}
	random_seed = {io.read("*number"),io.read("*number"),io.read("*number")}
	save_buttons   = io.read("*number") == 1
	save_positions = io.read("*number") == 1
	if save_positions then
		do_sort_positions = io.read("*number") == 1
	end
	log_events = io.read("*number") == 1
	if log_events then
		max_events = io.read("*number")
		new_events["map"] = io.read("*number")
	end
	info_file:close()
end
function print_info()
	print("Savefile name: "..save_file_name)
	print("Starting random seed: {"..starting_random_seed[1]..", "..starting_random_seed[2]..", "..starting_random_seed[3].."}")
	if endless then
		print("No ending frame.")
	else
		print("End frame: "..end_frame)
	end
	print("Update multiple: "..update_multiple)
	if save_buttons or save_positions or log_events then
		local temp_str = "Saving: "
		local temp_bool = false
		if save_buttons then
			temp_str = temp_str.."Buttons"
			temp_bool = true
		end
		if save_positions then
			if temp_bool then temp_str = temp_str..", " end
			temp_str = temp_str.."Positions"
			temp_bool = true
		end
		if save_positions then
			if temp_bool then temp_str = temp_str..", " end
			temp_str = temp_str.."Events"
			temp_bool = true
		end
		print(temp_str)
	else
		print("Not saving files.")
	end
	if do_sort_positions then
		print("Sorting positions file.")
	end
	if log_events then
		print("Max events logged: "..max_events)
	end
	
end

function create_new_events_file()
	local events_file = io.open(events_name,"w")
	io.output(events_file)
	io.write(frame.."\n")
	io.write("\n")
	events_file:close()
end
function create_events_file(events_array)
	local events_file = io.open(events_name,"w")
	io.output(events_file)
	io.write(frame.."\n")
	for i=1,#events_array do
		if events_array[i][1] == "map" then
			if MAP_NAMES[events_array[i][2]] == nil then
				io.write("-"..(frame-events_array[i][3])..": Entered map "..events_array[i][2].."\n")
			else
				io.write("-"..(frame-events_array[i][3])..": Entered "..MAP_NAMES[events_array[i][2]].."\n")
			end
		end
	end
	events_file:close()
end
function update_events_variable()
	if new_events["map"] ~= current_map then
		new_events["map"] = current_map
		table.insert(new_events,1,{"map",current_map,frame})
		table.remove(new_events,max_events+1)
		create_events_file(new_events)
	end
end

function set_joypad_from_string(mnemonic)
	joypad.set({Up =     string.sub(mnemonic,1,1) == "U",
	            Down =   string.sub(mnemonic,2,2) == "D",
	            Left =   string.sub(mnemonic,3,3) == "L",
	            Right =  string.sub(mnemonic,4,4) == "R",
	            Start =  string.sub(mnemonic,5,5) == "S",
	            Select = string.sub(mnemonic,6,6) == "s",
	            B =      string.sub(mnemonic,7,7) == "B",
	            A =      string.sub(mnemonic,8,8) == "A",
	            Power =  string.sub(mnemonic,9,9) == "P"})
end
function set_random_button() -- Wichmann-Hill PRNG, because it's easy.
	random_seed[1] = (171*random_seed[1])%30269
	random_seed[2] = (172*random_seed[2])%30307
	random_seed[3] = (170*random_seed[3])%30323
	local rand_result = (random_seed[1]/30269 + random_seed[2]/30307 + random_seed[3]/30323)%1
	button = math.floor(rand_result*8 + 1)
	in_string = BUTTONS[button]
	set_joypad_from_string(in_string)
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
	if do_happening_update then
		update_happening_file()
	end
end
function update_savefiles()
	save_info()
	if save_buttons then
		update_buttons()
	end
	if save_positions then
		update_positions()
	end
	if do_sort_positions then
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
	local info_file = io.open(info_name,"r")
	info_file:close()
	local savestate_file = io.open(savestate_name,"r")
	savestate_file:close()
end

function create_file_names()
	buttons_name = save_file_name.."_buttons.txt"
	positions_name = save_file_name.."_positions.txt"
	info_name = save_file_name.."_info.txt"
	events_name = save_file_name.."_events.txt"
	savestate_name = "Savestates/"..save_file_name..".state"
	happening_name = save_file_name.."_happening.txt"
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
		new_events = {}
	end
	save_info()
end
function check_end_conditions() -- returns true if program should stop
	if (not endless) then
		if (frame >= end_frame) then
			print("Ending frame reached")
			return true
		end
	end
	if end_conditions["parcel"] ~= nil then
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
	if not start_new then
		if not pcall(try_opening_important_files) then
			error("Savefiles missing!")
		end
		load_info()
		if pcall(try_opening_savefiles) then
			savestate.load(savestate_name)
			print("Loaded save file!")
			print("Continuing save file!")
		else 
			error("Savefiles missing!")
		end
	else
		random_seed = {starting_random_seed[1],starting_random_seed[2],starting_random_seed[3]}
		savestate.load("Savestates/blank.state")
		print("Initializing savefiles!")
		initialize_savefiles()
		savestate.save(savestate_name)
		print("Beginning new run!")
	end
	print_info()
end

function continue_save_button()
	if forms.gettext(form_ids["savefile"]) == "" then
		print("No savefile name!")
		return
	else
		save_file_name = forms.gettext(form_ids["savefile"])
	end
	if forms.gettext(form_ids["update multiple"]) == "" or 
	   forms.gettext(form_ids["update multiple"]) == 0  then
		print("Invalid update multiple!")
		return
	else
		update_multiple = forms.gettext(form_ids["update multiple"])
	end
	if forms.ischecked(form_ids["endless"]) then	
		endless = true
	else
		endless = false
		if forms.gettext(form_ids["end frame"]) == "" then
			print("Invalid end frame!")
			return
		else
			end_frame = tonumber(forms.gettext(form_ids["end frame"]))
		end
	end
	end_conditions = {}
	if forms.ischecked(form_ids["parcel"]) then
		table.insert(end_conditions,"parcel")
	end
	start_new = false
	forms.destroyall()
	ready = true
end
function new_save_button()
	if forms.gettext(form_ids["savefile"]) == "" then
		print("No savefile name!")
		return
	else
		save_file_name = forms.gettext(form_ids["savefile"])
	end
	if forms.gettext(form_ids["update multiple"]) == "" or 
	   forms.gettext(form_ids["update multiple"]) == 0  then
		print("Invalid update multiple!")
		return
	else
		update_multiple = forms.gettext(form_ids["update multiple"])
	end
	if forms.ischecked(form_ids["endless"]) then	
		endless = true
	else
		endless = false
		if forms.gettext(form_ids["end frame"]) == "" then
			print("Invalid end frame!")
			return
		else
			end_frame = tonumber(forms.gettext(form_ids["end frame"]))
		end
	end
	end_conditions = {}
	if forms.ischecked(form_ids["parcel"]) then
		table.insert(end_conditions,"parcel")
	end
	if forms.gettext(form_ids["seed 1"]) == "" or forms.gettext(form_ids["seed 2"]) == "" or forms.gettext(form_ids["seed 3"]) == "" then
		print("Random seed missing!")
		return
	elseif tonumber(forms.gettext(form_ids["seed 1"])) == 0    or 
	       tonumber(forms.gettext(form_ids["seed 2"])) == 0    or 
	       tonumber(forms.gettext(form_ids["seed 3"])) == 0    or
	       tonumber(forms.gettext(form_ids["seed 1"])) > 30000 or 
	       tonumber(forms.gettext(form_ids["seed 2"])) > 30000 or 
	       tonumber(forms.gettext(form_ids["seed 3"])) > 30000 then
		print("Random seeds must be between 1 and 30000!")
		return
	else
		starting_random_seed = {tonumber(forms.gettext(form_ids["seed 1"])),tonumber(forms.gettext(form_ids["seed 2"])),tonumber(forms.gettext(form_ids["seed 3"]))}
	end
	if forms.ischecked(form_ids["buttons"]) then
		save_buttons = true
	else
		save_buttons = false
	end
	if forms.ischecked(form_ids["positions"]) then
		save_positions = true
		do_sort_positions = forms.ischecked(form_ids["sort positions"])
	else
		save_positions = false
	end
	if forms.ischecked(form_ids["events"]) then
		log_events = true
		if forms.gettext(form_ids["max events"]) == "" then
			print("Invalid max events!")
			return
		else
			max_events = forms.gettext(form_ids["max events"])
		end
	else
		log_events = false
	end
	start_new = true
	forms.destroyall()
	ready = true
end
function create_form()
	test_form = forms.newform(280,210,"RedRandom")
	form_ids = {}
	form_ids["savefile"]        = forms.textbox(test_form,nil,140,20,nil,76,0)
	form_ids["update multiple"] = forms.textbox(test_form,3600,54,20,"UNSIGNED",82,20)
	form_ids["end frame"]       = forms.textbox(test_form,216000,60,20,"UNSIGNED",60,40)
	form_ids["endless"]         = forms.checkbox(test_form,"Endless",140,42)
	form_ids["parcel"]          = forms.checkbox(test_form,"Parcel",80,62)
	form_ids["seed 1"]          = forms.textbox(test_form,nil,35,20,"UNSIGNED",120,100)
	form_ids["seed 2"]          = forms.textbox(test_form,nil,35,20,"UNSIGNED",156,100)
	form_ids["seed 3"]          = forms.textbox(test_form,nil,35,20,"UNSIGNED",192,100)
	form_ids["buttons"]         = forms.checkbox(test_form,"Buttons",35,122)
	form_ids["positions"]       = forms.checkbox(test_form,"Positions",110,122)
	form_ids["sort positions"]  = forms.checkbox(test_form,"Sort?",110,142)
	form_ids["events"]          = forms.checkbox(test_form,"Events",190,122)
	form_ids["max events"]      = forms.textbox(test_form,nil,18,20,"UNSIGNED",238,140)
	
	
	forms.label(test_form,"Savefile name:",0,2,80,18)
	forms.label(test_form,"Update multiple:",0,22,140,18)
	forms.label(test_form,"End frame:",0,42,60,18)
	forms.label(test_form,"End conditions:",0,62,80,18)
	forms.label(test_form,"Starting Random Seed:",0,102,120,18)
	forms.label(test_form,"Track:",0,122,35,18)
	forms.label(test_form,"# of events",180,142,58,18)
	
	
	
	forms.button(test_form,"Continue save",continue_save_button,0,80,100,20)
	forms.button(test_form,"New save",new_save_button,0,150,100,20)
end



function update_happening_file()
	local happening_file = io.open(happening_name,"w")
	io.output(happening_file)
	io.write("Current frame: "..frame.."\n")
	io.write("Current map: "..MAP_NAMES[current_map].."\n")
	io.write("Current position: x:"..current_position[2].." y:"..current_position[3].."\n")
	io.write("Current button: "..BUTTONS[button].."\n")
	io.write("Since last save... ("..(frame%update_multiple).."/"..update_multiple..")\n")
	table.sort(new_positions, compare_positions)
	io.write("Most visited space: "..MAP_NAMES[new_positions[1][1]].." x:"..new_positions[1][2].." y:"..new_positions[1][3].."\n")
	io.write("with "..new_positions[1][4].." frames")
	happening_file:close()
end

---- STATIC VARIABLES ----
BUTTONS = {"U........",".D.......","..L......","...R.....","....S....",".....s...","......B..",".......A."}
MAP_NAMES = {}
MAP_NAMES[0]  = "Pallet Town"
MAP_NAMES[1]  = "Viridian City"
MAP_NAMES[12] = "Route 1"
MAP_NAMES[37] = "Red's House 1F"
MAP_NAMES[38] = "Red's House 2F"
MAP_NAMES[39] = "Blue's House"
MAP_NAMES[40] = "Professor Oak's Lab"
MAP_NAMES[41] = "Viridian Pokémon Center"
MAP_NAMES[42] = "Viridian Poké Mart"
MAP_NAMES[43] = "Trainers' School"
MAP_NAMES[44] = "Viridian House 1"
MAP_NAMES[255] = "N/A"

---- MAIN ----
from_form = true

-- INITIALIZATION --
console.clear()
print("--RedRandom by Vivian--")
ready = false
if from_form then
	do_happening_update = false
	create_form()
else
	start_new = false
	save_file_name = "Noform"
	update_multiple = 3600
	endless = true
	end_frame = 216000
	end_conditions = {"parcel"} -- options: "parcel"
	starting_random_seed = {1,1,1}
	save_buttons = true
	save_positions = true
	do_sort_positions = true
	log_events = true
	max_events = 5
	do_happening_update = true
	ready = true
end
frame = 0
-- MAIN LOOP --
while true do
	if ready then
		if frame == 0 then
			initialize()
		end
		if frame%update_multiple == 0 and emu.framecount() ~= 0 then
			savestate.save(savestate_name)
			update_savefiles()
		end
		if check_end_conditions() then
			break
		end
		set_random_button()
		update_variables()
		frame = frame + 1
	end
	emu.frameadvance()
end
-- ENDING --
client.pause()
print("Program Ending.")
print(string.format("Elapsed time: %.2f seconds", os.clock() - start_time))