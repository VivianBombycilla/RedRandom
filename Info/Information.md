# Information
Last updated: May 8, 2021

By: Willow

Description: This script will play Pokemon Red Randomly until the parcel is gotten from Professor Oak. Game information is saved in save files, which are updated periodically.

## Randomness
The program uses the in-built Lua math.random function, and math.randomseed to be reproduceable.

On every frame, one single button is pressed. 

## Save Files
Save files can be used to continue a run with reproduceable and predictable, and still random, results. They can also be used to find the progress of the character in the same, or to even display statistics about the character's journey.

### Buttons ({save_file_name}_buttons.txt)

Contains information about the number of frames any button is pressed. 

The first line contains the number of frames played.

The next 8 lines contain the number of frames the corresponding button has been pressed, in this order: Up, Down, Left, Right, Start, Select, A, B.

### Positions ({save_file_name}_positions.txt)

Contains information about the number of frames the player character has been in a given position. 

The first line contains the number of frames played.

The next line contains the number of lines that follow it.

The rest of the lines contain four numbers. The first three are the map, the x-position, and the y-position, and the fourth is the number of frames the player has been at that position.

## Functions
Descriptions of the functions used in this program can be found in Functions.md
