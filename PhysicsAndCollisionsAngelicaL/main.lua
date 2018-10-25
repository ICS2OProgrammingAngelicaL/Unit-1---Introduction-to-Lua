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
	-- Set the x and y pos
ground.x = display.contentCenterX
ground.y = display.contentHeight *12/12
	-- Changes the width to be the same as the screen
ground.width = display.contentWidth
	-- Add to physics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})


-- Beam
local beam = display.newImage("Images/beam.png",)
