-----------------------------------------------------------------------------------------
-- Title: PhysicsAndColissions
-- Name: Angelica L
-- Course: ICS2O
-- This program . . .
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------
-- Local variables
local physics = require("physics")
-----------------------------------------------------------------------------------------

-- Start physics
physics.start()

-----------------------------------------------------------------------------------------
-- Object creation
-----------------------------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentCenterX
ground.y = display.contentHeight *12/12
