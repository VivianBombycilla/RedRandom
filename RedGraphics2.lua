-- The Gameboy display is 160 pixels wide and 144 pixels tall.
-- The display with this program running is 340 pixels wide and 160 pixels tall.
-- This is a companion code to be run alongside RedRandom5.lua.
-- This code has no real purpose outside of helping that script.

-- VARIABLES TO EDIT --
graphics_mode = 0
-- 0: Nothing
-- 1: Just map + current location (no savefiles needed)
-- 2:	Map, current location, plus highlighted location from savefiles


-- USEFUL VARIABLES --

-- Map 0: Pallet Town
-- 19 blocks wide, 18 blocks tall
--       0     1     2     3     4     5     6     7     8     9     10    11    12    13    14    15    16    17    18
map0 = {{false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false,false},
				{false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false,false},
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,false,false,false,false,true ,true ,true ,true ,false,false,false,false,true ,true ,true },
				{false,true ,true ,true ,false,false,false,false,true ,true ,true ,true ,false,false,false,false,true ,true ,true },
				{false,true ,true ,false,false,true ,false,false,true ,true ,true ,false,false,true ,false,false,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,false,false,false,false,false,false,true ,true ,true },
				{false,true ,true ,true ,false,false,false,false,true ,true ,false,false,false,false,false,false,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,false,false,false,false,false,false,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,false,false,true ,false,false,false,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,true ,true ,true ,true ,true ,true ,false,false,false,false,false,false,true ,true ,true },
				{false,true ,true ,true ,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,false,true ,true ,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true }}
-- Map 12: Route 1
-- 18 blocks wide, 36 blocks tall
--        0     1     2     3     4     5     6     7     8     9     10    11    12    13    14    15    16    17    
map12 = {{false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false},
				 {false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false},
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,false,false,true ,true ,true ,true ,false,false,false,false,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,false,false,false,false,false,false,false,false,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,false,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false},
				 {false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false},
				 {false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false},
				 {false,false,false,false,false,false,false,false,false,false,true ,true ,false,false,false,false,false,false}}
-- Map 37: Red's house F2
-- 8 blocks wide, 8 blocks tall
map37 = {{false,false,false,false,false,false,false,false},
				 {false,false,true ,false,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,false,false,false,true ,true },
				 {true ,true ,true ,false,false,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true }}
-- Map 38: Red's house F2
-- 8 blocks wide, 8 blocks tall
map38 = {{false,false,false,false,false,false,false,false},
				 {false,false,false,true ,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,false,true ,true ,true ,true },
				 {true ,true ,true ,false,true ,true ,true ,true },
				 {false,true ,true ,true ,true ,true ,false,true },
				 {false,true ,true ,true ,true ,true ,false,true }}
-- Map 39: Blue's house
-- 8 blocks wide, 8 blocks tall
map39 = {{false,false,false,false,false,false,false,false},
				 {false,false,true ,true ,true ,true ,true ,false},
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,false,false,false,true ,true ,true },
				 {true ,true ,true ,false,false,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true },
				 {false,true ,true ,true ,true ,true ,true ,false},
				 {false,true ,true ,true ,true ,true ,true ,false}}
-- Map 40: Professor's Lab
-- 10 blocks wide, 12 blocks tall
map40 = {{false,false,false,false,false,false,false,false,false,false},
				 {false,false,false,false,true ,true ,false,false,false,false},
				 {true ,true ,true ,true ,true ,false,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,false,false,false,true },
				 {true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {false,false,false,false,true ,true ,false,false,false,false},
				 {false,false,false,false,true ,true ,false,false,false,false},
				 {true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				 {true ,true ,false,true ,true ,true ,true ,true ,false,true },
				 {true ,true ,true ,true ,true ,true ,true ,true ,true ,true }}

function get_display_position()
	local positions_file = io.open(positions_name,"r")
	io.input(positions_file)
	io.read("*line")
	io.read("*line")
	positions = io.read("*line")
	for i=1,(frame%positions) do
		io.read("*line")
	end
	local get = {io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")}
	positions_file:close()
	return get
end

function draw_position(position,line_color,fill_color)
	if is_valid_position(position) then
			gui.drawRectangle(offsets[position[1]][1]+SIZE*(position[2]),offsets[position[1]][2]+SIZE*(position[3]),SIZE,SIZE,line_color,fill_color)
	end
end

function is_valid_position(position)
	if (position[1] == 0 or 
			position[1] == 12 or 
			position[1] == 37 or 
			position[1] == 38 or 
			position[1] == 39 or 
			position[1] == 40) then
		return maps[position[1]][position[3]+1][position[2]+1]
	end
	return false
end

function frames_to_time(frames)
	local get = ""
	if frames < 60 then
		return "<1s"
	end
	if frames < 3600 then
		return ((frames-frames%60)/60).."s"
	end
	if frames < 216000 then
		return ((frames-frames%3600)/3600).."m"
	end
	return ((frames-frames%216000)/216000).."h"
end

function frames_to_long_time(frames)
	local get = ""
  if frames >= 60*60*60*24 then
    get = get..((frames-frames%(60*60*60*24))/(60*60*60*24)).."d "
    frames = frames%(60*60*60*24)
	end
	if frames >= 60*60*60 then
    get = get..((frames-frames%(60*60*60))/(60*60*60)).."h "
    frames = frames%(60*60*60)
	end
	if frames >= 60*60 then
    get = get..((frames-frames%(60*60))/(60*60)).."m "
    frames = frames%(60*60)
	end
	if frames >= 60 then
    get = get..((frames-frames%(60))/(60)).."s "
    frames = frames%(60)
	end
  if frames > 0 then
    get = get..	(frames).."f "
	end
  return get
end

function graphics_0()
	client.SetGameExtraPadding(0,0,0,0)
end

function graphics_1()
	client.SetGameExtraPadding(0,0,180,16)
	gui.drawImage("red_map.png",160,0)
	if map_names[current_map] ~= nil then
		gui.text(0,288,"Map:"..map_names[current_map])
		gui.text(0,304,"X:"..current_position[2].." Y:"..current_position[3])
	end
	gui.text(320-10*10,288,"RedRandom5")
	gui.text(320-9*10,288+16,"By Willow")
	draw_position(current_position,"white","lightgreen")
end

function graphics_2()
	client.SetGameExtraPadding(0,0,180,16)
	gui.drawImage("red_map.png",160,0)
	if map_names[current_map] ~= nil then
		gui.text(0,288,"Map:"..map_names[current_map])
		gui.text(0,304,"X:"..current_position[2].." Y:"..current_position[3])
	end
	gui.text(320-10*10,288,"RedRandom5")
	gui.text(320-9*10,288+16,"By Willow")
	if frame%display_multiple == 0 then
		display_position = get_display_position()
	end
	if is_valid_position(display_position) then
		gui.drawRectangle(185-SIZE-3,144-7,SIZE,SIZE,"white","pink")
		gui.text(370,288-16,"Highlighted position:")
		gui.text(370,288,map_names[display_position[1]].." ("..display_position[2]..","..display_position[3]..")")
		gui.text(370,288+16,frames_to_long_time(display_position[4]))--.." Frames")
	end
	draw_position(display_position,"white","pink")
end

offsets = {}
offsets[37] = {165,37}
offsets[38] = {165,5}
offsets[39] = {165,69}
offsets[40] = {201,77}
offsets[0]  = {197,5}
offsets[12] = {261,5}

maps = {}
maps[37] = map37
maps[38] = map38
maps[39] = map39
maps[40] = map40
maps[0]  = map0
maps[12] = map12

map_names = {}
map_names[37] = "Red's House F1"
map_names[38] = "Red's House F2"
map_names[39] = "Blue's House"
map_names[40] = "Professor's Lab"
map_names[0]  = "Pallet Town"
map_names[12] = "Route 1"

SIZE = 4
display_multiple = 1009
---- MAIN ----
client.setwindowsize(2)
display_position = {0,0,0,0}
while true do
	if graphics_mode == 0 then -- Do nothing
		graphics_0()
	elseif graphics_mode == 1 then
		graphics_1()
	elseif graphics_mode == 2 then
		graphics_2()
	end
	emu.frameadvance()
end

