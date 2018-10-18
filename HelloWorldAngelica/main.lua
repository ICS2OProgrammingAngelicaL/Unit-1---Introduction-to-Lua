-- Name: Angelica L.
-- Course: ICS20/3C
-- This program displays Hello, World on the iPad simulator and "Helloooooooo!" to the
-- command terminal
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("Oui oui, mon ami, je m'appelle Lafayette!")

-- Sounds
-- local backgroundMusic = audio.loadSound("Elevator.mp3")
-- local backgroundMusicChannel

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 154/255, 153/255, 255/255)

-- create a local variable
local textObject

--displays a text on the screen at position x = 500 and y = 500 with

--a deafult font style and font size of 50
textObject = display.newText( "Hello, World!", 400, 250, nil, 100)

-- sets the colour of the text
textObject:setTextColor(0/255, 0/255, 0/255)

-- local variable
local textObjectSignature

-- text object signature
textObjectSignature = display.newText(" Created By: Angelica L", 400, 350, nil, 50)

-- sets the colour of the text object signature\
textObjectSignature:setTextColor(0)

--------------------------------------------------------------------------------------------

-- Sounds
local backgroundMusic = audio.loadSound("Sound/Elevator.mp3")
local backgroundMusicChannel

backgroundMusicChannel = audio.play(backgroundMusic) 