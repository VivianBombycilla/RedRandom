### Initialization
create_file_names()

	Creates the file name variables.
	
create_new_update_variables()

	Create update variable names.

initialize_savefiles()

	Initializes all save files.

### Save files

#### Buttons
update_buttons()

	Updates button save file with the variable new_buttons.
	
transfer_buttons(from_name,to_name)

	Transfers button save file.

save_new_buttons(buttons_array)

	Writes buttons to a new save file.

update_buttons_variable()

	Updates the variable new_buttons.

#### Positions

save_new_positions(positions_array)

	Writes positions to a new save file.

transfer_positions(from_name,to_name,length)

	Function used in the other function update_positions. Length is the number of positions.

update_positions_variable()

	Updates the variable new_positions.

update_positions()

	Updates position save file with the variable new_positions.

### Update
set_random_button()

	Sets random button, and sets the input to the random button.

update_update_variables()

	Updates the variables that update the save files.
	
update_savefiles()

	Updates save files, adding the new update variables to the existing data.
	
### Loading
try_opening_savefiles()

	Helper function that opens and closes every savefile if it exists. If it doesn't exist, throws an exception.

check_savefiles()

	Checks the frames of save files, to make sure everything is okay. Returns true if it's good, false if it's not.

load_saves()

	Loads the save files and the state on the emulator, and sets the RNG to be predictable.

fix_rng(frames)

	Fixes the RNG by the number of frames indicated.

get_frame_from_save(file_name)

	Gets the frame listed in the save file with the given file name. Since the frame in each save file is the frame, 
