-- Canvas: 320x320 pixels

-- TODO: MAKE FUNCTIONS PARAMETERS BETTER --

do -- MAP ARRAYS --

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
				{false,true ,true ,true ,false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,true ,true ,true ,false,false,false,false,true ,true ,true ,true ,true ,true ,true ,true ,true ,true ,true },
				{false,false,true ,true ,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false}}
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
end

function draw_map(canvas,map_number)
	local map_array = MAPS[map_number]
	local offset_x = OFFSETS[map_number][1]
	local offset_y = OFFSETS[map_number][2]
	for row = 1,#map_array do
		for col = 1,#map_array[1] do
			if map_array[row][col] then
				canvas.DrawRectangle(offset_x+(col-1)*SIZE,offset_y+(row-1)*SIZE,SIZE,SIZE,"white")
			end
		end
	end
end

function draw_position(canvas,position,fill_color,line_color)
	if not check_position(position) then
		return
	end
	local pos_map = position[1]
	canvas.DrawRectangle(OFFSETS[pos_map][1]+SIZE*position[2],OFFSETS[pos_map][2]+SIZE*position[3],SIZE,SIZE,fill_color,line_color)
end

function check_position(position)
	if MAPS[position[1]] == nil then
		return false
	end
	return MAPS[position[1]][position[3]+1][position[2]+1]
end
function positions_gradient()
	local positions_file = io.open(positions_name,"r")
	io.input(positions_file)
	pgradient_frame = io.read("*line")
	io.read("*line")
	local read_number = io.read("*line")
	if POSITION_GRADIENT_MODE == "rank" then
		for i=1,read_number do
			local read_position = {io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")}
			draw_position(new_canvas,read_position,color_gradient(HIGH_GRADIENT_COLOR,LOW_GRADIENT_COLOR,read_number,i),black)
		end
	elseif POSITION_GRADIENT_MODE == "frames" then
		local read_position = {io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")}
		local max_frames = read_position[4]
		draw_position(new_canvas,read_position,color_gradient(LOW_GRADIENT_COLOR,HIGH_GRADIENT_COLOR,max_frames,read_position[4]),black)
		for i=1,read_number-1 do
			local read_position = {io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")}
			draw_position(new_canvas,read_position,color_gradient(LOW_GRADIENT_COLOR,HIGH_GRADIENT_COLOR,max_frames,read_position[4]),black)
		end
	elseif POSITION_GRADIENT_MODE == "logframes" then
		local read_position = {io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")}
		local max_logframes = math.log(read_position[4])
		draw_position(new_canvas,read_position,color_gradient(LOW_GRADIENT_COLOR,HIGH_GRADIENT_COLOR,max_logframes,math.log(read_position[4])),black)
		for i=1,read_number-1 do
			local read_position = {io.read("*number"),io.read("*number"),io.read("*number"),io.read("*number")}
			draw_position(new_canvas,read_position,color_gradient(LOW_GRADIENT_COLOR,HIGH_GRADIENT_COLOR,max_logframes,math.log(read_position[4])),black)
		end
	end
	positions_file:close()
end

function color_gradient(min_color_array,max_color_array,max_value,value)
	return to_color(math.floor(min_color_array[1]*value/max_value)+math.floor(max_color_array[1]*(max_value-value)/max_value),
									math.floor(min_color_array[2]*value/max_value)+math.floor(max_color_array[2]*(max_value-value)/max_value),
									math.floor(min_color_array[3]*value/max_value)+math.floor(max_color_array[3]*(max_value-value)/max_value),
									math.floor(min_color_array[4]*value/max_value)+math.floor(max_color_array[4]*(max_value-value)/max_value))
end

function to_color(AA,RR,GG,BB)
	return AA*16777216+RR*65536+GG*256+BB
end

function create_graphics_variables()
	OFFSETS = {}
	OFFSETS[0]  = {8 *SIZE+5,0 *SIZE+5}
	OFFSETS[12] = {24*SIZE+5,0 *SIZE+5}
	OFFSETS[37] = {0 *SIZE+5,8 *SIZE+5}
	OFFSETS[38] = {0 *SIZE+5,0 *SIZE+5}
	OFFSETS[39] = {0 *SIZE+5,16*SIZE+5}
	OFFSETS[40] = {0 *SIZE+5,24*SIZE+5}

	MAPS = {}
	MAPS[0]  = map0
	MAPS[12] = map12
	MAPS[37] = map37
	MAPS[38] = map38
	MAPS[39] = map39
	MAPS[40] = map40
end

-- VARIABLES TO EDIT --
SIZE = 10
SHOW_CURRENT_POSITION = true
DO_POSITION_GRADIENT = true

POSITION_GRADIENT_MODE = "rank" -- options are: "rank", "frames", "logframes"
LOW_GRADIENT_COLOR = {255,255,0,0} -- AARRGGBB array
HIGH_GRADIENT_COLOR = {255,0,0,255} -- AARRGGBB array
BACKGROUND_COLOR = "gray" -- luacolor

---- MAIN ----
graphics_pos = {0,0,0}
-- INITIALIZE CANVAS --
create_graphics_variables()
new_canvas = gui.createcanvas(42*SIZE+10,37*SIZE)
new_canvas.DrawRectangle(0,0,42*SIZE+10,37*SIZE,BACKGROUND_COLOR,BACKGROUND_COLOR)
new_canvas.SetTitle("RedGraphics")
draw_map(new_canvas,0 )
draw_map(new_canvas,12)
draw_map(new_canvas,37)
draw_map(new_canvas,38)
draw_map(new_canvas,39)
draw_map(new_canvas,40)
while true do
	if DO_POSITION_GRADIENT then
		if frame%update_multiple == 0 and emu.framecount() ~= 0 then
			positions_gradient(10)
			new_canvas.Refresh()
		end
	end
	if SHOW_CURRENT_POSITION then
		if graphics_pos ~= current_position then
			draw_position(new_canvas,graphics_pos,nil,"black")
			graphics_pos = current_position
			draw_position(new_canvas,graphics_pos,nil,to_color(255,0,255,0))
			new_canvas.Refresh()
		end
	end
	emu.frameadvance()
end
