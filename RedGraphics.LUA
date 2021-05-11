
-- The Gameboy display is 160 pixels wide and 144 pixels tall.
-- The display with this program running is 340 pixels wide and 160 pixels tall.


-- VARIABLES --

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

offsets = {}
offsets[37] = {165,37}
offsets[38] = {165,5}
offsets[39] = {165,69}
offsets[40] = {201,77}
offsets[0] = {197,5}
offsets[12] = {261,5}

maps = {}
maps[37] = map37
maps[38] = map38
maps[39] = map39
maps[40] = map40
maps[0]  = map0
maps[12] = map12

SIZE = 4
---- MAIN ----
client.SetGameExtraPadding(0,0,180,16)
client.setwindowsize(2)
while true do
	current_map = memory.readbyte(54110)
	gui.drawImage("red_map.png",160,0)
	current_position = {current_map,memory.readbyte(54114),memory.readbyte(54113)}
	gui.text(0,288,"Map:"..current_map)
	gui.text(0,304,"X:"..current_position[2].." Y:"..current_position[3])
	gui.text(320-10*10,288,"RedRandom5")
	gui.text(320-9*10,288+16,"By Willow")
	if (current_map == 0 or 
	    current_map == 12 or 
			current_map == 37 or 
			current_map == 38 or 
			current_map == 39 or 
			current_map == 40) then
		if maps[current_map][current_position[3]+1][current_position[2]+1] then
			gui.drawRectangle(offsets[current_map][1]+SIZE*(current_position[2]),offsets[current_map][2]+SIZE*(current_position[3]),SIZE,SIZE,4289769648,"lightgreen")
		end
	end
	emu.frameadvance()
end